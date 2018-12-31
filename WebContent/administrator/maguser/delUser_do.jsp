<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage="../../error.jsp"%>
     <%@ page import="java.sql.*,Util.DBConnection,model.Users" %>
    <%
    request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
    String accountname=request.getParameter("id");
    Users cd = new Users();    
	try{
		cd.delUserById(accountname);
		response.sendRedirect("magUser.jsp");
		   }
		   catch(Exception e){
			   throw new Exception("error");
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