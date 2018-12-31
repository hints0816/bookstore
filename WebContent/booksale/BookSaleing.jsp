<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@page import="java.sql.*,java.io.*,java.util.*,model.BookTrade,model.Rank,model.BookInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/booksale.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<title>图书销售系统3.0</title>
<%@ include file="/templet/header.jsp" %>
<style type="text/css">

</style>
</head>
<c:set var="bt" value="${BookTrade()}"></c:set>
	<body>
	<div class="content">
		<div class="booklist">
		<table class="booktable">
			<tr>
				<th colspan="2">图书信息</th>
				<th>数量</th>
				<th>小计</th>
				<th>交易时间</th>
			</tr>
			<c:set var="bi" value="${BookInfo()}"></c:set>
			<c:set var="salespersonid" value="${salespersonid}"></c:set>
			<c:set var="display" value="${bt.displaysale(salespersonid)}"></c:set>
			<c:forEach var="dis" items="${display}">
			<tr>
			
				<c:set var="newbi" value="${bi.setBookid(dis.getBookid())}"></c:set>
				<td style="text-align:center;"><a href="${pageContext.request.contextPath}/bookinfo/bookinformation.jsp?bookid=${dis.getBookid()}"><img style="height:100px;width:70px;" src="${pageContext.request.contextPath}/bookimages/book${dis.getBookid()}.jpg"/></a></td>
				<td><div class="bookname">${bi.getBookInfo().getBookname()}</div><div class="author">${bi.getBookInfo().getAuthor()}</div><div class="sbookid" id="singlebookid${dis.getBookid()}">${dis.getBookid()}</div><a class="button-select blue" href="/BookStore/DeleteBookTradeServlet?bookid=${dis.getBookid()}">删除</a></td>
				<td class="salenum" id="choosenum${dis.getBookid()}" style="text-align:center;">
					<c:choose>
						<c:when test="${dis.getTradenum() >= 10}">
							<input style="width:46px;height:20px;" class="disnum" id="disnum${dis.getBookid()}" type="text" name="disnum" value="${dis.getTradenum()}"/>
						</c:when>
						<c:otherwise>
							<select class="booknum" id="number${dis.getBookid()}" style="height:25px;">
					<c:choose>
						<c:when test="${dis.getTradenum() == '1'}">
							<option value="1" selected="selected">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '2'}">
							<option value="1">1</option>
               			<option value="2" selected="selected">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '3'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3" selected="selected">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '4'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4" selected="selected">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '5'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5" selected="selected">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '6'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6" selected="selected">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '7'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7" selected="selected">7</option>
               			<option value="8">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '8'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8" selected="selected">8</option>
               			<option value="9">9</option>
               			<option value="10">10+</option>
						</c:when>
						<c:when test="${dis.getTradenum() == '9'}">
							<option value="1">1</option>
               			<option value="2">2</option>
               			<option value="3">3</option>
               			<option value="4">4</option>
               			<option value="5">5</option>
               			<option value="6">6</option>
               			<option value="7">7</option>
               			<option value="8">8</option>
               			<option value="9" selected="selected">9</option>
               			<option value="10">10+</option>
						</c:when>
					</c:choose>
					</select>
						</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align:center; color:rgb(200,28,27);font-size:20px;font-weight:bold;">¥${dis.getTradesum()}</td>
				<td style="text-align:right">${dis.getTradetime()}</td>
			</tr>
			</c:forEach>
		</table>
		
		
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
				<td class="money" colspan="2">小计 (${bt.getCount(salespersonid)} 件商品): <span class="totalmoney"> ¥ <span id="hint">${bt.getBookSum(salespersonid)}</span></span></td>
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
$(".disnum").on('focus',function(){
	var disnum = $(this).attr("id").substring(6, 32);
	var disnumber = $('#disnum'+disnum).val();
	var trans =$('#choosenum'+disnum);
	trans.html("<input style='width:46px;height:20px;'class='disnum' id='disnum' type='text' name='disnum' value='"+disnumber+"'/></br></br><button id='updatebutton' type='button'>更新</button>");
	
	trans.on('click','#updatebutton',function(){
		var transafter = trans.children('#disnum').val();
        $.get('/BookStore/updateNumberServlet?bookid='+disnum+'&sum='+transafter,function(result){
        
        },'json')
        window.location.reload();
    })
})
$(".booknum").on('change',function(){
	var bookid = $(this).attr("id").substring(6, 32);
	var sum = $(this).attr("id").substring(0, 32);
	var selectsum = $('#'+sum).val();
	if (selectsum=='10'){
		var trans =$('#choosenum'+bookid);
		trans.html("<input style='width:46px;height:20px;' id='transafter' type='text' name='transafter' value=''/></br></br><button id='updatebutton' type='button'>更新</button>");
		
		trans.on('click','#updatebutton',function(){
			var transafter = trans.children('#transafter').val();
            $.get('/BookStore/updateNumberServlet?bookid='+bookid+'&sum='+transafter,function(result){
            
            },'json')
            window.location.reload();
        })
	}else{
	
	$.get('/BookStore/updateNumberServlet?bookid='+bookid+'&sum='+selectsum,function(result){
		
	},'json')
	window.location.reload();
	}
})
$("#purchase").on('click',function(){
	return confirm("是否确认结账");
})
</script>
</html>