<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" errorPage="error.jsp" %>
<%@page import="java.sql.*,java.io.*,java.util.*,model.Salesperson,model.Administrator"%>
 
<jsp:useBean id="theUsers" class="model.Users" scope="request"/>
        <jsp:setProperty name="theUsers" property="*"/>
<%	
    boolean successflag=theUsers.validlogin();
	Administrator as = new Administrator();
	Salesperson ss=new Salesperson();
    if(successflag==true){ 			
        	  if(theUsers.getUsertype().equals("1")){
        		  as.setAccountname(theUsers.getAccountname());
        		  Administrator newAdmin = as.getByAccount();
        		  String administratorname = newAdmin.getAdministratorname();
        		  System.out.println(administratorname);
      			String administratorid = newAdmin.getAdministratorid();
        		  session.setAttribute("administratorname", administratorname);
        		  session.setAttribute("administratorid", administratorid);
        		  session.setAttribute("usertype", theUsers.getUsertype());
        		  response.sendRedirect("administrator/indexAdmin.jsp");
        	  }else{
        			ss.setAccountname(theUsers.getAccountname());
        			Salesperson newSale = ss.getByAccount();
        			String salesname = newSale.getSalesname();
        			String salespersonid = newSale.getSalespersonid();
        		  	response.sendRedirect("booksale/BookSaleing.jsp");
        		 	session.setAttribute("salesname", salesname);
        		  	session.setAttribute("salespersonid", salespersonid);
        		  	 session.setAttribute("usertype", theUsers.getUsertype());
        	  }
    }else{
    	request.setAttribute("returnname", theUsers.getAccountname());
    	
    	request.setAttribute("error", "用户名或者密码错误");
    	request.getRequestDispatcher("demo.jsp").forward(request, response);
    }
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>校验登陆是否成功</title>
	</head>
	<body>
		
	</body>
</html>