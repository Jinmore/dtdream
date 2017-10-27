/**
 * Created by Administrator on 2017-07-20.
 */
$(function () {
  function size(){
    var windowH=$(window).height();
    $(".zhu").height(windowH);
  };
  size();
  $(window).load(function(){
    $(window).resize();
  });
  $(window).resize(function(){
    size();
  });
  //shop全选 2017-8-17
    $(".shopUl li:eq(0)").find("input").click(function(){
        if(this.checked==true){
            $(".shopBul :checkbox").prop("checked", true);
        }else {
            $(".shopBul :checkbox").prop("checked", false);
        }
    });
    $(".shopBul li input:checkbox").click(function(){
        var len1 = $(".shopBul li input:checkbox:checked").length;   //选中的个数
        var len2 = $(".shopBul li input:checkbox").length;           //复选框的个数
        if(len1==len2){
            $(".shopUl :checkbox").prop("checked", true);
        }else{
            $(".shopUl :checkbox").prop("checked", false);
        }
    });
    //返回顶部
    $("#test ul li.li4").click(function () {
        $("html,body").animate({"scrollTop":0},500);
    });
    // var menuYloc=($(window).height()-$("#test").height())/2;
    // $("#test").css({"top":menuYloc});
    // $(window).scroll(function () {
    //     var offsetTop = menuYloc + $(window).scrollTop() + "px";
    //     $("#test").animate({ top: offsetTop }, { duration: 300, queue: false });
    // });

    //轮播
    banner();
    //banner选项卡
    $(".banner .bannerUl>li").each(function () {
        $(this).on("mouseover",function () {
            $(this).find(".ul-two").show();
            $(this).siblings().find(".ul-two").hide();
        });
        $(this).on("mouseout",function () {
            $(this).find(".ul-two").hide();
        });
    });
    //课程培训
    var ke=$(".ke-content>div");
    ke.eq(0).show();
    $(".keUl li").each(function (index) {
        $(this).click(function () {
            $(this).addClass("bg").siblings().removeClass("bg");
            ke.eq(index).fadeIn().siblings().hide();
        });
    });
    // 表单验证
    // $(".registerform").Validform({
    //     tiptype:1
    // });
    //  var strtime="<?php echo $strtime;?>";
    //   //倒计时
    //   console.log(strtime);
      // console.log('11111');
      // var time=$('.strtime').val();
      // $(".yun-you li .time").fnTimeCountDown(time);
      //加减
        $(".baseAdd").click(function(){
            var n=$(this).prev().val();
            var num=parseInt(n)+1;
            if(num==0){return}
            $(this).prev().val(num);
        });
        $(".baseReduce").click(function(){
            var n=$(this).next().val();
            var num=parseInt(n)-1;
            if(num==0){return}
            $(this).next().val(num);
        });

});


function banner(){
    var swiper = new Swiper('.banner .swiper-container', {
        loop: true,
        pagination: '.swiper-pagination',
        paginationClickable: true,
        autoplay:3000,
        speed:800,
        autoplayDisableOnInteraction : false
        // grabCursor:true     //抓手形状
    });
    $('.banner .swiper-container').mouseenter(function(){
        swiper.stopAutoplay();
    }).mouseleave(function(){
        swiper.startAutoplay();
    });
}
