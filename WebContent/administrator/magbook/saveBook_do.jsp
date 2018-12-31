<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" errorPage="../../error.jsp"%>
    <%@ page import="java.sql.*,java.util.*,Util.DBConnection,JPA.SalespersonDao,model.Salesperson" %>
      <%
 	request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
	  %>
     <jsp:useBean id="c2" class="model.BookInfo" scope="request"/>
		<jsp:setProperty name="c2" property="*"/>
    <%
 	if(c2.checkBook()!= false){
		  c2.UpdateBook();
			response.sendRedirect("magBook.jsp");
			   }else{
				   	Map<String, String> errors=c2.getErrors();
					request.setAttribute("c2", c2);
					request.setAttribute("errors", errors);
				 	request.getRequestDispatcher("updateBook_show.jsp").forward(request, response);
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