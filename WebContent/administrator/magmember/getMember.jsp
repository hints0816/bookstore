<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*,java.io.*,java.util.*,Util.DBConnection,JPA.SalespersonDao,model.Salesperson" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书销售管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css">
<style type="text/css">  
</style>  
</head>
<%@ include file="/templet/theader.jsp" %>

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
			<li  class="navmenu"><a href="#">管理销售员信息</a>
				<ul>
				<li><a href="${pageContext.request.contextPath}/administrator/magsales/addSales.jsp">添加销售员信息</a></li>
				<li><a href="${pageContext.request.contextPath}/administrator/magsales/magSales.jsp">管理销售员信息</a></li>
				</ul>
			</li>
			<li  class="navmenu"><a  id="add-button" href="#">管理会员信息</a>
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
	<h2>管理会员信息</h2>
		<div class="antzoen">
			<form action="getSales_do.jsp" method="post">
			会员编号：<input type="text" name="salesid" value="${returncname}" />
			<input class="t2" type="submit" value="提交"/>
			</form>
			<c:set value="${requestScope.salesperson}" var="salesperson"></c:set>
    <table>  
        <tr>  
            <th>销售员工号</th>  
            <th>销售员名字</th>  
            <th>销售员年龄</th>  
            <th>性别</th>  
            <th>出生日期</th>
            <th>用户名</th>
            <th colspan="2">操作</th>  
        </tr> 
	        <c:forEach var="newinfo" items="${salesperson}">
        <tr>  
            <td>${newinfo.getSalespersonid()}</td>  
            <td>${newinfo.getSalesname()}</td>  
            <td>${newinfo.getSalesage()}</td>  
            <td>${newinfo.getSalessex()}</td>  
            <td>${newinfo.getSalesbirthday()}</td>  
            <td>${newinfo.getAccountname()}</td>  
             <td>  
               <a href="updateSales_show.jsp?id=${newinfo.getSalespersonid()}"  class="button-select blue">修改</a>
            </td>  
             <td>  
               <a href="delSales_do.jsp?id=${newinfo.getSalespersonid()}" class="button-select blue">删除</a>
            </td>  
        </tr>  
         </c:forEach>
    </table>  
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