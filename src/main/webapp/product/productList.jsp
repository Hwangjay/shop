<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 페이지</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
<style type="text/css">
</style>
</head>
<body>
<div id="wrap" align="center">
<h2>상품 리스트 - 관리자 페이지</h2>
	
<%-- 	${productList} --%>
	<!-- <table class="list" border="1"> -->
	<table class="list">
		<tr>
			<td colspan="7" style="border:white; text-align:right; padding-right:20px">
				<a href="writeProduct.do">상품 등록</a>
			</td>
		</tr>
		<tr>
			<th>코드</th>	<th>이름</th>	<th>가격</th>	<th>등록일자</th><th>상세</th><th>수정</th><th>삭제</th>	
		</tr>
		<!-- 상품  목록 출력 -->
		<c:forEach var="product" items="${productList}">
			<tr>				
				<td>${product.code}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.reg_date}</td>
				<td><a href="productDetail.do?code=${product.code}">상품상세</a></td>
				<td><a href="updateProduct.do?code=${product.code}">상품수정</a></td>
				<td><a href="deleteProduct.do?code=${product.code}">상품삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<%-- ${message} --%>
</div>

<div class="search">
	<form action="searchProduct.do">
		<select name="column">
			<option ${(param.column=="code")?"selected":""} value="code">상품코드</option>
			<option ${(param.column=="name")?"selected":""} value="name">이름</option>
			<option ${(param.column=="price")?"selected":""} value="price">가격</option>
			<option ${(param.column=="reg_date")?"selected":""} value="reg_date">등록일자</option>
		</select>
		<input type="text" name="keyword" value="${param.keyword}">
		<input type="submit" value="검색">
	</form>
</div>




</body>
</html>