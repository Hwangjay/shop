<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
<script type="text/javascript" src="script/product.js"></script>
</head>
<body>
<div id="wrap" align="center">
<h2>상품 수정 페이지</h2>
<form action="updateProduct.do" method="post" enctype="multipart/form-data" name="frm">
	<input type="hidden" name="nonmakeImg" value=${product.pictureurl}>
	<table border="1">
		<tr>
			<td>
				<c:choose>
					<c:when test="${empty product.pictureurl}}">
						<img src="image/noimage.jpg" width="200px" height="200px">
					</c:when>
					<c:otherwise>
						<img src="upload/${product.pictureurl}" width="200px" height="200px">
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<table border="1">
					<tr>
						<th style="width:80px">상 품 명</th>
						<td><input type="text" name="name" value="${product.name}"></td>
					</tr>
					<tr>
						<th>가 격</th>
						<td><input type="text" name="price" value="${product.price}"> 원</td>
					</tr>
					<tr>
						<th>사 진</th>
						<td><input type="file" name="pictureurl"><br>(이미지 변경시 선택하세요.)</td>
					</tr>
					<tr>
						<th>설 명</th>
						<td><textarea cols="80" rows="10" name="description" >${product.description}</textarea>	</td>
					</tr>	
					<tr>
						<th>등록일자</th>
						<td><input type="text" name="reg_date" value="${product.reg_date}"> (예시) 2022-10-03 </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="code" value="${product.code}">
	<input type="submit" value="수정" onclick="return checkProduct()">
	<input type="reset" value="취소">
	<input type="button" value="목록" onclick="location.href='productList.do'">
</form>
</div>

</body>
</html>