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
<div class="top clearBoth">
  <div class="inner">


    <?php if(!empty($user_name)): ?>&nbsp;&nbsp;欢迎您：<?php echo ($user_name); ?> <a href="<?php echo U('User/logout');?>" class="sign fl">退出</a>
    <?php else: ?>
    <a href="<?php echo U('User/login');?>" class="sign fl" style="margin-right:20px;">亲，请登录</a>
    <a href="<?php echo U('User/register');?>" class="sign fl">我要注册</a><?php endif; ?>
    <ul class="fr clearBoth">
        <li><a href="<?php echo get_category(91,'url'); echo cas_check('http://47.93.225.150/manage/view/index.html#/account/pm-order');?>" target="_blank">我的订单</a></li>
        <li><a href="<?php echo get_category(92,'url'); echo cas_check('http://47.93.225.150/manage');?>" target="_blank">我的数梦</a></li>
        <li><a href="<?php echo U('Article/index',array('category'=>get_category(93,'name'),'catid'=>93));?>">客服中心</a></li>
        <li><a href="<?php echo U('Article/index',array('category'=>get_category(94,'name'),'catid'=>94));?>">合作服务</a></li>
        <li><a href="<?php echo U('Article/index',array('category'=>get_category(95,'name'),'catid'=>95));?>">规则中心</a></li>
        <li><a href="<?php echo U('Article/index',array('category'=>get_category(96,'name'),'catid'=>96));?>">关于我们</a></li>
    </ul>
    </div>
</div>
<div class="inner">

    <div class="header">
        <a href="" class="logo fl"><img src="/Public/Home/images/logo_03.png"></a>
        <!-- <form class="registerform fl clearBoth"  name="search_form" url="<?php echo U('Article/lists',array('category'=>get_category(82,'name')),true,true);?>">
            <input type="text" placeholder="请输入关键字" name="keyword" id="keyword" class="fl" datatype="*" nullmsg="请输入搜索内容" value="<?php echo I('keyword');?>">
            <input type="button" class="fl" id="button" value="">
        </form> -->
        <form class="registerform11 fl clearBoth"  name="search_form" method="get" >
            <input type="text" placeholder="请输入关键字" name="keyword" id="keyword" class="fl" datatype="*" nullmsg="请输入搜索内容" value="<?php echo I('keyword');?>">
            <input type="submit" class="fl"  value="">
        </form>
        <a href="<?php echo U('user/car');?>" class="shop fl"><img src="/Public/Home/images/shop_03.png"><span><?php if(cookie('num')) echo cookie('num');else echo 0;?></span></a>
    </div>
</div>

<script type="text/javascript">
 $(function(){
   $(".registerform11").Validform({
       tiptype:1
    });

$("#keyword").blur(function(){
    var action="<?php echo U('Article/lists',array('category'=>get_category(82,'name')),"",false);?>"+"/keyword/"+$(this).val();
   $(".registerform11").attr("action",action);
});
$("#keyword").keydown(function(){
  var action="<?php echo U('Article/lists',array('category'=>get_category(82,'name')),"",false);?>"+"/keyword/"+$(this).val();
 $(".registerform11").attr("action",action);
});

 })
</script>

<div class="inner2">
    <div class="list">
        <div class="inner clearBoth">
            <a href="javascript:;" class="product fl">产品分类</a>
            <ul class="fl clearBoth">
              <li <?php if( ACTION_NAME == 'index' and CONTROLLER_NAME == 'Index' ): ?>class="color"<?php endif; ?>><a href="<?php echo DOMAIN;?>">首页</a></li>
              <?php $__NAV__ = M('Channel')->field(true)->where("status=1")->order("sort")->select(); if(is_array($__NAV__)): $i = 0; $__LIST__ = $__NAV__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?><li <?php if($nav['id']==$_GET['ccid']) echo "class='color';"?>><a href="<?php echo ($nav["url"]); ?>" <?php if($nav['target']==1) echo "target='_bank'";?>><?php echo ($nav["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

            </ul>
        </div>
    </div>

</div>
<div class="banner">
  <!-- banner -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
          <?php $category=D('Category')->getChildrenId('40');$__LIST__ = D('Document')->page(1,10)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$article): $mod = ($i % 2 );++$i;?><!-- <?php var_dump($article);?> -->
            <div class="swiper-slide"><img src="<?php echo get_cover($article['cover_id'],$field = path);?>"></div><?php endforeach; endif; else: echo "" ;endif; ?>
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

<!--main-->
<div class="main">
    <div class="inner">
        <!--云产品-->
        <div class="baseTitle">
            <div class="baseTxt baseTxt-you clearBoth">
                <img src="/Public/Home/images/you1_03.jpg" class="fl">
                <h3 class="fl">培训课程和认证考试</h3>
            </div>
        </div>
        <ul class="yun yun-you clearBoth">
          <?php $category=D('Category')->getChildrenId(97);$__LIST__ = D('Document')->page(1,8)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><li>
              <?php
 $strtime=date('Y-m-d',$list['deadline']); $endtime=intval($list['deadline'])-time(); $endday=floor($endtime/86400); $endhour=floor(($endtime-($endday*86400))/3600); ?>

              <input type="hidden" class="strtime" value="<?php echo ($strtime); ?>">
                <div class="time">倒计时
                    <span class="day"><?php echo ($endday); ?></span> 天
                    <span class="hour"><?php echo ($endhour); ?></span> 时
                </div>
                <a href="<?php echo U('Article/detail?id='.$list['id'].'&catid=42');?>" class="you-a"><?php echo (msubstr($list['title'],0,7)); ?></a>
                <div class="txt"><?php echo (msubstr($list['description'],0,47)); ?></div>
                <a href="<?php echo U('Article/detail?id='.$list['id'].'&catid=42');?>"><img width="106" height="99" src="<?php echo get_cover($list['cover_id'],$field = path);?>"></a>
                <div class="bot">
                    <div class="bot-box clearBoth">
                        <a href="<?php echo ($list['ljxg']); ?>" class="a1 fl">立即选购</a>
                        <div class="a2 fl"><?php echo ($list['price']); ?>元起</div>
                    </div>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <div class="baseTitle">
            <div class="baseTxt clearBoth">
                <img src="/Public/Home/images/yun_03.jpg" class="fl">
                <h3 class="fl">云产品</h3>
            </div>
        </div>
        <!--培训课程-->
        <ul class="yun yun-you clearBoth">
          <?php $category=D('Category')->getChildrenId(98);$__LIST__ = D('Document')->page(1,8)->lists($category, '`level` DESC,`id` DESC', 1,true); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><li>
              <?php
 $strtime=date('Y-m-d',$list['deadline']); $endtime=intval($list['deadline'])-time(); $endday=floor($endtime/86400); $endhour=floor(($endtime-($endday*86400))/3600); ?>
                <div class="time">倒计时
                    <span class="day"><?php echo ($endday); ?></span> 天
                    <span class="hour"><?php echo ($endhour); ?></span> 时
                </div>
                <a href="<?php echo U('Article/detail?id='.$list['id'].'&catid=42');?>" class="you-a"><?php echo (msubstr($list['title'],0,7)); ?></a>
                <div class="txt"><?php echo (msubstr($list['description'],0,47)); ?></div>
                <a href="<?php echo U('Article/detail?id='.$list['id'].'&catid=42');?>"><img width="106" height="99" src="<?php echo get_cover($list['cover_id'],$field = path);?>"></a>
                <div class="bot">

                    <div class="bot-box clearBoth">
                      <a href="<?php echo ($list['ljxg']); ?>" class="a1 fl">立即选购</a>
                      <div class="a2 fl"><?php echo ($list['price']); ?>元起</div>
                    </div>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>


        </ul>
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
            <a href="tencent://message/?uin=<?php echo C('WEB_ON_LINE');?>&在线咨询&Menu=yes">
                <div class="icon"></div>
                <p>在线客服</p>
            </a>
        </li>
        <li class="line"></li>
        <li class="li2">
            <a href="<?php echo U('user/car');?>">
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