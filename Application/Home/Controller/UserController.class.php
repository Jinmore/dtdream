<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use User\Api\UserApi;
use phpCAS;

/**
 * 用户控制器
 * 包括用户中心，用户登录及注册
 */
class UserController extends HomeController {

	/* 用户中心首页 */
	public function index(){

	}
	public function _request($curl, $https=true, $method='get', $data=null){
		$ch = curl_init();//初始化
		curl_setopt($ch, CURLOPT_URL, $curl);//设置访问的URL
		curl_setopt($ch, CURLOPT_HEADER, false);//设置不需要头信息
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);//只获取页面内容，但不输出
		if($https){
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//不做服务器认证
			curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);//不做客户端认证
		}
		if($method == 'post'){
			curl_setopt($ch, CURLOPT_POST, true);//设置请求是POST方式
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);//设置POST请求的数据
			curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        		'Content-Type: application/json',
        		'Content-Length: '. strlen($data))
					);
		}
		$str = curl_exec($ch);//执行访问，返回结果
		curl_close($ch);//关闭curl，释放资源
		return $str;
	}
// 购物车
	public function car()
	{

		if($_GET['productid'])
		{
			// 获取商品数据
      $arr=array();
			$arr['productid']=trim($_GET['productid']);
			$arr['image']=trim($_GET['image']);
			$arr['name']=trim($_GET['name']);
			$arr['num']=intval($_GET['num']);
			$arr['price']=trim($_GET['price']);
				// 存入cookie
	    $data=cookie('product');
			$data=unserialize($data);
			$data=isset($data)? $data:array();
			// 将商品id作为数组下标
			$key=$arr['productid'];
			if(isset($data[$key]))
			{
				// 存在商品，数量相加
				$data[$key]['num']+=$arr['num'];
			}else
			{
				$data[$key]=$arr;
			}
			$num=0;
		 foreach($data as $v)
		 {
			 $num+=$v['num'];
		 }
		 cookie('num',$num,3600*24);

		 cookie('product',serialize($data),3600*24);
     echo json_encode(array("status"=>1));
		}else
		{
			$data=cookie('product');
			$data=unserialize($data);
			$num=0;
		 foreach($data as $v)
		 {
			 $num+=$v['num'];
		 }
		 cookie('num',$num,3600*24);
			// var_dump($data);
      $this->assign('data',$data);
			$this->display();
		}
	}
	// 刪除購物車
public function del()
{
	$id=$_GET['productid'];
	$data=cookie('product');
	$data=unserialize($data);
	unset($data[$id]);
	cookie('product',serialize($data),3600*24);
	echo json_encode(array("status"=>1));
}
// 創建訂單
public function createorder()
{
	if($_POST)
	{
		if(null ==session('user_name'))
		{
			echo json_encode(array("result"=>'failed',"errorMsg"=>"请您先登录后再提交订单！","code"=>"1"));
			die();
		}
		$data=$_POST;
		// 提取子訂單
		$str=$data['data'];
		$order_arr=explode(",",$str);
		$order_data=array();
		foreach($order_arr as $v)
		{
      if($v)
			{
				$arr=explode("-",$v);
				$arr_sub['cost']=$arr[2]/$arr[1];//小計
				$arr_sub['productType']='SIMPLE';//類型
				$arr_sub['productName']=$arr[0];
				$arr_sub['configs']="地域cn-beijin,负载均衡名称:test";
				$arr_sub['endDateStr']="2018-01-01";
				$arr_sub['createNum']=intval($arr[1]);
        $order_data[]=$arr_sub;
				// 取得產品id 提交訂單，清空購物車
				$productid=$arr[3];
				$cookie_data=cookie('product');
				$cookie_data=unserialize($data);
				unset($cookie_data[$productid]);
				cookie('product',serialize($cookie_data),3600*24);
			}
		}
		$total=$data['total'];
		// 拼接訂單信息
		$info=array();
		$info['cost']=$total;
    $info['userName']=session('user_name');
		$info['subOrderRequestsJson']=$order_data;
    $info= json_encode($info);
		$url=C('WEB_CREATE_ORDER');
		$akId=C('ACCESSKEYID');
		$secret=C('ACCESSKEYSECRET');
  $result=create_order($akId,$secret,$url,$info);

	echo $result;
	}
}
// 修改數量
public function editnum()
{
	if($_GET['productid'])
	{
		$productid=intval($_GET['productid']);
		$num=intval($_GET['num']);
		$data=cookie('product');
		$data=unserialize($data);
		$data[$productid]['num']=$num;
		cookie('product',serialize($data),3600*24);
		echo json_encode(array("status"=>1));
	}
}
 public function register()
 {

	 if(IS_POST)
	 {
		   $url=C('WEB_REGISTER');
			 $password=$_POST['password'];
			 $repassword=$_POST['repassword'];
			 $email=$_POST['userEmail'];
			 $phone=$_POST['cellphoneNum'];
			 $str= $this->_request($url."?userEmail=".$email."&password=".$password."&repassword=".$repassword."&cellphoneNum=".$phone,false,'post',$data);
			 echo $str;


	 }else
	 {
		 $this->display();
	 }
 }

	/* 注册页面 */
	public function register11($username = '', $password = '', $repassword = '', $email = '', $verify = ''){
        if(!C('USER_ALLOW_REGISTER')){
            $this->error('注册已关闭');
        }
		if(IS_POST){ //注册用户
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 检测密码 */
			if($password != $repassword){
				$this->error('密码和重复密码不一致！');
			}

			/* 调用注册接口注册用户 */
            $User = new UserApi;
			$uid = $User->register($username, $password, $email);
			if(0 < $uid){ //注册成功
				//TODO: 发送验证邮件
				$this->success('注册成功！',U('login'));
			} else { //注册失败，显示错误信息
				$this->error($this->showRegError($uid));
			}

		} else { //显示注册表单
			$this->display();
		}
	}

	public function login()
	{
		header('P3P: CP="CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR"');

		if (!phpCAS::checkAuthentication()) {
			//检测是否经过身份验证
			session('user_name', null);
			phpCAS::forceAuthentication();
			/* 此方法如果用户还没有通过身份验证，则该方法被调用强制身份验证。
      如果用户未经身份验证，则通过重定向到 CAS服务器。跳转到cas server 登录页*/
			return ;
		}

		$user_name = phpCAS::getUser();

		session('user_name', $user_name);
    if($_COOKIE['car_login']=="car")
		{
			//  $this->success("登录成功",U("user/car"));
			$this->redirect("/user/car");
		}else{
			$this->redirect('/');
		}

	}

	/* 登录页面 */
	public function login_bak($username = '', $password = '', $verify = ''){
		if(IS_POST){ //登录验证
			/* 检测验证码 */
			if(!check_verify($verify)){
				$this->error('验证码输入错误！');
			}

			/* 调用UC登录接口登录 */
			$user = new UserApi;
			$uid = $user->login($username, $password);
			if(0 < $uid){ //UC登录成功
				/* 登录用户 */
				$Member = D('Member');
				if($Member->login($uid)){ //登录用户
					//TODO:跳转到登录前页面
					$this->success('登录成功！',U('Home/Index/index'));
				} else {
					$this->error($Member->getError());
				}

			} else { //登录失败
				switch($uid) {
					case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
					case -2: $error = '密码错误！'; break;
					default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
				}
				$this->error($error);
			}

		} else { //显示登录表单
			$this->display();
		}
	}

	public function logout()
	{
		header('P3P: CP="CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR"');
		session('user_name', null);
		session(null);
		$home = U('/', '', true, true);
		phpCAS::logoutWithRedirectService($home);
	}

	/* 退出登录 */
	public function logout_bak(){
		if(is_login()){
			D('Member')->logout();
			$this->success('退出成功！', U('User/login'));
		} else {
			$this->redirect('User/login');
		}
	}

	/* 验证码，用于登录和注册 */
	public function verify(){
		$verify = new \Think\Verify();
		$verify->entry(1);
	}

	/**
	 * 获取用户注册错误信息
	 * @param  integer $code 错误编码
	 * @return string        错误信息
	 */
	private function showRegError($code = 0){
		switch ($code) {
			case -1:  $error = '用户名长度必须在16个字符以内！'; break;
			case -2:  $error = '用户名被禁止注册！'; break;
			case -3:  $error = '用户名被占用！'; break;
			case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
			case -5:  $error = '邮箱格式不正确！'; break;
			case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
			case -7:  $error = '邮箱被禁止注册！'; break;
			case -8:  $error = '邮箱被占用！'; break;
			case -9:  $error = '手机格式不正确！'; break;
			case -10: $error = '手机被禁止注册！'; break;
			case -11: $error = '手机号被占用！'; break;
			default:  $error = '未知错误';
		}
		return $error;
	}


    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function profile(){
		if ( !is_login() ) {
			$this->error( '您还没有登陆',U('User/login') );
		}
        if ( IS_POST ) {
            //获取参数
            $uid        =   is_login();
            $password   =   I('post.old');
            $repassword = I('post.repassword');
            $data['password'] = I('post.password');
            empty($password) && $this->error('请输入原密码');
            empty($data['password']) && $this->error('请输入新密码');
            empty($repassword) && $this->error('请输入确认密码');

            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }

            $Api = new UserApi();
            $res = $Api->updateInfo($uid, $password, $data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
        }else{
            $this->display();
        }
    }

}
