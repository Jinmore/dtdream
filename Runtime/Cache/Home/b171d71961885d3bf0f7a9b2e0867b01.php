<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>数梦云商城登录</title>

    <link href="/Public/Home/css/swiper.min.css" rel="stylesheet" type="text/css">
    <link href="/Public/Home/css/base.css" rel="stylesheet" type="text/css">
    <link href="/Public/Home/css/index.css" rel="stylesheet" type="text/css">
    <script src="/Public/Home/js/jquery-3.1.0.min.js"></script>
    <script src="/Public/Home/js/swiper.min.js"></script>
    <script src="/Public/Home/js/Validform_v5.3.2_min.js"></script>
    <script src="/Public/Home/js/base.js"></script>
</head>
<body>
<div class="inner2">
    <div class="signOn clearBoth">
        <div class="left fl">
            <a href="index.php" class="sign-logo"><img src="/Public/Home/images/sign-logo_03.png"></a>
            <p>
                百万用户的信赖首选<br>
                全球领先的云计算服务平台<br>
                高性能、高可用性的顶级云产品<br>
                覆盖全行业的解决方案
            </p>
        </div>
        <a href="index.php" class="right fr">回到首页</a>
        <div class="sign-box">
            <div class="title">数梦云商城登录</div>
            <form class="registerform">
                <div class="name clearBoth">
                    <div class="icon fl"><img src="/Public/Home/images/people_03.jpg"></div>
                    <div class="line fl"></div>
                    <input type="text" class="fl" placeholder="请输入您的账号" datatype="n|s" nullmsg="请输入您的账号！" errormsg="账号为中文英文或数字！">
                </div>
                <div class="name clearBoth">
                    <div class="icon fl"><img src="/Public/Home/images/suo_03.jpg"></div>
                    <div class="line fl"></div>
                    <input type="text" class="fl" placeholder="请输入您的密码" datatype="n|s" nullmsg="请输入您的密码！" errormsg="密码为英文或数字！">
                </div>
                <div class="yan clearBoth">
                    <input type="text" class="fl" placeholder="请输入验证码" datatype="n|s" nullmsg="请输入验证码！" errormsg="验证码为英文或数字！">
                    <div class="right fr"><img src="images/yan.jpg"></div>
                </div>
                <input type="submit" value="登录">
            </form>
            <div class="forget clearBoth">
                <a href="" class="a1 fl">忘记密码？</a>
                <a href="<?php echo U('User/register');?>" class="a2 fr">立即注册</a>
            </div>
        </div>
        <div class="sign-copy">Copyright © 2017 云服务器(www.XXXXXX.com) All Rights Reserved 京ICP备04642574号</div>
    </div>
</div>
</body>
</html>