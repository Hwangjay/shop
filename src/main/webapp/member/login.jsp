<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
<h2>로그인</h2>
<form action="login.do" method="post" name="frm">
	<!-- <table border="1"> -->
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="userId"></td>
		</tr>
		<tr>
			<td>암 호</td>
			<td><input type="password" name="userPwd"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인" onclick="return checkLogin()">
				<input type="reset" value="취소">
				<input type="button" value="회원가입" onclick="location.href='join.do'">
			</td>
		</tr>		
	</table>
</form>

<div id="wrap" align="center">
<h2>회원 리스트 - 관리자 페이지</h2>
	<!-- <table class="list" border="1"> -->
	<table class="list">
		<tr>
			<th>회원번호</th>	<th>이름</th>	<th>암호</th>	<th>이메일</th><th>휴대폰</th>	
		</tr>
		<!-- 상품  목록 출력 -->
		<c:forEach var="member" items="${memberList}">
			<tr>				
				<td>${member.userid}</td>
				<td>${member.name}</td>
				<td>${member.pwd}</td>
				<td>${member.email}</td>
				<td>${member.phone}</td>
			</tr>
		</c:forEach>
	</table>
</div>



</body>
</html>