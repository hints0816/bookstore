<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" errorPage="../../error.jsp"%>
<%@page import="java.sql.Date,Util.DBConnection,java.sql.*,java.io.*,java.util.*,model.Users"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  	String accountname=request.getParameter("accountname");
		String usertype=request.getParameter("usertype");
		
		Users c1=new Users();
		
		c1.setAccountname(accountname);
		c1.setPassword("123456");
		c1.setUsertype(usertype);
		
		
		if(c1.checkUser()!= false){
			c1.addUser();
				  response.sendRedirect("magUser.jsp");
						}else{
							Map<String, String> errors=c1.getErrors();
							request.setAttribute("c1", c1);
							request.setAttribute("errors", errors);
						 	request.getRequestDispatcher("addUser.jsp").forward(request, response);
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>