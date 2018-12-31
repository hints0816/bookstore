<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!-- 设置JSP编译成Servlet时使用的编码 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 指定对服务器响应进行重新编码的编码 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<style type="text/css">
*{
margin:0;
padding:0;
font-family:"微软雅黑";
font-weight:500;
}
.header{
	color:rgb(255,255,255);
	width:100%;
	height:100px;
    background-color:rgb(6,162,214);
    min-width:1000px;
}
.top{
    width:100%;
    height:27px;
    background-color:rgba(255,255,255,0.2);
}
.top_content{
    width:1000px;
    margin:0 auto;
    
}
.top_content li{
    list-style-type:none;
    float:right;
    width:70px;
    line-height:27px;
}
.top_content a:link,.top_content a:visited{
    color:rgb(246,255,219);
    text-decoration:none;
}
.top_content a:hover,.top_content a:active{
    color:rgb(255,200,255);
    text-decoration:none;
}
.wrap{
    width:1000px;
    margin:0 auto;
}
.logo{
    height:73px;
    background:url(${pageContext.request.contextPath}/images/background.png);
    background-repeat:no-repeat;
    background-size:1000px 90px;
}
.logo_left{
    height:50px;
    width:400px;
    margin-top:11px;
    float:left;  
    font-size:30px; 
}
.logo_right{
    width:280px;
    height:28px;
    margin-top:5px;
    float:right;
}
.logo_left img{
    vertical-align:middle;
    margin-right:10px;
}
#menu3{
    width:100px;
	border-radius:2px;
	box-shadow: 0px 2px 10px #888888;
	position:relative;
	top:-72px;
	left:1140px;
    float:left;
    display:none;
	background-color:rgb(250,250,249);
	border-right:1px solid rgb(223,223,223);
	z-index:1;
}
#menu3 li{ 
	height:30px;  
    line-height:30px;
    font-size:15px;
    list-style-type:none;
}
#menu3 li a{
    text-align:center;
	color:black;
	text-decoration:none;
	display:block;
	text-align:center;
}
#menu3 li a:hover{
   background-color:rgb(227,229,232);
	color:white;
}
</style>
</head>
<body>
<% String rname = (String)session.getAttribute("salesname"); %>
  <div class="header">
    <div class="top">
      <div class="top_content">
        <ul>
        <li><a id="login" href="/BookStore/LogoutServlet" >注销</a></li>
        <li><a style="display:block" id="info" href="../user/umain.jsp">个人信息</a></li>
        <li style="width:170px;">欢迎使用,<%= rname %>！</li>
        </ul>       
      </div>
      
    </div>
    <div class="wrap">
      <div class="logo">
        <div class="logo_left">
          <img src="${pageContext.request.contextPath}/images/logol.png" style="width:50px;height:50px;"/>
              书店销售管理系统
        </div>
        <div class="logo_right">
          <div class="time"><%  
    java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(    
     "yyyy-MM-dd HH:mm:ss");    
   java.util.Date currentTime = new java.util.Date();    
   String time = simpleDateFormat.format(currentTime).toString();  
   out.println("当前时间为："+time); 
     %>
          </div>
        </div>
      </div>
    </div> 
  </div>
  <div id="menu3">
        <ul>
            <li><a href="">2</a>
            </li>
            <li><a href="">2</a>
            </li>
            <li><a href="">2</a>
            </li>
            <li><a href="">2</a>
            </li>
            <li><a href="">2</a>
            </li>
        </ul>
        </div>  
</body>
<script type="text/javascript">

// 以下是JQuery练习

$('#info').on('mouseover',function(){
	var info = $('#menu3');
	info.show();
})
$('#info').on('mouseout',function(){
	var info = $('#menu3');
	info.hide();
})
$('#menu3').on('mouseover',function(){
	var info = $('#menu3');
	info.show();
})
$('#menu3').on('mouseout',function(){
	var info = $('#menu3');
	info.hide();
})
</script>
</html>