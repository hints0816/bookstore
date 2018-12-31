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
.left{
    width:1000px;
    margin:10px auto 0 auto;
    height:500px;
}
.leftcontent{
    width:250px;
	height:500px;
	float:left;
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
<div class="left">
<div class="leftcontent">
<div class="menu2">
<p><img src="images/book.jpg" style="position:relative; width:30px;top:8px"/>管理学生菜单</p>
<ul>
  <li><a href="AddStudent.jsp">增加学生信息</a></li>
  <li><a href="magStudent.jsp">管理学生信息</a></li>
  <li><a href="">查询学生信息</a></li>
  <li><a href=""../demo.jsp">退出</a></li>
</ul>  
</div>
</div>
</div>
</body>
</html>