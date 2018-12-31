<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css">
<title>管理员界面</title>
		<style>
			.main{
    width:82%;
	height:500px;
	float:right;
    }
.main h2{
    height:55px;  
    line-height:55px;
	font-size:20px;
	font-weight:bold;
	color:rgb(9,162,212);
	padding-left:30px;
	border-bottom:1px solid rgb(223,223,223);
}
.antzoen{
	height:445px;
}
form{
    margin:12px 35px;
}
td{
	color:rgb(120,120,120);
	height:45px;  
    line-height:45px;
}
td:nth-child(odd){
	float:right;
}
td:nth-child(even){
	padding-left:15px;
	width:600px;
}
input{
	color:rbg(50,50,50);
	font-weight:bold;
	height:25px;
	width:70%;
	outline-color:rgb(82,185,224);
	border-radius:5px;
	border:1px solid rgb(180,180,180);
}
.t1{
    font-weight:bold;
	height:18px;
    width:80px;	
	margin:5px 0px 0px 5px; 
	cursor:default;
	outline-color:rgba(255,168,0,1);
}
.button{
	border-top:1px solid rgb(223,223,223);
    text-align:center;
    margin-top:20px;
    padding-top:40px;
}
.t2{
	color:#FFF;
	font-weight:bold;
	height:38px;
    width:80px;	
    background-color:rgb(24,181,255);
    border:0;
}
		</style>

	<%@ include file="/templet/theader.jsp" %>
	</head>
	<body>
	
<div class="content">
	<div class="menu2">
      <h2>管理菜单</h2>
        <div class="menu_content">
		<ul>
			<li><a id="add-button" href="${pageContext.request.contextPath}/administrator/indexAdmin.jsp">首页</a></li>
			<li class="navmenu"><a href="#">管理用户信息</a>
				<ul>
				<li><a href="${pageContext.request.contextPath}/administrator/maguser/addUser.jsp">添加用户信息</a></li>
				<li><a href="${pageContext.request.contextPath}/administrator/maguser/magUser.jsp">管理用户信息</a></li>
				</ul>
			</li>
			<li class="navmenu"><a href="#">管理图书信息</a>
				<ul>
				<li><a href="${pageContext.request.contextPath}/administrator/magbook/addBook.jsp">添加图书信息</a></li>
				<li><a href="${pageContext.request.contextPath}/administrator/magbook/magBook.jsp">管理图书信息</a></li>
				</ul>
			</li>
			<li class="navmenu"><a href="#">管理销售员信息</a>
				<ul>
				<li><a href="${pageContext.request.contextPath}/administrator/magsales/addSales.jsp">添加销售员信息</a></li>
				<li><a href="${pageContext.request.contextPath}/administrator/magsales/magSales.jsp">管理销售员信息</a></li>
				</ul>
			</li>
			<li class="navmenu"><a href="#">管理会员信息</a>
				<ul>
				<li><a href="${pageContext.request.contextPath}/administrator/magmember/addMember.jsp">添加会员信息</a></li>
				<li><a href="${pageContext.request.contextPath}/administrator/magmember/magMember.jsp">管理会员信息</a></li>
				</ul>
			</li> 
			<li><a href="${pageContext.request.contextPath}/demo.jsp">退出</a></li>
		</ul>  
	   </div>
	</div>
	<div class="main">
	<h2>管理员使用界面</h2>
		<div class="antzoen">
			
		</div>
	</div>
</div>
	<%@ include file="/templet/footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".navmenu").mouseover(function(){
		$(this).children("ul").show();
		
	})
	$(".navmenu").mouseout(function(){
		$(this).children("ul").hide();
		
	})
})
</script>
</html>