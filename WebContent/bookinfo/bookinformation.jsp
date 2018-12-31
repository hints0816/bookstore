<%@page import="model.BookInfo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*,java.io.*,java.util.*,model.BookInfo,model.BookTrade"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/templet/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/booksale.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css">
<title>图书信息</title>
<style type="text/css">
* {
    margin:0;
    padding:0;
    font-family:"微软雅黑";
    font-weight:500;
}
.content{
    width:80%;
    height:480px;
    margin:10px auto 10px auto;
    min-width:1000px;
}
.bookimg{
 	margin-top:50px;
	width:35%;
    float:left;
}
.booklist{
	margin-top:20px;
	width:73%;
    float:left;
}
.totalmoney{
		font-weight:bold;
		color:rgb(200,28,27);
	}
	.money{
	text-align:center;
	font-size:18px;
	font-weight:bold;
	}
	#bookid{
		width:100%;
	}
	#tradenum{
		width:100%;
	}
	.info{
	margin-top:20px;
		width:62%;
    	float:left;
	}
	.edit{
	font-size:22px;
	font-weight:bold;
	color:rgb(255,88,1);
	}
</style>
</head>
<c:set var="bt" value="${BookTrade()}"></c:set>
<body>



<div class="content">
<div class="booklist">
<c:set var="bookid" value="${param.bookid}"></c:set>
<c:set var="bi" value="${BookInfo()}"></c:set>
<c:set var="bi2" value="${bi.setBookid(bookid)}"></c:set>
<c:set var="nbi" value="${bi.getBookInfo()}"></c:set>
<div class="bookimg">
<img style="height:350px;width:250px;box-shadow:2px 2px 4px 4px #CCCCCC;" src="${pageContext.request.contextPath}/bookimages/book${nbi.getBookid()}.jpg"/>
</div>
<div class="info">
<table style=" display:inline;font-size:18px;">
<tr><td style="font-size:35px;">${nbi.getBookname()}(${nbi.getBookid()})</td></tr>
<tr><td><span style="font-size:15px;"><a href="">${nbi.getAuthor()}</a></span><span style="font-size:15px;">（作者）</span></td></tr>
<tr><td>库存：${nbi.getBookcount()} 本</td></tr>
<tr><td>类别： ${nbi.getCategory()}</td></tr>
<tr><td>价格：¥ ${nbi.getPrice()}</td></tr>
<tr><td>出版社：${nbi.getPublish()}</td></tr>
<tr><td>出版日期：${nbi.getPublish_date()}</td></tr>
</table>
<div class="edit">编辑推荐：</div>
<div class="">
<!-- 这里每本书的详细信息没有存在数据库，而是放在properties,通过jstl的fmt:bundle获取资源文件绑定的属性
 -->
<fmt:bundle basename="config.bookdetails">  
    <fmt:message key="${bookid}" />  
</fmt:bundle> 
</div>
</div>
</div>
<div class="operation">
		<div class="manage">
		<div class="operation-top">
		<form action="/BookStore/BookSaleServlet" method="post">
		<table style="width:100%;font-size:20px;font-weight:bold;margin-bottom:30px;">
			<tr>
				<td style="font-weight:bold;">书号：</td>
				<td><input id="bookid" type="text" name="bookid" value=""/><span id="bookidhint"></span></td>
			</tr>
			<tr>
				<td style="font-weight:bold;">数量：</td>
				<td><input id="tradenum" type="text" name="tradenum" value=""/></td>
			</tr>
			<tr>
				<td colspan="2"><input style="color:#FFF;width:100%;margin-top:10px;" class="button-select blue" class="t2" type="submit" value="添加"/></td>
			</tr>
			</table>
		</form>
		</div>
		<div class="operation-bottom">
		<form action="/BookStore/BookSettleServlet" method="post">
			<table style="width:100%;font-size:20px;font-weight:bold;margin-bottom:30px;">
			<tr>
				<td style="font-weight:bold;">会员编号：</td>
				<td><input id="memid" type="text" name="memid" value=""/></td>
			</tr>
			<tr><td style="font-weight:bold;" id="memberhint" colspan="2"><br/></td></tr>
			<tr>
				<td class="money" colspan="2">小计 (${bt.getCount(salespersonid)} 件商品): <span class="totalmoney"> ¥ <span style="font-weight:bold;color:rgb(200,28,27);" id="hint">${bt.getBookSum(salespersonid)}</span></span></td>
			</tr>
			<tr>
				<td colspan="2"><input id="purchase" style="color:#FFF;width:100%;margin-top:10px;" class="button-select blue" type="submit" value="结账"/></td>
			</tr>
		</table>
		</form>
		</div>
		</div>
		<div class="rank">
			<a style="width:90%;line-height:24px;" class="button-select blue" href="${pageContext.request.contextPath}/bookrank/BookRanking.jsp">销售排行</a>
		</div>
		</div>
</div>
 <%@ include file="/templet/footer.jsp" %>
</body>
<script type="text/javascript">
$('#bookid').on('blur',function(){
	var bookidText = $('#bookid').val();
	$.get('/BookStore/CheckBookIdServlet?bookid='+bookidText,function(result){
		 $("#bookidhint").html(result);
		},'json')
})
$('#memid').on('blur',function(){
	var memidText = $('#memid').val();
	if(memidText!=""){
	$.get('/BookStore/CheckMemberServlet?memid='+memidText,function(result){
		if(result[2]=="0.95"){
			var discount = "九五折";
		}else if(result[2]=="0.90"){
			var discount = "九折";
		}else if(result[2]=="0.85"){
			var discount = "八五折";
		}else{
			var discount = "八折";
		}
		
		if(result[1]==null){
		$("#hint").html(result[0]);
		$("#memberhint").html("sorry！会员不存在！！");
		}else{
		 $("#hint").html(result[0]);
		 $("#memberhint").html("欢迎会员"+result[1]+"，享受<span style='font-weight:bold;color:rgb(200,28,27);'>"+discount+"</span>优惠");
		}
		},'json')
	}
})
$("#purchase").on('click',function(){
	return confirm("是否确认结账");
})
</script>
</html>