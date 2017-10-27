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

<!--news-main-->
<form class="registerf" method="post">
<div class="news-main shop-main">
    <div class="inner">
        <ul class="shopUl clearBoth">
            <li>
                <label class="option clearBoth">
                    <input type="checkbox" value="" class="fl">
                    <p class="fl">全选</p>
                </label>
            </li>
            <li>编号</li>
            <li>商品名称</li>
            <li>数量</li>
            <li>单价（元）</li>
            <li>操作</li>
        </ul>
        <ul class="shopBul">
          <?php  $num=0;$total=0;?>
          <?php foreach($data as $v):?>
            <li class="clearBoth">
                <div class="box">
                    <?php $xiaoji=intval($v[price])*intval($v[num]);?>
                    <div class="title1"><input type="checkbox" checked="checked" value="<?php echo ($v[name]); ?>"></div>
                    <div class="title2"><?php echo ($v[productid]); ?></div>

                    <div class="title3"><a href="javascript:;"><img src="<?php echo get_cover($v['image'],$field = path);?>"></a></div>
                    <div class="title4"> <a href="javascript:;"><?php echo ($v[name]); ?></a></div>
                    <div class="title5 clearBoth">
                    <div class="baseReduce fl"><img src="/Public/Home/images/add_09.png"></div>
                    <input type="text" value="<?php echo ($v[num]); ?>" class="baseInput fl" datatype="n" nullmsg="请输入购买数量！" errormsg="数量必须为数字！">
                    <div class="baseAdd fl"><img src="/Public/Home/images/add_06.png"></div>
                    </div>
                    <div class="title6"><?php echo ($v[price]); ?></div>

                    <input type="hidden" name="xiaoji" class="xiaoji" value="<?php echo ($xiaoji); ?>">
                    <div class="title7"><a href="javascript:;" onclick="del(<?php echo ($v[productid]); ?>)"><img src="/Public/Home/images/dele_03.png"></a></div>
                </div>
            </li>
            <?php $num+=$v['num'];$total+=$xiaoji;?>
          <?php endforeach;?>
          <?php cookie('number',$num,3600*24);?>
        </ul>
        <div class="allMoney">
            <div class="right fr clearBoth">
                <!-- <div class="title1 fl">合计：</div> -->
                <div class="title2 fl">数量：<span id="total_num"><?php echo ($num); ?></span>件</div>
                <div class="title2 fl">总价：<span id="total"><?php echo ($total); ?></span>元</div>
                <input type="submit" value="提交" class="fl">
            </div>
        </div>
    </div>
</div>
</form>
<script type="text/javascript">
function setCookie(c_name,value,expiredays)
{
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}
function del(productid)
{
  $.ajax({
    url:"<?php echo U('User/del','',false);?>?productid="+productid,
    type:"GET",
    dataType:"json",
    success:function(data)
    {
      // console.log(data);
      if(data.status==1)
      {
        $.Showmsg("刪除成功");
        setTimeout(function()
          {
            window.location.href=location.href;
          },1000);
      }
    }
  });
}

$(function(){
  // 增加
  $('.baseAdd').click(function(){
    var num=$(this).prev().val();
    var price=$(this).parent().next().text();
    var xiaoji=parseInt(num)*parseInt(price);
    $(this).parent().next().next().val(xiaoji);
    //計算縂數量
    var num_=0;
    $('.baseInput').each(function (k,v){
        num_+=parseInt($(this).val());
    });
    $('#total_num').text(num_);
    // 修改cookie商品數量
    var productid=$(this).parent().prev().prev().prev().text();
    $.ajax({
      url:"<?php echo U('user/editnum','',false);?>",
      type:"GET",
      data:{'productid':productid,'num':num},
      dataType:"json",
      success:function(data)
      {
        if(data.status==1)
        {
          window.location.href=location.href;
        }
      }
    });
    //計算縂價格
    var total=0;
    $('.xiaoji').each(function(k,v){
      total+=parseInt($(this).val());
    });
    $('#total').text(total);
  });
  // 減少
  $('.baseReduce').click(function(){
    var num=$(this).next().val();
    var price=$(this).parent().next().text();
    var xiaoji=parseInt(num)*parseInt(price);
    $(this).parent().next().next().val(xiaoji);
    // 計算縂數量
    var n=0;
    $('.baseInput').each(function(k,v){
      n+=parseInt($(this).val());
    });
    $('#total_num').text(n);
    // 修改cookie商品數量
    var productid=$(this).parent().prev().prev().prev().text();
    $.ajax({
      url:"<?php echo U('user/editnum','',false);?>",
      type:"GET",
      data:{'productid':productid,'num':num},
      dataType:"json",
      success:function(data)
      {
        if(data.status==1)
        {
          window.location.href=location.href;
        }
      }
    });
    // 計算縂價格
    var total=0;
    $('.xiaoji').each(function(k,v){
      total+=parseInt($(this).val());
    });
    $('#total').text(total);
  });
// 提交訂單
$(".registerf").Validform({
    tiptype:1,
    callback:function(curform){
              var str='';
              // 勾選縂價格
              var total=0;
              var i=0;
              $('input[type="checkbox"]:checked').each(function(k,v){

                if($(v).val()=='') return true;
                var title=$(v).val();
                var productid=$(v).parent().next().text();
                var o_num=$(v).parent().parent().find('div').eq(4).find('input').eq(0).val();
                var o_xiaoji=$(v).parent().parent().find('input').eq(2).val();
                var pin_str=title+'-'+o_num+'-'+o_xiaoji+'-'+productid;
                total+=parseInt(o_xiaoji);
                str+=pin_str+",";
              });
              if(str==''||str==null)
              {
                $.Showmsg("请您至少选择一项购物车中的商品，谢谢！");
                  $("#Validform_msg").fadeOut(2000);
                return false;
              }
              $.ajax({
              url:"<?php echo U('User/createorder','',false);?>",
              type: 'POST',
              dataType:'json',
              data:{"data":str,"total":total},
              success:function(data){
                console.log(data);

                  if(data.result=='success')
                  {

                    $.Showmsg("订单提价成功！");
                      $("#Validform_msg").fadeOut(3500);
                    setTimeout(function()
                    {

                     window.open("<?php echo get_category(91,'url'); echo cas_check('http://47.93.225.150/manage/view/index.html#/account/pm-order');?>");
                    },1000);

                  }else if(data.result=='failed')
                  {
                    document.cookie="car_login="+"car";
                    $.Showmsg(data.errorMsg);
                      $("#Validform_msg").fadeOut(2500);
                      if(data.code=='1')
                      {
                          window.location.href="<?php echo U('User/login');?>";
                      }

                  }
                }
              });
            return false;
          }
});

});

</script>