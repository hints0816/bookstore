<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<style type="text/css">
	.leftcontent{
	position:absolute;
	top:100px;
	left:0;
	height:527px;
min-width:250px;
	}
	.menu2{
	position:relative;
	top:20px;
	left:20px;
	width:100%;
	}
	.menu2 ul{ 
    position:relative;
    left:0;
}
	.menu2 li{ 
	text-align:center;
	width:60%;
	min-width:150px;
    font-size:15px;
    list-style-type:none;
    padding:10px 10%;
	margin:20px 0;
    text-decoration:none;
    background-color:rgba(248,248,248,1);
}
.menu2 li:hover{
	
}
.menu2 ul a{
    text-align:center;
	color:black;
	text-decoration:none;
	display:inline-block;
}
.menu2 li:hover{
	background-color:rgba(255,248,230,1);
    border-left:2px solid rgba(255,157,0,1);
	color:rgba(255,157,0,1);
}
.menu2 p{
	font-size:20px;
	font-weight:bold;
	color:rgba(50,50,50,1);
}
	
	</style>
</head>
<body>
<div class="leftcontent">
<div class="menu2">
<p><img src="images/book.jpg" style="position:relative; width:30px;top:8px"/>个人中心</p>
<ul>
  <li><a href="">修改资料</a></li>
  <li><a href="../user/updatePassword.jsp">修改密码</a></li>
  <li><a href="../demo.jsp">退出</a></li>
</ul>  
</div>
</div>
</body>
</html>