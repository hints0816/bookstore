<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" errorPage="../../error.jsp"%>
<%@page import="java.sql.Date,Util.DBConnection,java.sql.*,java.io.*,java.util.*,model.BookMember"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
 	request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  %>
<jsp:useBean id="c1" class="model.BookInfo" scope="request"/>
<jsp:setProperty name="c1" property="*"/>
	<%

		if(c1.checkBook()!= false){
			c1.AddBook();
				  response.sendRedirect("magBook.jsp");
						}else{
							Map<String, String> errors=c1.getErrors();
							request.setAttribute("c1", c1);
							request.setAttribute("errors", errors);
						 	request.getRequestDispatcher("addBook.jsp").forward(request, response);
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