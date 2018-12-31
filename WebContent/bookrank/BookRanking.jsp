<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@page import="java.sql.*,java.io.*,java.util.*,model.BookTrade,model.Rank,model.BookInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/left.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<title>图书销售排行1.0</title>
<%@ include file="/templet/header.jsp" %>
<style type="text/css">
.rankbook{
	color:rgb(200,28,27);
	width: 20px;    
    margin: 0 auto;    
    line-height: 45px;    
	padding:20px 7px;
	font-size:40px;
	font-weight:bold;
}
.back{
	padding:20px 7px;
	text-align:center;
}
</style>
</head>
	<body>
	<div class="content">
	<div class="menu2">
        <div class="menu_content">
        <div class="back"><a style="width:130px;line-height:25px" class="button-select blue" href="${pageContext.request.contextPath}/booksale/BookSaleing.jsp">返回销售界面</a></div>
      <div class="rankbook">${rankbook}</div>
      
	   </div>
	</div>
	
	<div class="main">
	<form action="/BookStore/BookRankServlet" method="post">
		<select id="ranktype" name="ranktype" style="height:28px;">
			            <option value="" style="display:none" >请排行类型</option>
               			<option value="1" >日</option>
               			<option value="2" >月</option>
               			<option value="3" >季度</option>
               			<option value="4" >年</option>
            			</select>
            			
          <select id="year" name="year" style="height:28px;">
			            <option value="" style="display:none" >请选择年份</option>
               			<option value="2018" >2018</option>
               			<option value="2017" >2017</option>
               			<option value="2016" >2016</option>
               			<option value="2015" >2015</option>
               			<option value="2014" >2014</option>
               			<option value="2013" >2013</option>
            			</select>
            			
            <select id="month" name="month" style="height:28px;">
			            <option value="" style="display:none" >请选择月份</option>
               			<option value="01" >1</option>
               			<option value="02" >2</option>
               			<option value="03" >3</option>
               			<option value="04" >4</option>
               			<option value="05" >5</option>
               			<option value="06" >6</option>
               			<option value="07" >7</option>
               			<option value="08" >8</option>
               			<option value="09" >9</option>
               			<option value="10" >10</option>
               			<option value="11" >11</option>
               			<option value="12" >12</option>
            			</select>			
            <select id="quarter" name="quarter" style="height:28px;">
			            <option value="" style="display:none" >请选择季度</option>
               			<option value="1" >第一季度</option>
               			<option value="2" >第二季度</option>
               			<option value="3" >第三季度</option>
               			<option value="4" >第四季度</option>
            			</select>						
            			
           <input id="day" type="date" name="rankdate" value=""/>
           
           <input class="button-select blue" type="submit" value="查询"/>
           </form>		
		<table>
			<tr>
				<th>排行：</th>
				<th>书名：</th>
				<th>销量：</th>
			</tr>
<%-- 			<c:set var="rk" value="${Rank()}"></c:set> --%>
<%-- 			<c:set var="daylist" value="${rk.bookrank('1','2018-01-01')}" ></c:set> --%>
			<c:forEach var="ranklisting" items="${ranklist}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${ranklisting.getBookname()}</td>
				<td>${ranklisting.getBookcount()}</td>
			</tr>
			</c:forEach>
		</table>
		</div>
		</div>
	</body>
	<%@ include file="/templet/footer.jsp" %>
<script type="text/javascript">
$("#ranktype").on('change',function(){
	var ranktype = $(this).val();
	if(ranktype=="4"){
		$("#year").removeAttr("disabled","disabled");
		$("#month").attr("disabled","disabled");
		$("#quarter").attr("disabled","disabled");
		$("#day").attr("disabled","disabled");
	}else if(ranktype=="3"){
		$("#year").removeAttr("disabled","disabled");
		$("#month").attr("disabled","disabled");
		$("#quarter").removeAttr("disabled","disabled");
		$("#day").attr("disabled","disabled");
	}else if(ranktype=="2"){
		$("#year").removeAttr("disabled","disabled");
		$("#month").removeAttr("disabled","disabled");
		$("#quarter").attr("disabled","disabled");
		$("#day").attr("disabled","disabled");
	}else if(ranktype=="1"){
		$("#year").attr("disabled","disabled");
		$("#quarter").attr("disabled","disabled");
		$("#month").attr("disabled","disabled");
		$("#day").removeAttr("disabled","disabled");
	}
})
</script>
</html>