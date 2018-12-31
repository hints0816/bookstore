<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
  <%@ page import="java.util.Map"%>
  <%@ page import="java.sql.*,java.util.List,Util.DBConnection,model.BookMember" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>图书销售管理系统</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fillcon.css">
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
			<li class="navmenu"><a href="#">管理销售员信息</a>
				<ul>
				<li><a href="${pageContext.request.contextPath}/administrator/magsales/addSales.jsp">添加销售员信息</a></li>
				<li><a href="${pageContext.request.contextPath}/administrator/magsales/magSales.jsp">管理销售员信息</a></li>
				</ul>
			</li>
			<li class="navmenu"><a id="add-button" href="#">管理会员信息</a>
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
	<h2>修改会员信息</h2>
		<div class="antzoen">
		<c:set var="memid" value="${param.id}"></c:set>
		<c:set var="cd" value="${BookMember()}"></c:set>
		<c:set var="JJ" value="${cd.setMemid(memid)}"></c:set>
		<c:set var="ci" value="${cd.getMemInfo()}"></c:set>
		<c:set var="memlevel" value="${cd.getMemLevel()}"></c:set>
	
		<form action="saveMember_do.jsp" method="post">
		<table>
				<tr>
					<td>会员编号：</td>
					<td><input type="text" name="memid" value="${ci.getMemid()}${c1.getMemid()}" disabled="disabled"/><span class="error">${errors.get("memid")}</span></td>
				</tr>
				<tr>
					<td>会员名字：</td>
					<td><input type="text" name="memname" value="${ci.getMemname()}${c1.getMemname()}"/><span class="error">${errors.get("memname")}</span></td>
				</tr>
				<tr>
					<td>电话号码：</td>
					<td><input type="text" name="memnumber" value="${ci.getMemnumber()}${c1.getMemnumber()}"/><span class="error">${errors.get("memnumber")}</span></td>
				</tr>
				<tr>
					<td>会员等级：</td>
					 <c:choose>
            	<c:when test="${memlevel eq '1'}">
            		<c:set var="d1" value="selected=\'selected\'"></c:set>
            	</c:when>
            	<c:when test="${memlevel eq '2'}">
            		<c:set var="d2" value="selected=\'selected\'"></c:set>
            	</c:when>
            	<c:when test="${memlevel eq '3'}">
            		<c:set var="d3" value="selected=\'selected\'"></c:set>
            	</c:when>
            	<c:when test="${memlevel eq '4'}">
            		<c:set var="d4" value="selected=\'selected\'"></c:set>
            	</c:when>
            </c:choose>
             <c:choose>
            	<c:when test="${level eq '1'}">
            		<c:set var="k1" value="selected=\'selected\'"></c:set>
            	</c:when>
            	<c:when test="${level eq '2'}">
            		<c:set var="k2" value="selected=\'selected\'"></c:set>
            	</c:when>
            	<c:when test="${level eq '3'}">
            		<c:set var="k3" value="selected=\'selected\'"></c:set>
            	</c:when>
            	<c:when test="${level eq '4'}">
            		<c:set var="k4" value="selected=\'selected\'"></c:set>
            	</c:when>
            </c:choose>
					<td><select name="memlevel">
			               <option value="1" ${d1}${k1}>普通卡</option>
			               <option value="2" ${d2}${k2}>银卡</option>
			               <option value="3" ${d3}${k3}>黄金卡</option>
			               <option value="4" ${d4}${k4}>钻石卡</option>
            			</select><span class="error">${errors.get("memlevel")}</span>
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
