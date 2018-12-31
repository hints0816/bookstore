<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>登录界面</title>
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
    background-color:rgb(6,162,214);
    min-width:1000px;
}
.top{
    width:100%;
    height:27px;
    background-color:rgb(103,139,255);
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
    width:280px;
    height:28px;
    margin-top:45px;
    float:right;
}
.logo_left img{
    vertical-align:middle;
    margin-right:10px;
}

.content{
    width:1000px;
    margin:10px auto 10px auto;
    height:500px;
}
.login{
	border:1px solid #EEEEEE;
    box-shadow:0px 0px 1px 1px #CCCCCC;
	width:380px;
    height:400px;
    margin-top:45px;
    float:right;
}
.login h2{
	height:45px;  
    line-height:45px;
	font-size:20px;
	font-weight:bold;
	color:rgb(150,150,150);
	padding-left:30px;
	border-bottom:1px solid rgb(230,230,230);
	background-color:rgb(248,247,246);
}
.am-form{
	width:340px;
    margin:50px auto 30px auto;
}
input{
	color:#888888;
	font-weight:bold;
	height:40px;
	width:300px;
	outline-color:rgb(82,185,224);
	border:0.5px solid rgb(180,180,180);
	margin-bottom:10px;
}
input::-webkit-input-placeholder {
	color:rgb(200,200,200);
}
button{
	color:#FFF;
	font-weight:bold;
	height:40px;
	width:100%;
	margin:20px 0;
	border:none;
	background-color:rgb(17,143,246);
	border-radius:5px;
}
button:hover{
    cursor:pointer;
	background-color:rgb(17,160,246);
	border-radius:5px;
}
.register{
    font-size:13px;
	float:right;
	text-decoration:none;
}
.register:hover{
    font-size:13px;
	float:right;
	text-decoration:underline;
}
.username{
	background:url(images/user.png)no-repeat;
	background-position: 5px 5px;
	padding-left:40px;
}
.username:focus{
	background:url(images/user3.png)no-repeat;
	background-position: 5px 4px;
	padding-left:40px;
}
.password{
	background:url(images/password.png)no-repeat;
	background-position: 5px 4px;
	padding-left:40px;
}
.password:focus{
	background:url(images/password3.png)no-repeat;
	background-position: 6px 6px;
	padding-left:40px;
}
.footer{
	font-size:14px;
	color:rgb(150,150,150);
	width:100%;
	min-width:1000px;
	text-align:center;
	clear:both;
}
.footer_content{
	width:800px;
	margin:30px auto;
	padding-top:20px;
	border-top:0.5px solid rgb(180,180,180);
}
</style>

</head>
	
<body>
<div class="header">
    <div class="top">
    </div>
    <div class="wrap">
      <div class="logo">
        <div class="logo_left">
          <img src="images/logol.png" style="width:50px;height:50px;"/>
                         图书销售管理系统
        </div>
        <div class="logo_right">
     
        </div>
      </div>
    </div>   
  </div>
<div class="content">
	<div class="login">
		<h2>登陆账号</h2>
			<form class="am-form" action="LoginValid.jsp" method="post">
						<input value="${returnname}" class="username" type="text" name="accountname" id="doc-ipt-email-1" placeholder="输入用户名"/><br>
						<input class="password" type="password" name="password" id="doc-ipt-pwd-1" placeholder="输入密码"/>
						<select name="usertype" style="height:28px;">
			            <option value="" style="display:none" >请选择登录身份</option>
               			<option value="1" >管理员</option>
               			<option value="2" >销售员</option>
            			</select>
				<p><button type="submit" class="am-btn am-btn-default">登录</button></p>${error}		
			</form>
	</div>
</div>
<div class="footer">
<div class="footer_content">
2017@hints0816
</div>
</div>
</body>
</html>