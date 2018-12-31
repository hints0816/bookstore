<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.Map,java.util.Date,JPA.SalespersonDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fillcon.css">
<title>添加销售员信息</title>
<script type="text/javascript">
</script>
	<%@ include file="/templet/theader.jsp" %>
	</head>
	<body>

<div class="content">
	<div class="menu2">
      <h2>管理菜单</h2>
        <div class="menu_content">
		<ul>
			<li><a href="${pageContext.request.contextPath}/administrator/indexAdmin.jsp">首页</a></li>
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
			<li  class="navmenu"><a id="add-button" href="#">管理销售员信息</a>
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
	<h2>添加销售员信息</h2>
		<div class="antzoen">
			<form action="addSales_do.jsp" method="post">
			<table>
				<tr>
					<td>销售员工号：</td>
					<td><input type="text" name="salesid" value="${c1.getSalespersonid()}"/><span class="error">${errors.get("salespersonid")}</span></td>
				</tr>
				<tr>
					<td>销售员名字：</td>
					<td><input type="text" name="salesname" value="${c1.getSalesname()}"/><span class="error">${errors.get("salesname")}</span></td>
				</tr>
				<tr>
					<td>销售员年龄：</td>
					<td><input type="text" name="salesage" value="${c1.getSalesage()}"/><span class="error">${errors.get("salesage")}</span></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="text" name="salessex" value="${c1.getSalessex()}"/><span class="error">${errors.get("salessex")}</span></td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input type="date" name="birthday" value="${c1.getSalesbirthday()}"/><span class="error">${errors.get("salesbirthday")}</span></td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="account" value="${c1.getAccountname()}"/><span class="error">${errors.get("accountname")}</span></td>
				</tr>
			</table>
			<div class="button">
			    <input class="t2" type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="t2" type="reset" value="重置"/>
			</div>
		</form>
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