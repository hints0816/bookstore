<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage="../error.jsp"%>
    <%@ page import="java.sql.*,java.util.*,Util.DBConnection,model.BookMember" %>
     <%
     request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  
	  	String memid=request.getParameter("memid");
		String memname=request.getParameter("memname");
		String memnumber=request.getParameter("memnumber");
		String memlevel=request.getParameter("memlevel");
   
		System.out.println(memlevel);
		BookMember c1=new BookMember();
 	
	 	c1.setMemid(memid);
		c1.setMemname(memname);
		c1.setMemnumber(memnumber);
		c1.setMemlevel(memlevel);
     	
		if("1".equals(memlevel)){
			c1.setMemamount("201");
		}else if("2".equals(memlevel)){
			c1.setMemamount("401");
		}else if("3".equals(memlevel)){
			c1.setMemamount("601");
		}else{
			c1.setMemamount("801");
		}
		
 	if(c1.checkBookMember2()!= false){
		  c1.UpdateMember();
			response.sendRedirect("magMember.jsp");
			   }else{
				   	Map<String, String> errors=c1.getErrors();
					request.setAttribute("c1", c1);
					request.setAttribute("level", memlevel);
					request.setAttribute("errors", errors);
				 	request.getRequestDispatcher("updateMember_show.jsp").forward(request, response);
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