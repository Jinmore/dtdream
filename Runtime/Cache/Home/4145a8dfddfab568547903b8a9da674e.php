<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><?php $str=get_category($_GET['catid'],'title'); if(!empty($str)) echo $str.' - '; echo C('WEB_SITE_TITLE');?></title>
    <meta name="keywords" content="<?php echo C('WEB_SITE_KEYWORD');?>">
    <meta name="description" content="<?php echo C('WEB_SITE_DESCRIPTION');?>">
    <link href="/Public/Home/css/swiper.min.css" rel="stylesheet" type="text/css">
    <link href="/Public/Home/css/base.css" rel="stylesheet" type="text/css">
    <link href="/Public/Home/css/index.css" rel="stylesheet" type="text/css">
    <script src="/Public/Home/js/jquery-1.8.2.min.js"></script>
    <script src="/Public/Home/js/swiper.min.js"></script>
    <script src="/Public/Home/js/Validform_v5.3.2_min.js"></script>
    <script src="/Public/Home/js/time.min.js"></script>
    <script src="/Public/Home/js/base.js"></script>
</head>
<body>
<!--top/header/list-->
<div class="inner">
    <div class="top clearBoth">
        <a href="<?php echo U('User/login');?>" class="sign fl">亲,请登录</a>
        <ul class="fr clearBoth">
            <li><a href="<?php echo get_category(91,'url');?>" target="_blank">我的订单</a></li>
            <li><a href="<?php echo get_category(92,'url');?>" target="_blank">我的数梦</a></li>
            <li><a href="<?php echo U('Article/index',array('category'=>get_category(93,'name'),'catid'=>93));?>">客服中心</a></li>
            <li><a href="<?php echo U('Article/index',array('category'=>get_category(94,'name'),'catid'=>94));?>">合作服务</a></li>
            <li><a href="<?php echo U('Article/index',array('category'=>get_category(95,'name'),'catid'=>95));?>">规则中心</a></li>
            <li><a href="<?php echo U('Article/index',array('category'=>get_category(96,'name'),'catid'=>96));?>">关于我们</a></li>
        </ul>
    </div>
    <div class="header">
        <a href="" class="logo fl"><img src="/Public/Home/images/logo_03.png"></a>
        <form class="registerform fl clearBoth"  name="search_form" url="<?php echo U('Article/lists',array('category'=>get_category(82,'name')),true,true);?>">
            <input type="text" placeholder="请输入关键字" name="keyword" id="keyword" class="fl" datatype="*" nullmsg="请输入搜索内容" value="<?php echo I('keyword');?>">
            <input type="button" class="fl" id="button" value="">
        </form>
        <a href="" class="shop fl"><img src="/Public/Home/images/shop_03.jpg"></a>
    </div>
</div>
<script type="text/javascript">
$(function(){


  // $(".registerform #keyword").keydown(function(event)
  // {
  //   var url = $(this).parent().attr('url');
  //   var keyword = $(this).val();
  //   if(event.keyCode==13)
  //   {
  //     // alert(url);
  //     // var query  = $('.registerform').find('input').serialize();
  //     // query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
  //     // query = query.replace(/^&/g,'');
  //     // if( url.indexOf('?')>0 ){
  //     //   url += '&' + query;
  //     // }else{
  //     //   url += '?' + query;
  //     // }
  //     alert(url);
  //     window.location.href ="http://www.baidu.com";
  //   }
  // });
  $(".registerform #button").click(function(){
    var url = $(this).parent().attr('url');
    var keyword = $(this).parent().find('#keyword').val();
    if(keyword==''){
      $.Showmsg('关键字不能为空');
      return false;
    }
    var query  = $('.registerform').find('input').serialize();
    query = query.replace(/(&|^)(\w*?\d*?\-*?_*?)*?=?((?=&)|(?=$))/g,'');
    query = query.replace(/^&/g,'');
    if( url.indexOf('?')>0 ){
      url += '&' + query;
    }else{
      url += '?' + query;
    }
    window.location.href = url+'#shuaixuan';
  });
})


</script>

<div class="inner2">
    <div class="list">
        <div class="inner clearBoth">
            <a href="javascript:;" class="product fl">产品分类</a>
            <ul class="fl clearBoth">
              <li <?php if( ACTION_NAME == 'index' and CONTROLLER_NAME == 'Index' ): ?>class="color"<?php endif; ?>><a href="<?php echo DOMAIN;?>">首页</a></li>
              <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?><li <?php if($nav['id']==$_GET['ccid']) echo "class='color';"?>><a href="<?php echo ($nav["url"]); ?>"><?php echo ($nav["title"]); if($nav['id']==2):?><span></span><?php endif;?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

            </ul>
        </div>
    </div>

</div>
<div class="banner">
  <!-- banner -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
          <?php $category=D('Category')->getChildrenId('40');$__LIST__ = D('Document')->page(1,10)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$article): $mod = ($i % 2 );++$i;?><div class="swiper-slide"><img src="<?php echo get_cover($article['cover_id'],$field = path);?>"></div><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
        <div class="swiper-pagination"></div>
    </div>
    <div class="inner">
      <ul class="bannerUl">
          <li class="li1">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(48,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">


              <li><a href="<?php echo U('Article/detail?id=11'.'&catid=55');?>"><?php echo get_category(55,'title');?></a></li>
              <li><a href="<?php echo U('Article/detail?id=10'.'&catid=56');?>"><?php echo get_category(56,'title');?></a></li>

              </ul>
          </li>
          <li class="li2">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(49,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">
                <li><a href="<?php echo U('Article/detail?id=12'.'&catid=57');?>"><?php echo get_category(57,'title');?></a></li>
                <li><a href="<?php echo U('Article/detail?id=13'.'&catid=58');?>"><?php echo get_category(58,'title');?></a></li>
                <li><a href="<?php echo U('Article/detail?id=14'.'&catid=59');?>"><?php echo get_category(59,'title');?></a></li>
                <li><a href="<?php echo U('Article/detail?id=15'.'&catid=60');?>"><?php echo get_category(60,'title');?></a></li>

              </ul>
          </li>
          <li class="li3">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(50,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">
                <li><a href="<?php echo U('Article/detail?id=16'.'&catid=61');?>"><?php echo get_category(61,'title');?></a></li>


              </ul>
          </li>
          <li class="li4">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(51,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">


              <li><a href="<?php echo U('Article/detail?id=17'.'&catid=62');?>"><?php echo get_category(62,'title');?></a></li>


              </ul>
          </li>
          <li class="li5">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(52,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">

                  <li><a href="<?php echo U('Article/detail?id=21'.'&catid=63');?>"><?php echo get_category(63,'title');?></a></li>
                  <li><a href="<?php echo U('Article/detail?id=20'.'&catid=64');?>"><?php echo get_category(64,'title');?></a></li>
                  <li><a href="<?php echo U('Article/detail?id=19'.'&catid=65');?>"><?php echo get_category(65,'title');?></a></li>
                  <li><a href="<?php echo U('Article/detail?id=18'.'&catid=66');?>"><?php echo get_category(66,'title');?></a></li>

              </ul>
          </li>
          <li class="li6">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(53,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">

                <li><a href="<?php echo U('Article/index',array('category'=>get_category(67,'name'),'catid'=>67));?>"><?php echo get_category(67,'title');?></a></li>
                <li><a href="<?php echo U('Article/index',array('category'=>get_category(68,'name'),'catid'=>68));?>"><?php echo get_category(68,'title');?></a></li>

              </ul>
          </li>
          <li class="li7">
              <a href="javascript:;" class="clearBoth">
                  <div class="icon fl"></div>
                  <p class="fl"><?php echo get_category(54,'title');?></p>
                  <div class="arrow fr"></div>
              </a>
              <ul class="ul-two">

                <li><a href="<?php echo U('Article/index',array('category'=>get_category(69,'name'),'catid'=>69));?>"><?php echo get_category(69,'title');?></a></li>
                <li><a href="<?php echo U('Article/index',array('category'=>get_category(70,'name'),'catid'=>70));?>"><?php echo get_category(70,'title');?></a></li>

              </ul>
          </li>


      </ul>
    </div>
</div>

<!--news-main-->
<div class="news-main">
    <div class="inner">
      <div class="base-line clearBoth">
          <div class="box fl"></div>
          <p class="fl"><?php echo get_category($_GET['catid'],'title');?></p>
          <ul class="fr clearBoth">
              <li <?php if($_GET['catid']==83) echo "class='bg'";?> ><a href="<?php echo U('Article/index',array('category'=>get_category(83,'name'),'catid'=>83));?>"><?php echo get_category(83,'title');?></a></li>
              <li <?php if($_GET['catid']==84) echo "class='bg'";?>><a href="<?php echo U('Article/index',array('category'=>get_category(84,'name'),'catid'=>84));?>"><?php echo get_category(84,'title');?></a></li>
              <li <?php if($_GET['catid']==85) echo "class='bg'";?>><a href="<?php echo U('Article/index',array('category'=>get_category(85,'name'),'catid'=>85));?>"><?php echo get_category(85,'title');?></a></li>
          </ul>
      </div>
        <div class="news-content">
            <div class="title"><?php echo ($info['title']); ?></div>
            <p>发布时间：<?php echo (date('Y-m-d',$info["create_time"])); ?><span>来源：数梦工场</span>浏览：<?php echo ($info["view"]); ?>次</p>
        </div>
        <div class="news-con">
          <?php echo ($info['content']); ?>
        </div>
        <div class="pre clearBoth">
          <?php $prev = D('Document')->next($info); if(!empty($prev)): ?><p class="fl">上一篇：<a href="<?php echo U('?id='.$prev['id'].'&catid='.$_GET['catid']);?>"><?php echo ($prev['title']); ?></a></p><?php endif; ?>
          <?php $next = D('Document')->prev($info); if(!empty($next)): ?><p class="fr">下一篇：<a href="<?php echo U('?id='.$next['id'].'&catid='.$_GET['catid']);?>"><?php echo ($next['title']); ?></a></p><?php endif; ?>
        </div>
    </div>
</div>
<div class="footer">
    <div class="inner clearBoth">
        <dl>
            <dt>产品服务</dt>
            <dd><a href="<?php echo U('Article/detail?id=11'.'&catid=55');?>"><?php echo get_category(48,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/detail?id=12'.'&catid=57');?>"><?php echo get_category(49,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/detail?id=16'.'&catid=61');?>"><?php echo get_category(50,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/detail?id=17'.'&catid=62');?>"><?php echo get_category(51,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/detail?id=21'.'&catid=63');?>"><?php echo get_category(52,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category(67,'name'),'catid'=>67));?>"><?php echo get_category(53,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category(69,'name'),'catid'=>69));?>"><?php echo get_category(54,'title');?></a></dd>
        </dl>
        <dl>
            <dt>解决方案</dt>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category(79,'name'),'catid'=>79));?>"><?php echo get_category(79,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category(80,'name'),'catid'=>80));?>"><?php echo get_category(80,'title');?></a></dd>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category(81,'name'),'catid'=>81));?>"><?php echo get_category(81,'title');?></a></dd>
        </dl>
        <dl>
            <dt>服务支持</dt>
            <?php for($i=83;$i<=85;$i++):?>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category($i,'name'),'catid'=>$i));?>"><?php echo get_category($i,'title');?></a></dd>
           <?php endfor;?>
        </dl>
        <dl>
            <dt>新闻动态</dt>
            <?php for($i=87;$i<=89;$i++):?>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category($i,'name'),'catid'=>$i));?>"><?php echo get_category($i,'title');?></a></dd>
           <?php endfor;?>
        </dl>
        <dl>
            <dt>联系我们</dt>
            <dd><a href="<?php echo U('Article/index',array('category'=>get_category(90,'name'),'catid'=>90));?>"><?php echo get_category(90,'title');?></a></dd>
            <dd>400-600-1818</dd>
            <dd>365天无休服务 24小时在线</dd>
        </dl>
    </div>
</div>
<div class="copy">
    <div class="inner">Copyright © 2017 云服务器(www.baidu.com) All Rights Reserved <?php echo C('WEB_SITE_ICP');?></div>
</div>
<div id="test">
    <ul>
        <li class="li1">
            <a href="">
                <div class="icon"></div>
                <p>在线客服</p>
            </a>
        </li>
        <li class="line"></li>
        <li class="li2">
            <a href="">
                <div class="icon"></div>
                <p>购物车</p>
            </a>
        </li>
        <li class="line"></li>
        <li class="li3">
            <a href="">
                <div class="icon"></div>
                <p>问题反馈</p>
            </a>
        </li>
        <li class="line"></li>
        <li class="li4">
            <a href="javascript:;">
                <div class="icon"></div>
                <p>返回顶部</p>
            </a>
        </li>
    </ul>
</div>
</body>
</html>