<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 삭제 페이지</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
<script type="text/javascript" src="script/product.js"></script>
</head>
<body>
<div id="wrap" align="center">
<h2>상품 삭제 - 관리자 페이지</h2>

<form action="deleteProduct.do" method="post">
<table border="1">
	<tr>
		<td style="width:310px">
			<c:choose>
				<c:when test="${empty product.pictureurl}}">
					<img src="image/noimage.jpg">
				</c:when>
				<c:otherwise>
					<img src="upload/${product.pictureurl}">
				</c:otherwise>
			</c:choose>
		</td>
		<td>
			<table border="1">
				<tr>
					<th style="width:80px">상품명</th>
					<td>${product.name}</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>${product.price} 원</td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<div style="height:220px; width:100%">
							${product.description}
						</div>
					</td>
				</tr>	
				<tr>
					<th>등록 일자</th>
					<td>${product.reg_date}</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<input type="hidden" name="code" value="${product.code}">
<input type="submit" value="삭제">
<input type="button" value="목록" onclick="location.href='productList.do'">

</form>
</div>

</body>
</html>