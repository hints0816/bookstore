<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8" errorPage="../../error.jsp"%>
<%@page import="java.sql.Date,Util.DBConnection,java.sql.*,java.io.*,java.util.*,model.BookMember"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%
	request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  	String memid=request.getParameter("memid");
		String memname=request.getParameter("memname");
		String memnumber=request.getParameter("memnumber");
		String memdate=request.getParameter("memdate");
		
		BookMember c1=new BookMember();
		
		c1.setMemid(memid);
		c1.setMemname(memname);
		c1.setMemnumber(memnumber);
		c1.setMemdate(memdate);
		c1.setMemamount("0");
		
		
		if(c1.checkBookMember()!= false){
			System.out.println(c1.checkMemberById(memid));
			if(c1.checkMemberById(memid)==true){
				request.setAttribute("c1", c1);
				request.setAttribute("existmember", "此会员已存在");
			 	request.getRequestDispatcher("addMember.jsp").forward(request, response);
			}else{
			c1.addMember();
			c1.addLevel(memid);
				  response.sendRedirect("magMember.jsp");
			}
						}else{
							Map<String, String> errors=c1.getErrors();
							request.setAttribute("c1", c1);
							request.setAttribute("errors", errors);
						 	request.getRequestDispatcher("addMember.jsp").forward(request, response);
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