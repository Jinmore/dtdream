<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class ArticleController extends HomeController {

    /* 文档模型频道页 */
	public function index($p = 1){
		/* 分类信息 */
		$category = $this->category();

		//频道页只显示模板，默认不读取任何内容
		//内容可以通过模板标签自行定制
    //内容可以通过模板标签自行定制
		$template = $category['template_index'];
		switch($category['is_page']){
			case 1:
				$template = $category['template_page'];
				break;
			case 2:
				header("Location: " . get_link($category['link_id']));
				break;
		}


		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->display($category['template_index']);
	}
  // 公告
  public function gonggao()
  {
    $category = $this->category();

    $id=$_GET['id'];
    $model=D('Document')->alias('a');
    // --------------设置分页效果显示数据---------------------
    $count=$model->count();
    $Page= new \Think\Page($count,6);// 实例化分页类 传入总记录数和每页显示的记录数(25)
   // 输出分页
    $Page->setConfig('prev','上一页');
    $Page->setConfig('next','下一页');
    $show=$Page->show();
    $data=$model->join('left join o_document_article b on a.id=b.id ')
    ->where(array('category_id'=>73))
    ->field('a.*,b.*')
    ->order('a.level desc')
    ->limit($Page->firstRow.','.$Page->listRows) //分页功能
    ->select();
    $this->assign(array('show'=>$show,'data'=>$data));
    var_dump($data);
    $this->display($category['template_index']);
  }
  public function search()
  {

  }

	/* 文档模型列表页 */
	public function lists($p = 1){
		/* 分类信息 */
		$category = $this->category();

		/* 获取当前分类列表 */

		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id']);
		if(false === $list){
			$this->error('获取列表数据失败！');
		}

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('list', $list);
    // var_dump(I('get.'));
    // 搜索字段
    $search = I('get.');
    if($search['keyword'])
    {

      $count=$Document
      ->where(array('category_id'=>array('in','83,84,85'),'title'=>array('like',"%$search[keyword]%")))
      ->count();
      $Page = new \Think\Page($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
      $Page->setConfig('prev','上一页');
      $Page->setConfig('next','下一页');
      $list=$Document
      ->where(array('category_id'=>array('in','83,84,85'),'title'=>array('like',"%$search[keyword]%")))
      ->limit($Page->firstRow.','.$Page->listRows)
      ->select();

			$show = $Page->show();// 分页显示输出
      // echo "<pre>";
      //  var_dump($data);
      // echo "</pre>";
      $this->assign("list",$list);
      $this->assign("show",$show);
      $this->display("search_gonggao");
      exit();
    }
		$this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0, $p = 1){
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}

		/* 页码检测 */
		$p = intval($p);
		$p = empty($p) ? 1 : $p;

		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}

		/* 分类信息 */
		$category = $this->category($info['category_id']);

		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}

		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');

		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
		$this->display($tmpl);
	}

	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}

		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
				//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}

}
