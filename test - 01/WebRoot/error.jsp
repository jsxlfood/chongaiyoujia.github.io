<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册结果</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="css/login.css" rel="stylesheet" type="text/css">
	<link href="css/iconfont/RjdaoIcon.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
    
</head>

<body>
<div class="topnav">
	<div class="con">
    	<div class="txt">欢迎您来到百尚饰品零售和批发商城！</div>
        <ul class="rightnav">
        	<li>
            	<a href="login.html" class="m"><i class="icon-0119 ic"></i><span>登录</span><i class="icon-0232 jt"></i></a>
                <div class="navlist">
                	<a href="user-index.html">个人中心</a>
                    <a href="user-order.html">我的订单</a>
                    <a href="user-collection.html">我的收藏</a>
                    <a href="">注销用户</a>
                </div>
            </li>
            <li><a href="register.html" class="m"><span>注册</span></a></li>
            <li><a href="" class="m"><i class="icon-0145 ic"></i><span>问答</span></a></li>
            <li>
            	<a href="" class="m"><span>快速导航</span><i class="icon-0232 jt"></i></a>
                <div class="navlist">
                	<a href="">批发商中心</a>
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
	<div class="mainso">
    	<div class="logo">
        </div>
        
        <div class="search-t">
        	<div class="soo">
            	<input type="text" name="key" class="inkey" placeholder="请输商品入关键词" autocomplete="off">
                <input type="submit" class="sobut" value="搜索">
            </div>
            <div class="soci">
            	<a href="goods-list.html">女款包包</a>
                <a href="goods-list.html">脚链</a>
                <a href="goods-list.html">新款包</a>
                <a href="goods-list.html">太阳眼镜</a>
                <a href="goods-list.html">女款包包</a>
            </div>
        </div>
        
        <div class="rightc">
        	<a href="user-collection.html" class="colle" title="我的收藏"><i class="icon-0352"></i><em>18</em></a>
            <a href="user-cart.html" class="shopcart">
            	<i class="icon-0494"></i>
                <span>我的购物车</span>
                <em>当前购物车数据：<strong>262</strong></em>
            </a>
        </div>
        
    </div>
	<nav class="mainnav">
    	<ul>
        	<li class="mli l"><a href="index.html" class="mz">首页</a></li>
            <li class="mli l">
            	<a href="goods-list.html" class="mz"><span>快速导航</span><i class="icon-0220"></i></a>
                <div class="dsunav">
                	<!---季节 S--->
                	<div class="seasonnav">
                    	<a href="goods-list.html" class="c">春</a>
                        <a href="goods-list.html" class="x">夏</a>
                        <a href="goods-list.html" class="q">秋</a>
                        <a href="goods-list.html" class="d">冬</a>
                    </div>
                    <!---季节 E--->
                    <div class="middlenav">
                    	<div class="lei1">
                        	<a href="" class="t1">新品专区</a>
                            <a href="" class="t2">推荐商品</a>
                        </div>
                        <div class="lei2">
                        	<a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                        </div>
                        <div class="lei3">
                        	<a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
                            <a href="">新品专区</a>
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

<div class="curPos">
	<span>当前位置</span><i class="icon-0240"></i><a href="">用户注册</a>
</div>

	<section class="aui-content">
			<div class="aui-content-box clearfix">
		    <div class="message">
		        <h1>注册失败</h1>
		
		        <%-- 显示错误消息 --%>
		        <c:if test="${not empty resultMsg}">
		            <p>${resultMsg}</p>
		        </c:if>
		
		
		        <p id="countdown">还有5秒，自动跳转注册页面</p>
		
		        <button onclick="goBack()">返回</button>
		    </div>
   </div>
	</section>

   
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
        
        <div class="mr">
        </div>
    </div>
    
    
    <div class="innerframe2">
    	<div class="tfr">
        	<a href="">关于我们</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">联系我们</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">联系客服</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">合作招商</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">商家帮助</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">手机百尚</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">友情链接</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">隐私政策</a>&nbsp;&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;&nbsp;
            <a href="">法律声明</a>
        </div>
        <div class="tfr">
        	<span>Copyright (c) 2018 - 2018  百尚精品 Bais1.com 版权所有</span>&nbsp;&nbsp;<em>|</em>&nbsp;&nbsp;<span>消费者维权热线：400 0000 000</span>
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

 	 <script>
        var countdownElement = document.getElementById("countdown");
        var countdown = parseInt(countdownElement.innerText.match(/\d+/)[0]);
        setInterval(function() {
            countdown--;
            if (countdown <= 0) {
                location.href = "register.jsp";
            } else {
                countdownElement.innerText = countdownElement.innerText.replace(/\d+/, countdown);
            }            
        }, 1000); // 每秒钟更新倒计时

        function goBack() {
            location.href = "register.jsp";
        }
    </script>

	<script type="text/javascript">
        $(function(){

			/*tab标签切换*/
            function tabs(tabTit,on,tabCon){
                $(tabCon).each(function(){
                    $(this).children().eq(0).show();

                });
                $(tabTit).each(function(){
                    $(this).children().eq(0).addClass(on);
                });
                $(tabTit).children().click(function(){
                    $(this).addClass(on).siblings().removeClass(on);
                    var index = $(tabTit).children().index(this);
                    $(tabCon).children().eq(index).show().siblings().hide();
                });
            }
            tabs(".aui-form-header","on",".aui-form-content");

        })
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


