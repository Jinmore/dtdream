<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎注册数梦工厂</title>
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
  <div class="signOn zhu clearBoth">


        <div class="left fl">
            <a href="<?php echo U('index/index');?>" class="sign-logo"><img src="/Public/Home/images/sign-logo_03.png"></a>
            <!-- <p>
                百万用户的信赖首选<br>
                全球领先的云计算服务平台<br>
                高性能、高可用性的顶级云产品<br>
                覆盖全行业的解决方案
            </p> -->
        </div>
        <a href="<?php echo U('index/index');?>" class="right fr">回到首页</a>


        <div class="sign-box zhu-box">
            <div class="title">会员注册</div>
            <form class="registerform" method="post" action="<?php echo U(User/register,'',false);?>" >
                <div class="name clearBoth">
                    <div class="icon fl"><img src="/Public/Home/images/people_03.jpg"></div>
                    <div class="line fl"></div>
                    <input type="text" class="fl" placeholder="邮箱" name="userEmail" datatype="e" nullmsg="请输入您的邮箱！" errormsg="邮箱格式不正确！">
                </div>
                <div class="name clearBoth">
                    <div class="icon fl"><img src="/Public/Home/images/suo_03.jpg"></div>
                    <div class="line fl"></div>
                    <input type="password" class="fl" placeholder="密码" name="password" datatype="n|s" nullmsg="请输入您的密码！" errormsg="密码为英文或数字！">
                </div>
                <div class="name clearBoth">
                    <div class="icon fl"><img src="/Public/Home/images/suo_03.jpg"></div>
                    <div class="line fl"></div>
                    <input type="password" class="fl" placeholder="再次确认密码" name="repassword" recheck="password" datatype="n|s" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！">
                </div>
                <div class="name clearBoth">
                    <div class="icon fl"><img src="/Public/Home/images/photo_03.jpg"></div>
                    <div class="line fl"></div>
                    <input type="text" class="fl" placeholder="手机号" datatype="m" name="cellphoneNum" nullmsg="请输入您的手机号！" errormsg="手机号格式不正确！">
                </div>
                <input type="submit" value="注册">
            </form>
            <script type="text/javascript">
            $(function()
              {

                $('.registerform').Validform({
                  tiptype:1,
                  callback:function(curform){
                    var url = $(".registerform").attr('action');
                      $.ajax({
                      url: url,
                      type: 'POST',
                      dataType:'json',
                      data:$(curform[0]).serialize(),
                      success:function(data){
                          console.log(data);
                          if(data.result=="success")
                          {
                            $.Showmsg("您注册成功，请登陆邮箱验证！");
                            setTimeout(function()
                              {
                                window.location.href="<?php echo U('User/login');?>";
                              },1000);
                          }else if(data.result=="failed")
                          {
                            $.Showmsg(data.errorMsg);
                          }
                        }

                      });
                          return false;
                  }
                });

              });
            </script>
            <div class="forget clearBoth">
                <p class="fr">如果您已是会员，请直接<a href="<?php echo U('User/login');?>">登录</a></p>
            </div>
        </div>
        <div class="sign-copy sign-copy2">Copyright © 2017 云服务器(www.baidu.com) All Rights Reserved <?php echo C('WEB_SITE_ICP');?></div>

</div>
</body>
</html>