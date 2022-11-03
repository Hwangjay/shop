<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
<script type="text/javascript" src="script/product.js"></script>
</head>
<body>
<div id="wrap" align="center">
<h2>상품 등록 - 관리자 페이지</h2>

<!-- action 속성 생략 시, 해당 페이지 요청 시와 동일한 방식으로 요청 됨 -->
<!-- action="writeProduct.do" -->
<form method="post" enctype="multipart/form-data" name="frm">
	<table border="1">
<!-- 
		<tr>
			<th>상품코드</th>
			<td>
				<input type="text" name="code">
			</td>
		</tr>
 -->
		<tr>
			<th>상 품 명</th>
			<td>
				<input type="text" name="name" size="80px">
			</td>
		</tr>
		<tr>
			<th>가 격</th>
			<td>
				<input type="text" name="price"> 원
			</td>
		</tr>
		<tr>
			<th>사 진</th>
			<td><input type="file" name="pictureurl"></td>
		</tr>
		<tr>
			<th>설 명</th>
			<td><textarea cols="80" rows="10" name="description" placeholder="상품 설명을 작성하세요."></textarea>	</td>
		</tr>
		<tr>
			<th>등록일자</th>
			<td><input type="text" name="reg_date" placeholder="2022-10-03"> (예시) 2022-10-03 </td>
		</tr>
	</table>
	<br>
	<input type="submit" value="등록" onclick="return checkProduct()">
	<input type="reset" value="취소">
	<input type="button" value="목록" onclick="location.href='productList.do'">
</form>
</div>
</body>
</html>