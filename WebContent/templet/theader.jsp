<%@ page language="java" contentType="text/html; charset=utf-8"%>
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
}
.header{
	color:rgb(255,255,255);
	width:100%;
	height:100px;
    background-color:rgb(83,106,170);
    min-width:1000px;
}
.top{
    width:100%;
    height:27px;
    background-color:rgba(255,255,255,0.2);;
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
}
.logo_left{
    height:50px;
    width:400px;
    margin-top:11px;
    float:left;  
    font-size:30px; 
}
.logo_right{
    width:400px;
    height:28px;
    margin-top:45px;
    float:right;
}
.logo_left img{
    vertical-align:middle;
    margin-right:10px;
}
</style>
</head>
<body>
<% String administratorname = (String)session.getAttribute("administratorname"); %>
  <div class="header">
    <div class="top">
      <div class="top_content">
        <ul>
        <li><a id="login" href="/BookStore/LogoutServlet" >注销</a></li>
        <li><a id="login" href="${pageContext.request.contextPath}/user/umain.jsp">个人信息</a></li>
        <li style="width:120px;">欢迎你,<%= administratorname %>！</li>
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
</body>
</html>