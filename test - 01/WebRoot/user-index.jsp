<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <meta charset="utf-8">    
   <title>用户中心</title>
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<link href="css/userstyle.css" rel="stylesheet" type="text/css">
	<link href="css/iconfont/RjdaoIcon.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<meta name="renderer" content="webkit"/>
	<meta name="force-rendering" content="webkit"/>
	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1"/>
		
  </head>
  
  <body>
  
   <%
  // 获取会话中的userId值
  String userNm = (String) session.getAttribute("userNm");
  String userId = (String) session.getAttribute("userId");
  String userPhone = (String) session.getAttribute("userPhone");
%>

   <div class="topnav">
	<div class="con">
    	<div class="txt">欢迎您来到宠爱有家宠物用品销售网站！</div>
        <ul class="rightnav">
        	<li>
            	 <% if (userNm != null && !userNm.isEmpty()) { %>
			      <div id="welcomeUser" class="m"><i class="icon-0119 ic"></i>欢迎您!<span id="userNm"><%= userNm %></span><i class="icon-0232 jt"></i></div>
			      <div class="navlist">
			        <a href="user-index.html">个人中心</a>
			        <a href="user-order.html">我的订单</a>
			        <a href="user-collection.html">我的收藏</a>
			        <a href="">注销用户</a>
			        </div>
			    <% } else { %>
			      <a href="login.jsp" class="m"><span>登录</span></a>			     			      
			    <% } %>
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
            	<a href="goods-list.html">猫条</a>
                <a href="goods-list.html">狗窝</a>
                <a href="goods-list.html">猫窝</a>
                <a href="goods-list.html">驱虫喷剂</a>
                <a href="goods-list.html">磨牙玩具</a>
            </div>
        </div>
        
        <div class="rightc">
        	<a href="user-collection.html" class="colle" title="我的收藏"><i class="icon-0352"></i><em>18</em></a>
            <a href="user-cart.html" class="shopcart">
            	<i class="icon-0494"></i>
                <span>我的购物车</span>
                <em>当前购物车数据：<strong>100</strong></em>
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





<!---user top s---->
<div class="user-top">

	<div class="userinfo">
		<form action="User"  method="POST">
    
    	<a href="" class="portrait"><em>编辑头像</em><img src="images/user-portrait.jpg"></a>
       <div class="minfo">       
		   <div class="it">
					<dl>ID：</dl>
					<span class="mr1"><%= userId %></span>
					<dl>用户名：</dl>
					<span><%= userNm %></span>
					</div>
					<div class="it">
					<dl>绑定手机号：</dl>
					<span><%= userPhone %></span>
                <a href="" class="ml1" title="手机"><i class="icon-0566"></i></a>
                <a href="" class="ml1" title="QQ"><i class="icon-0069"></i></a>
                <a href="" class="ml1" title="微信"><i class="icon-0061"></i></a>
                <a href="" class="ml1" title="淘宝"><i class="icon-0064"></i></a>
                <a href="" class="ml1" title="设置"><i class="icon-0421"></i></a>
            </div>
            <div class="it">
            	<a href="" class="auti auti-qiye"><i class="icon-0333"></i><span>企业认证</span></a>
                <!---
                <a href="" class="auti auti-geren"><i class="icon-0333"></i><span>个人认证</span></a>
                <a href="" class="auti auti-wei"><i class="icon-0310"></i><span>未认证</span></a>
                --->
            </div>
        </div>
        
        <div class="capital">
        	<dl>账户余额</dl><em>1000.00</em>
        </div>
        <div class="capital2">
        	<a href="" class="chong">充值</a>
        	<a href="" class="ti">提现</a>
        </div>
        
    </div>
    
    <div class="nav">
    	<a href="" class="l"><i class="icon-0101"></i><span>用户首页</span></a>
        <a href="" class="l"><i class="icon-0423"></i><span>账户设置</span></a>
        <a href="" class="l"><i class="icon-0673"></i><span>消息</span></a>
        <a href="" class="r"><i class="icon-0735"></i><span>退出</span></a>
    </div>
    
</div>

<!---user top e---->

<!---user-main s--->
<div class="user-main">

	<div class="left">
    	<h2><i class="icon-0216"></i><span>全部功能</span></h2>
        <ul class="usernav">
        	<li>
            	<h3 class="z-n">个人账户</h3>
                <a href="" class="c-n">安全设置</a>
                <a href="" class="c-n">个人资料</a>
                <a href="" class="c-n">密码修改</a>
				<a href="" class="c-n">收货地址</a>
                <a href="" class="c-n">头像设置</a>
            </li>
			<li>
            	<h3 class="z-n">账单管理</h3>
                <a href="" class="c-n">充值记录</a>
                <a href="" class="c-n">消费记录</a>
				<a href="" class="c-n">积分管理</a>
            </li>
			<li>
            	<a href="" class="z-n">我的购物车</a>
            </li>
			<li>
            	<h3 class="z-n">商品管理</h3>
                <a href="" class="c-n">买到的商品</a>
				<a href="" class="c-n">评价管理</a>
                <a href="" class="c-n">商品收藏</a>
                <a href="" class="c-n">退换记录</a>
            </li>
        </ul>
    </div>
    
	<div class="right">
	</div>

</div>
<!---user-main e--->










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

<script>
	var tab_list = document.getElementById("tab_list");
	var tabMenu_content = document.getElementById("tabMenu_content");
	//获取tab列表
	var oli = tab_list.getElementsByTagName("a");
	//获取tab内容列表
	var odiv = tabMenu_content.getElementsByTagName("div");
	for(var i=0 ; i<oli.length ; i++){
	//定义index变量，以便让tab按钮和tab内容相互对应
		oli[i].index = i;
	//移除全部tab样式和tab内容
			oli[i].onclick = function( ){
			for(var i =0; i < oli.length; i++){
				oli[i].className = "";
				odiv[i].style.display = "none";
			}
			//为当前tab添加样式
			this.className = "active";
			//显示当前tab对应的内容
			odiv[this.index].style.display="block";
		}
	}
	
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
