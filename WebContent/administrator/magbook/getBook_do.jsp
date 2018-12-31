<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8" errorPage="../../error.jsp"%>
<%@page import="java.sql.Date,Util.DBConnection,java.sql.*,java.io.*,java.util.*,model.BookInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
    request.setCharacterEncoding("utf-8");
	  response.setContentType("text/html;charset=utf-8");
    
    String bookname=request.getParameter("bookname");
    String publish=request.getParameter("publish");
    String author=request.getParameter("author");
    String category=request.getParameter("category");
    
    System.out.println(bookname);
    System.out.println(publish);
    System.out.println(author);
    System.out.println(category);
    List<BookInfo> bookinfo=null;
  
 try{
	 BookInfo cd=new BookInfo();
	 bookinfo = cd.searchBook(bookname,publish,author,category);
	  request.setAttribute("bookinfo", bookinfo);
	  request.setAttribute("rbookname", bookname);
	  request.setAttribute("rpublish", publish);
	  request.setAttribute("rauthor", author);
	  request.setAttribute("rcategory", category);
	 request.getRequestDispatcher("getBook.jsp").forward(request, response);
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