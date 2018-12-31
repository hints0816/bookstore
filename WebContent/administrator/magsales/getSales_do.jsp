<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" errorPage="error.jsp"%>
<%@page import="java.sql.Date,Util.DBConnection,java.sql.*,java.io.*,java.util.*,JPA.SalespersonDao,model.Salesperson"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
    String salesid=request.getParameter("salesid");
    List<Salesperson> salesperson=null;
  
 try{
	 SalespersonDao cd=new SalespersonDao();
	 salesperson = cd.getSalesById(salesid);
	  request.setAttribute("salesperson", salesperson);
	  request.setAttribute("returncname", salesid);
	 request.getRequestDispatcher("getSales.jsp").forward(request, response);
 }catch(Exception e){
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