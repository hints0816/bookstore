<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">

.header{
	font-size:12px;

	color:rgb(255,255,255);
	width:100%;
	min-width:1000px;
	height:100px;
    background-color:rgb(0,115,219);
	background-repeat:no-repeat;
	position:absolute;
	top:0;
	left:0;
	clear:both;
	text-align:center-left;
	margin:0 auto;
}
.title{
font-size:40px;
position:relative;
top:10px;
left:10px;
width:40%;
}
.Component{
    font-size:15px;
	font-weight:bold;
    position:absolute;
    top:10px;
    right:10%;
}
.time{
position:relative;
top:20px;
left:10px;
width:40%;
}
#login{
color:rgb(255,255,255);
text-decoration:none;
}
#login:hover{
	text-decoration:underline;
}
</style>
</head>
<body>
<% String rname = (String)session.getAttribute("rname"); %>
  <div class="header">
  <div class="title">
<!--   <img src="images/logol.png" style="position:relative; width:60px;height:60px;top:8px;left:10px;"/> -->
  账号设置
  </div>
  <div class="Component">
         欢迎你,<%= rname %>！
  <a id="login" href=" " >个人信息</a>
  <a id="login" href="demo.html" >注销</a>
  </div>
  <div class="time">
   <%  
    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(    
     "yyyy-MM-dd HH:mm:ss");    
   java.util.Date currentTime = new java.util.Date();    
   String time = simpleDateFormat.format(currentTime).toString();  
   out.println("当前时间为："+time); 
     %>
     </div>  
  </div>
</body>
</html>