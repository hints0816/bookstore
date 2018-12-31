<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*,java.io.*,java.util.*,Util.DBConnection,model.Users" %>
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
			<li class="navmenu"><a  id="add-button" href="#">管理用户信息</a>
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
			<li  class="navmenu"><a  href="#">管理会员信息</a>
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
    <table>  
        <tr>  
            <th>用户名</th>  
<!--             <th>真实名字</th>   -->
<!--             <th>电话号码</th>   -->
            <th>用户类型</th>  
            <th colspan="2">操作</th>  
        </tr> 
        	<c:set var="Users" value="${Users()}"></c:set>
	        <c:forEach var="newinfo" items="${Users.getAllUserInfo()}">
        <tr>  
            <td>${newinfo.getAccountname()}</td>  
<%--             <td>${newinfo.getUsertype()}</td>   --%>
<%--             <td>${newinfo.getMemnumber()}</td>   --%>
            <c:choose>
            	<c:when test="${newinfo.getUsertype() eq '1'}">
            		<c:set var="type" value="管理员"></c:set>
            	</c:when>
            	<c:when test="${newinfo.getUsertype() eq '2'}">
            		<c:set var="type" value="销售员"></c:set>
            	</c:when>
            </c:choose>
            <td>${type}</td>  
             <td>  
               <a href="saveUser_do.jsp?id=${newinfo.getAccountname()}" id="reset" class="button-select blue">设置默认密码</a>
            </td>  
             <td>  
               <a href="delUser_do.jsp?id=${newinfo.getAccountname()}" id="delete" class="button-select blue">删除用户</a>
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
$("#reset").on('click',function(){
	return confirm("确认重置密码吗？");
})
$("#delete").on('click',function(){
	return confirm("确认删除此用户吗？");
})
</script>
</html>