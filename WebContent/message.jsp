<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
*{
margin:0;
padding:0;
font-family:"微软雅黑";
font-weight:500;
}
body{
	width:100%;
	height:100%;
}

.content{
	position: absolute; 
	top: 0; 
	left: 0; 
	bottom: 0; 
	right: 0; 
	overflow-x: hidden; 
	overflow-y: hidden;
	border:1px solid rgb(100,100,100);
	box-shadow:0px 0px 2px #888888;
	height:120px;
	width:720px;
	margin:auto;
	text-align:center;
}
.text{
	margin-top:35px;
	line-height:25px;
}
a{
	color:rbg(114,199,112);
	margin-top:10px;
}
</style>
</head>
<body>
<div class="content">
	<div class="text">
		成功退出登录<br>
		<a href="${pageContext.request.contextPath}/demo.jsp" class="link">
		<%=request.getAttribute("message") %>
		</a>
	</div>
</div>
</body>
</html>