<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" errorPage="../../error.jsp"%>
<%@page import="java.sql.Date,Util.DBConnection,java.sql.*,java.io.*,java.util.*,JPA.SalespersonDao,model.Salesperson"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  	String salesid=request.getParameter("salesid");
		String salesname=request.getParameter("salesname");
		String salesage=request.getParameter("salesage");
		String salessex=request.getParameter("salessex");
		String birthday=request.getParameter("birthday");
		String account=request.getParameter("account");
		
		Salesperson c1=new Salesperson();
		
		c1.setSalespersonid(salesid);
		c1.setSalesname(salesname);
		c1.setSalesage(salesage);
		c1.setSalessex(salessex);
		c1.setSalesbirthday(birthday);
		c1.setAccountname(account);
		
		
		if(c1.checkSales()!= false){
			SalespersonDao c=new SalespersonDao();
				  c.save(c1);
				  response.sendRedirect("magSales.jsp");
						}else{
							Map<String, String> errors=c1.getErrors();
							request.setAttribute("c1", c1);
							request.setAttribute("errors", errors);
						 	request.getRequestDispatcher("addSales.jsp").forward(request, response);
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