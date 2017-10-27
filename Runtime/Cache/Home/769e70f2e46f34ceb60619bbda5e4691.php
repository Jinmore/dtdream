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
        <!--帮助-->
        <ul class="help clearBoth">
            <li>
                <a href="#" class="clearBoth">
                    <img src="/Public/Home/images/help_03.jpg" class="fl">
                    <div class="help-right fl">
                        <div class="title">帮助咨询</div>
                        <p>期待帮您解决诉求</p>
                    </div>
                </a>
            </li>
            <li>
                <a href="#" class="clearBoth">
                    <img src="/Public/Home/images/help_05.jpg" class="fl">
                    <div class="help-right fl">
                        <div class="title">解决方案</div>
                        <p>期待帮您解决诉求</p>
                    </div>
                </a>
            </li>
            <li>
                <a href="#" class="clearBoth">
                    <img src="/Public/Home/images/help_07.jpg" class="fl">
                    <div class="help-right fl">
                        <div class="title">服务支持</div>
                        <p>期待帮您解决诉求</p>
                    </div>
                </a>
            </li>
            <li>
                <a href="#" class="clearBoth">
                    <img src="/Public/Home/images/help_09.jpg" class="fl">
                    <div class="help-right fl">
                        <div class="title">安全保障</div>
                        <p>期待帮您解决诉求</p>
                    </div>
                </a>
            </li>
        </ul>
        <!--优惠-->
        <div class="discount clearBoth">
            <div class="left fl">
                <div class="discount-top">
                    <div class="title">特惠产品</div>
                    <div class="title2">限时特惠赶快来抢</div>
                </div>
                <img src="/Public/Home/images/discount_03.jpg">
            </div>
            <ul class="right fr clearBoth">
              <?php $__POSLIST__ = D('Document')->position(8,'55,56,57,58,59,60,61,62,63,64,65,66',4,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ptop): $mod = ($i % 2 );++$i;?><li>
                  <a href="<?php echo U('Article/detail?id='.$ptop['id'].'&catid='.$ptop['category_id']);?>" class="title"><?php echo (msubstr($ptop['title'],0,8)); ?></a>
                  <div class="text">
                      <?php echo ($ptop['description']); ?>
                  </div>
                  <div  class="new-a2" ><?php echo ($ptop['price']); ?>元起</div>
                  <div class="bot clearBoth">
                      <a href="<?php echo ($ptop['ljxg']); ?>" class="a2 fr" target="_blank">立即选购</a>
                  </div>
                  <img src="/Public/Home/images/te_03.png" class="te">
              </li><?php endforeach; endif; else: echo "" ;endif; ?>

            </ul>
        </div>
        <!--云产品-->
        <div class="baseTitle">
            <div class="baseTxt clearBoth">
                <img src="/Public/Home/images/yun_03.jpg" class="fl">
                <h3 class="fl">云产品</h3>
            </div>
        </div>
        <ul class="yun clearBoth">
          <?php $__POSLIST__ = D('Document')->position(16,'55,56,57,58,59,60,61,62,63,64,65,66,67,68',14,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ptop2): $mod = ($i % 2 );++$i;?><li>
                <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>"><img src="<?php echo get_cover($ptop2['cover_id'],$field = path);?>"></a>
                <div class="text">
                    <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>"><?php echo (msubstr($ptop2['title'],0,8)); ?></a>
                      <?php echo (msubstr($ptop2['description'],0,45)); ?>
                </div>
                <div class="bot clearBoth">
                  <div class="a2 fl"><?php echo ($ptop2['price']); ?>元起</div>
                  <a href="<?php echo ($ptop2['ljxg']); ?>" class="a1 fr" target="_blank">立即选购</a>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
            <li class="last"><a href="<?php echo U('Article/index',array('category'=>get_category(76,'name'),'catid'=>76));?>"><img src="<?php echo get_cover((get_category(76,'icon')),$field = path);?>"></a></li>
        </ul>
        <div class="baseTitle">
            <div class="baseTxt clearBoth">
                <img src="/Public/Home/images/yun2_03.jpg" class="fl">
                <h3 class="fl">培训课程</h3>
            </div>
        </div>
        <!--培训课程-->
        <ul class="yun ke clearBoth">
          <?php $__POSLIST__ = D('Document')->position(4,'67,68',5,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ptop2): $mod = ($i % 2 );++$i;?><li>
                <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>"><img src="<?php echo get_cover($ptop2['cover_id'],$field = path);?>"></a>
                <div class="text">
                    <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>"><?php echo (msubstr($ptop2['title'],0,8)); ?></a>
                    <?php echo (msubstr($ptop2['description'],0,45)); ?>
                </div>
                <div class="bot clearBoth">
                  <div class="a2 fl"><?php echo ($ptop2['price']); ?>元起</div>
                    <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>" class="a1 fr" target="_blank">立即选购</a>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>

            <li class="last"><a href="<?php echo U('Article/index',array('category'=>get_category(75,'name'),'catid'=>75));?>"><img src="<?php echo get_cover((get_category(75,'icon')),$field = path);?>"></a></li>
        </ul>
        <div class="baseTitle">
            <div class="baseTxt clearBoth">
                <img src="/Public/Home/images/re_11.jpg" class="fl">
                <h3 class="fl">认证考试</h3>
            </div>
        </div>
        <ul class="yun ke clearBoth">
            <?php $__POSLIST__ = D('Document')->position(4,'69,70',4,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ptop2): $mod = ($i % 2 );++$i;?><li>
                <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>"><img src="<?php echo get_cover($ptop2['cover_id'],$field = path);?>"></a>
                <div class="text">
                    <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>"><?php echo (msubstr($ptop2['title'],0,8)); ?></a>
                    <?php echo (msubstr($ptop2['description'],0,45)); ?>
                </div>
                <div class="bot clearBoth">
                    <div class="a2 fl"><?php echo ($ptop2['price']); ?>元起</div>
                    <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid='.$ptop2['category_id']);?>" class="a1 fr" target="_blank">立即选购</a>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <!--头条-->
        <div class="top-line clearBoth">
            <div class="left fl">
                <div class="baseTop clearBoth">
                    <div class="line fl"></div>
                    <div class="title fl">头条</div>
                    <a href="<?php echo U('Article/index',array('category'=>get_category(72,'name'),'catid'=>72));?>" class="more fr">更多>></a>
                </div>
                <ul class="topLineUl">
                  <?php $__POSLIST__ = D('Document')->position(4,'72',2,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ptop2): $mod = ($i % 2 );++$i;?><li class="clearBoth">
                        <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid=72');?>" class="left fl"><img src="<?php echo get_cover($ptop2['cover_id'],$field = path);?>"></a>
                        <div class="li-right fl">
                            <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid=72');?>" class="title"><?php echo ($ptop2['title']); ?></a>
                            <div class="text">
                              <?php echo ($ptop2['description']); ?>
                                <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid=72');?>" class="xi">【详细】</a>
                            </div>
                        </div>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>

                </ul>
            </div>
            <div class="right fr">
                <div class="baseTop clearBoth">
                    <div class="line fl"></div>
                    <div class="title fl">公告</div>
                    <a href="<?php echo U('Article/index',array('category'=>get_category(73,'name'),'catid'=>73));?>" class="more fr">更多>></a>
                </div>
                <ul class="teaUl">
                  <?php $__POSLIST__ = D('Document')->position(4,'73',3,true); if(is_array($__POSLIST__)): $i = 0; $__LIST__ = $__POSLIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ptop2): $mod = ($i % 2 );++$i;?><li>
                        <div class="teach clearBoth">
                            <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid=73');?>" class="a1 fl"><?php echo ($ptop2['biaoqian']); ?></a>
                            <a href="<?php echo U('Article/detail?id='.$ptop2['id'].'&catid=73');?>" class="a2 fl"><?php echo ($ptop2['title']); ?></a>
                        </div>
                        <p>  <?php echo (msubstr($ptop2['description'],0,30)); ?></p>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>

                </ul>
            </div>
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