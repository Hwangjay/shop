<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
<h2>메인 페이지</h2>

회원 인증된 사용자에게 제공하는 페이지<br>

<form action="logout.do">
<table>
	<tr>
		<!-- 로그인 유저 이름/아이디 정보 표시 -->
		<%-- <td>안녕하세요. ${name}(${id})님</td> --%>
		<td>안녕하세요. ${loginUser.name}(${loginUser.userid})님</td>
	</tr>
	<tr>
		<td>
			<!-- 로그아웃, 회원정보변경 수행 -->
			<input type="submit" value="로그아웃">
			<input type="button" value="회원정보변경" onclick="location.href='updateMember.do?userId=${loginUser.userid}'">
			
		</td>
	</tr>
</table>
</form>

<!-- 데이터 전송 불가능 -->
<%-- <a href="productList.do?UserName=${loginUser.name}">상품 페이지</a> --%>
<%-- <input type="hidden" name="UserInfos" value="${loginUser}"> --%>
<%-- <a href="productList.do?UserInfos=${UserInfos}">상품 페이지</a> --%>

<%-- <a href="productList.do?UserName=${loginUser.name}">상품 페이지</a> --%>
<a href="productList.do">상품 페이지</a>
<br>
<a href="board?command=board_list">게시판 페이지</a>

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