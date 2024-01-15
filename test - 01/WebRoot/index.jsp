<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="utf-8">
<title>宠爱有家宠物用品销售网站</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/index.css" rel="stylesheet" type="text/css">
<link href="css/iconfont/RjdaoIcon.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<meta name="renderer" content="webkit"/>
<meta name="force-rendering" content="webkit"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
<script src="js/lyz.delayLoading.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function () {
	$("img").delayLoading({
		defaultImg: "images/ptu-loading.gif",           // 预加载前显示的图片
		errorImg: "",                        // 读取图片错误时替换图片(默认：与defaultImg一样)
		imgSrcAttr: "originalSrc",           // 记录图片路径的属性(默认：originalSrc，页面img的src属性也要替换为originalSrc)
		beforehand: 0,                       // 预先提前多少像素加载图片(默认：0)
		event: "scroll",                     // 触发加载图片事件(默认：scroll)
		duration: "normal",                  // 三种预定淡出(入)速度之一的字符串("slow", "normal", or "fast")或表示动画时长的毫秒数值(如：1000),默认:"normal"
		container: window,                   // 对象加载的位置容器(默认：window)
		success: function (imgObj) { },      // 加载图片成功后的回调函数(默认：不执行任何操作)
		error: function (imgObj) { }         // 加载图片失败后的回调函数(默认：不执行任何操作)
	});
});
</script>
<script type="text/javascript">
$(function(){
	var count = 0;
	var $li = $("#por-slider>ul>li");
	$(".next").click(function(){
		count++;				
		if(count == $li.length){
			count =0;
		}
		$li.eq(count).fadeIn().siblings().fadeOut();
		$(".slider_icon i").eq(count).addClass("btn_act").siblings().removeClass('btn_act');
		console.log(count);
	});
	$(".prve").click(function(){
		count--;
		if(count == -1){
			count = $li.length-1;
		}
		console.log(count);
		$li.eq(count).fadeIn().siblings().fadeOut();
		$(".slider_icon i").eq(count).addClass("btn_act").siblings().removeClass('btn_act');
	});
	$(".slider_icon i").mouseenter(function(){
		$(this).addClass('btn_act').siblings().removeClass("btn_act");
		$li.eq($(this).index()).fadeIn().siblings().fadeOut();
		count = $(this).index();
	});
});
</script>
</head>
  
  <body>
  <%
  // 获取会话中的userId值
  String userNm = (String) session.getAttribute("userNm");
%>


<div class="topnav">
    <div class="con">
        <div class="txt">欢迎您来到宠爱有家宠物用品销售网站！</div>
          <ul class="rightnav">
			  <li>
			    <% if (userNm != null && !userNm.isEmpty()) { %>
			      <div id="welcomeUser" class="m"><i class="icon-0119 ic"></i>欢迎您!<span id="userNm"><%= userNm %></span><i class="icon-0232 jt"></i></div>
			      <div class="navlist">
			        <a href="user-index.jsp">个人中心</a>
			        <a href="user-order.html">我的订单</a>
			        <a href="user-collection.html">我的收藏</a>
			        <a href="">注销用户</a>
			        </div>
			    <% } else { %>
			      <a href="login.jsp" class="m"><span>登录</span></a>			     			      
			    <% } %>
			  </li>
		
            <li><a href="register.jsp" class="m"><span>注册</span></a></li>
            <li><a href="" class="m"><i class="icon-0145 ic"></i><span>问答</span></a></li>
            <li>
                <a href="" class="m"><span>快速导航</span><i class="icon-0232 jt"></i></a>
                <div class="navlist">
                    <a href="">用户中心</a>
                    <a href="">零售用户</a>
                    <a href="">招兵买马</a>
                    <a href="">法律声明</a>
                    <a href="">支付方式</a>
                    <a href="">物流说明</a>
                </div>
            </li>
        </ul>
    </div>
</div>

<header>
	<em></em>
	<div class="mainso">
    	<div class="logo">
        </div>

        
        <div class="search-t">
        	<div class="soo">
            	<input type="text" name="key" class="inkey" placeholder="请输商品入关键词" autocomplete="off">
                <input type="submit" class="sobut" value="搜索">
            </div>
            <div class="soci">
            	<a href="goods-list.html">猫条</a>
                <a href="goods-list.html">狗窝</a>
                <a href="goods-list.html">猫窝</a>
                <a href="goods-list.html">驱虫喷剂</a>
                <a href="goods-list.html">磨牙玩具</a>
            </div>
        </div>
        
        <div class="rightc">
        	<a href="user-collection.html" class="colle" title="我的收藏"><i class="icon-0352"></i></a>
            <a href="user-cart.html" class="shopcart">
            	<i class="icon-0494"></i>
                <span>我的购物车</span>
                <em>当前购物车数据：<strong></strong></em>
            </a>
        </div>
        
    </div>
	<nav class="mainnav">
    	<ul>
        	<li class="mli l"><a href="index.jsp" class="mz">首页</a></li>
            <li class="mli l">
            	<a href="goods-list.html" class="mz"><span>快速导航</span><i class="icon-0220"></i></a>
              <div class="dsunav">
                	<!---种类 S--->
                	<div class="seasonnav">
                    	<a href="goods-list.html" class="c">猫</a>
                        <a href="goods-list.html" class="x">狗</a>
                        <a href="goods-list.html" class="q">其它</a>
                    </div>
                    <!---种类 E--->
                    <div class="middlenav">
                    	<div class="lei1">
                        	<a href="" class="t1">新品专区</a>
                            <a href="" class="t2">推荐商品</a>
                        </div>
                        <div class="lei2">
                        	<a href="" class="t1">新品专区</a>
							<a href="" class="t2">推荐商品</a>
                        </div>
                        <div class="lei3">
                        	<a href="" class="t1">新品专区</a>
                            <a href="" class="t2">推荐商品</a>
                        </div>
                    </div>
                    
                    
                </div>
            </li>
          <li class="mli l"><a href="goods-new.html" class="mz">新品区</a></li>
          <li class="mli l"><a href="goods-recommend.html" class="mz">推荐商品</a></li>
          <li class="mli l"><a href="wenti.html" class="mz">常见问题</a></li>
          <li class="mli l"><a href="news.html" class="mz">相关资讯</a></li>
          <li class="mli r"><a href="about.html" class="bian">关于我们</a></li>
            <li class="mli r"><a href="kefu.html" class="bian">客服</a></li>
        </ul>
	</nav>
</header>

<div class="hbanner">

	<ul class="quicknav">
    	<h2><i class="icon-0216"></i><span>商品分类</span></h2>
        <li><a href="goods-list.html"><i class="icon-0279"></i><span>宠物主粮</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0853"></i><span>宠物零食</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0809"></i><span>宠物医疗</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0347"></i><span>宠物保健</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0339"></i><span>宠物出行</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0659"></i><span>宠物日用</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0664"></i><span>宠物玩具</span><em>5</em></a></li>
<li><a href="goods-list.html"><i class="icon-0823"></i><span>宠物服饰</span><em>5</em></a></li>
        <li>
        	<a><i class="icon-0222"></i><span>更多分类</span></a>
            <div class="morenav">
           	  <ul class="son">
                    <li><a href=""><i class="icon-0823"></i><span>脚链/脚镯</span><em>5</em></a></li>
                <li><a href=""><i class="icon-0823"></i><span>腰饰/腰带</span><em>5</em></a></li>
                <li><a href=""><i class="icon-0823"></i><span>日常/杯具</span><em>5</em></a></li>
                <li><a href=""><i class="icon-0823"></i><span>肩饰/围巾</span><em>5</em></a></li>
                <li><a href=""><i class="icon-0823"></i><span>衣类</span><em>5</em></a></li>
                    <li><a href=""><i class="icon-0823"></i><span>玩具</span><em>5</em></a></li>
            </div>
        </li>
    </ul>

    
    <div id="indexslide" class="flexslider">
        <ul class="slides">
            <li><div class="img"><img src="images/轮播1.jpg" width="960" height="450" alt=""/>
          </div></li>
        <li><div class="img"><img src="images/轮播2.jpg" height="450" width"960" alt="" /></div></li>
        <li><div class="img"><img src="images/轮播3.jpg" height="450" width"960" alt="" /></div></li>
          <li><div class="img"><img src="images/轮播4.jpg" width="960" height="450" alt=""/></div></li>
        </ul>
    </div>
    
</div>

<!--
<div class="titname">
	<span style="color:#fa5555;">新品推荐</span>
</div>
-->


<div class="mslist">
	<div class="avleft1 l">
    	<a href="goods-list.html" class="imgTitle1"><img src="images/鹦鹉粮食.jpg" width="280" height="300"></a>
        <div class="prominlist">
        	<h2><span>最近被订购</span></h2>
            <a href="goods-vist.html" class="mpitem">
            	<img src="images/鱼缸消毒杀菌速溶黄粉.jpg">
                <span>鱼缸消毒杀菌速溶黄粉</span>
                <dl>销量：200件</dl><em>$1.00</em>
            </a>
            <a href="goods-vist.html" class="mpitem">
            	<img src="images/零食猫罐头.jpg">
                <span>零食猫罐头</span>
                <dl>销量：200件</dl><em>$1.00</em>
            </a>
            <a href="goods-vist.html" class="mpitem">
            	<img src="images/芦丁鸡恒温饲养箱.jpg">
                <span>芦丁鸡恒温饲养箱</span>
                <dl>销量：200件</dl><em>$1.00</em>
            </a>
            <a href="goods-vist.html" class="mpitem">
            	<img src="images/猫草粒.jpg">
                <span>猫草粒</span>
                <dl>销量：220件</dl><em>$62.00</em>
            </a>
            <a href="goods-vist.html" class="mpitem">
            	<img src="images/逗猫棒.jpg">
                <span>逗猫棒</span>
                <dl>销量：200件</dl><em>$1.00</em>
            </a>
        </div>
    </div>
    
    <div class="porlist w890 r">
    	<div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf1"></a>
        	<a class="pci"><img originalsrc="images/伊丽莎白圈.jpg"></a>
            <div class="info">
            	<a href="" class="title">伊丽莎白圈</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="" class="mask mf2"></a>
        	<a class="pci"><img originalsrc="images/兔子磨牙球.jpg"></a>
            <div class="info">
            	<a href="goods-vist.html" class="title">兔子磨牙球</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf3"></a>
        	<a class="pci"><img originalsrc="images/全价宠物食品猫粮.jpg"></a>
            <div class="info">
            	<a href="" class="title">全价宠物食品猫粮</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/全价成猫粮.jpg"></a>
            <div class="info">
            	<a href="" class="title">全价成猫粮</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf5"></a>
        	<a class="pci"><img originalsrc="images/剑麻猫爪板.jpg"></a>
            <div class="info">
            	<a href="" class="title">剑麻猫抓板</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf6"></a>
        	<a class="pci"><img originalsrc="images/宠物仿生哺乳器.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物仿生哺乳器</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
    </div>
    
    
    
</div>



<a href="" class="index-banner1"><img src="images/猫狗.png"></a>


<div class="mslist">

	<div id="por-slider">
        <ul class="slider_list">
            <li><a href="#"><img src="images/s1.jpg"></a></li>
            <li><a href="#"><img src="images/s2.jpg"></a></li>
            <li><a href="#"><img src="images/s3.jpg"></a></li>
            <li><a href="#"><img src="images/s4.jpg"></a></li>
            <li><a href="#"><img src="images/s5.jpg"></a></li>
            <li><a href="#"><img src="images/s6.jpg"></a></li>
            <li><a href="#"><img src="images/s7.jpg"></a></li>
            <li><a href="#"><img src="images/s8.jpg"></a></li>
        </ul>
        <div class="slider_icon">
            <i class="btn btn_act"></i>
            <i class="btn"></i>
            <i class="btn"></i>
            <i class="btn"></i>
            <i class="btn"></i>
            <i class="btn"></i>
            <i class="btn"></i>
            <i class="btn"></i>
        </div>
        <a href="javascript:;" class="arrow prve">
            <span class="slider_left"></span>
        </a>
        <a href="javascript:;" class="arrow next">
            <span class="slider_right"></span>
        </a>
    </div>
    
    <div class="porlist w590 r">
    	<div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf1"></a>
        	<a class="pci"><img originalsrc="images/宠物免洗清洁手套湿巾.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物免洗清洁手套湿巾</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf2"></a>
        	<a class="pci"><img originalsrc="images/宠物冻干.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物冻干</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        
     </div>
    
</div>




<div class="mslist">
	<div class="avleft2">
    </div>
    
    <div class="porlist w1180">
    	<div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf1"></a>
        	<a class="pci"><img originalsrc="images/宠物洁耳液.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物洁耳液</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf2"></a>
        	<a class="pci"><img originalsrc="images/宠物洗澡刷.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物洗澡刷</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf1"></a>
        	<a class="pci"><img originalsrc="images/宠物烘干箱.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物烘干箱</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf2"></a>
        	<a class="pci"><img originalsrc="images/宠物眼部湿巾.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物眼部湿巾</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
     </div>
    
</div>




<a href="" class="index-banner2"><img src="images/中间图.jpg"></a>


<div class="titname">最新商品</div>


<div class="mslist">
    
    <div class="porlist w1180 r">
    	<div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf1"></a>
        	<a class="pci"><img originalsrc="images/宠物粘毛器.jpg"></a>
            <div class="info">
            	<a href="" class="title">宠物粘毛器</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf2"></a>
        	<a class="pci"><img originalsrc="images/牛肉粒宠物零食.jpg"></a>
            <div class="info">
            	<a href="" class="title">牛肉粒宠物零食</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like"></i>
            <a href="goods-vist.html" class="mask mf3"></a>
        	<a class="pci"><img originalsrc="images/狗狗磨牙棒.jpg"></a>
            <div class="info">
            	<a href="" class="title">狗狗磨牙棒</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/狗笼子.jpg"></a>
            <div class="info">
            	<a href="" class="title">狗笼子</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫咪保暖窝.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫咪保暖窝</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫咪太空舱背包.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫咪太空舱背包</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫咪自动喂食器饮水机.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫咪自动喂食器饮水机</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫爪柱磨爪器.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫爪柱磨爪器</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫爬架.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫爬架</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫猫跑车电动猫玩具.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫猫跑车电动猫玩具</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫碗盆.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫碗盆</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
        <div class="item">
        	<i class="icon-0351 like-cur"></i>
            <a href="goods-vist.html" class="mask mf4"></a>
        	<a class="pci"><img originalsrc="images/猫草种子.jpg"></a>
            <div class="info">
            	<a href="" class="title">猫草种子</a>
                <div class="price"><em>零售价</em>&nbsp;<span>$1.00</span></div>
                <a href="" class="pur"><i class="icon-0491"></i><span>立即购买</span></a>
                <div class="enclosure">
                	<i class="icon-0350 coll-cur"></i>
                    <span>已售：2451件</span>
                </div>
            </div>
        </div>
        
     </div>
    
</div>











<footer>
	<div class="innerframe">
    	<ul class="fnav">
        	<h2><i class="icon-0492"></i><span>购物指南</span></h2>
            <li><a href="">购物流程</a></li>
          <li><a href="">会员介绍</a></li>
          <li><a href="">常见问题</a></li>
            <li><a href="">联系客服</a></li>
        </ul>
        <ul class="fnav">
        	<h2><i class="icon-0589"></i><span>配送方式</span></h2>
            <li><a href="">上门自提</a></li>
          <li><a href="">211限时达</a></li>
          <li><a href="">配送服务查询</a></li>
            <li><a href="">配送费收取标准</a></li>
        </ul>
        <ul class="fnav">
        	<h2><i class="icon-0150"></i><span>支付方式</span></h2>
            <li><a href="">在线支付</a></li>
          <li><a href="">线下支付</a></li>
          <li><a href="">公司转账</a></li>
            <li><a href="">支付相关问题</a></li>
        </ul>
        <ul class="fnav">
        	<h2><i class="icon-0931"></i><span>售后服务</span></h2>
            <li><a href="">售后政策</a></li>
          <li><a href="">价格保护</a></li>
          <li><a href="">退款说明</a></li>
          <li><a href="">返修/退换货</a></li>
            <li><a href="">取消订单</a></li>
        </ul>
        <ul class="fnav">
        	<h2><i class="icon-0832"></i><span>特色服务</span></h2>
            <li><a href="">零售说明</a></li>
          <li><a href="">批发声明</a></li>
            <li><a href="">无限期换货</a></li>
        </ul>
        
        <div class="">
        </div>
    </div>
    
    
    <div class="innerframe2">
    	<div class="tfr">
        	<a href="">关于我们</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">联系我们</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">联系客服</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">合作招商</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">商家帮助</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">友情链接</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">隐私政策</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">法律声明</a>
        </div>
        <div class="tfr">
        	<span>Copyright@宠爱有家</span>&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;<span>消费者维权热线：400 0000 000</span>
        </div>
    </div>
    
</footer>


<div class="suspensionRight">
	<a href="" class="xcart">
    	<i class="icon-0495 icart-cur"></i>
        <em>24</em>
        <span class="txtcart">My Cart</span>
	</a>
</div>










<script type="text/javascript">
$(function(){

	$('#indexslide').flexslider({
		animation: "slide",
		direction:"horizontal",
		easing:"swing"
	});

});
</script>
<script>
	$(function(){
		var m_st, m_po = 280; //滚动到600像素时显示
		$(window).scroll(
			function () {
				m_st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
				if (m_st > m_po) {
					$('.suspensionRight').slideDown();//classNmae : tips
				}else{
					$('.suspensionRight').slideUp();//classNmae : tips
				}
			})
					 
	});
</script>
</body>
</html>
