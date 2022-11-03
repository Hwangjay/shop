<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
</head>
<body>

<div id="wrap" align="center">
	<h2>게시글 리스트</h2>

<!-- ================================ -->
<!-- 게시판 검색 기능 구현 -->
	<div class="search">
		<form action="board">
			<select name="column">
				<option ${(param.column=="num")?"selected":""} value="num">게시물번호</option>
				<option ${(param.column=="name")?"selected":""} value="name">작성자</option>
				<option ${(param.column=="title")?"selected":""} value="title">제목</option>
			</select>
			<input type="text" name="keyword" value="${param.keyword}">
			<input type="submit" value="검색">
		</form>
	</div>

<!-- ================================ -->
<!-- 게시판 리스트 기능 구현 -->
	<table class="list">
		<tr>
			<td colspan="5" style="border:white; text-align:right; padding-right:20px">
				<a href="board?command=board_write_form">게시글 등록</a>
			</td>
		</tr>
		<tr>
			<th>번호</th>	<th>제목</th>	<th>작성자</th><th>작성일</th><th>조회</th>	
		</tr>
		<!-- 게시글 목록 출력 -->
		<c:forEach var="board" items="${boardList}">
			<tr>				
				<td>${board.num}</td>
				<!-- 게시물 상세 페이지 경로 수정 예정 -->
				<td><a href="board?num=${board.num}">${board.title}</a></td>
				<td>${board.name}</td>
				<td>${board.writedate}</td>
				<td>${board.readcount}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	
<!-- ================================ -->
<!-- 페이징 기능 구현 -->
	<!-- 페이지 번호, 디비에서 전체 페이지 수 조회 -->
	<!-- 설계 : 5개 페이지 번호를 표시, 5번이 넘어가면 "다음" 버튼을 통해 이동, "이전" 버튼을 통해 복귀 -->
	<!-- 게시물 수 / 페이지 번호 / 페이지 시작번호(startNum) / 전체 페이지 끝번호(lastNum) -->
	<c:set var="page" value="${(empty param.p)?1:param.p}"></c:set>
	<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/5), '.')}"></c:set>
	
	<!-- 현재 페이지 / 총 페이지 -->
	<table>
	<tr>
		<td style="border:white; text-align:right; padding-right:20px">
			<div><span>${(empty param.p)?1:param.p}</span>/${lastNum} pages</div>
		</td>
	</tr>
	</table>
	
	<!-- 이전 페이지, 다음 페이지 링크 생성 -->
	<!-- 이전 페이지 링크를 생성하는 경우: (시작번호-1) 값이 0보다 커야 함 -->
	<c:if test="${startNum-1 > 0}">		<!-- startNum > 1 -->
		<a href="?command=board_list&p=${startNum-1}&column=${param.column}&keyword=${param.keyword}">이전 </a>
	</c:if>
	<!-- 이전 페이지 링크를 생성하지 못하는 경우: (시작번호-1) 값이 0보다 작거나 같아야함 -->
	<c:if test="${startNum-1 <= 0}">		<!-- startNum <= 1 --> 
		<span onclick="alert('이전 페이지가 없습니다.');">이전 </span>
	</c:if>
	
	<c:forEach var="i" begin="0" end="4">
		<!-- 마지막 게시물이 있는 페이지까지만 표시 -->
		<c:if test="${(i+startNum) <= lastNum}">
			<!-- // 해당 페이지인 경우, 스타일(컬러) 지정 -->
			<a style="color:${(page==(i+startNum))?'orange':''}" 
				href="?command=board_list&p=${i+startNum}&column=${param.column}&keyword=${param.keyword}">
				${i+startNum}
			</a>
		</c:if>			
	</c:forEach>
	
	<c:if test="${(startNum+4) < lastNum}">
		<a href="?command=board_list&p=${startNum+5}&column=${param.column}&keyword=${param.keyword}"> 다음</a>
	</c:if>
	<!-- 다음 페이지 링크를 생성하지 못하는 경우: (시작번호+4) 값이 마지막 숫자보다 커야함 -->
	<c:if test="${(startNum+4) >= lastNum}">
		<span onclick="alert('다음 페이지가 없습니다.');"> 다음</span>
	</c:if>
				
</div>

<!-- ================================ -->
<%-- <!-- 페이징 -->
<!-- 페이지 번호, 디비에서 전체 페이지 수 조회 -->
<!-- 설계 : 5개 페이지 번호를 표시, 5번이 넘어가면 "다음" 버튼을 통해 이동, "이전" 버튼을 통해 복귀 -->
<!-- 이전 1 2 3 4 5 다음 -->

<!-- 게시물 수 / 페이지 번호 / 페이지 시작번호(startNum) / 전체 페이지 끝번호(lastNum) -->
<!-- lastNum = Math.ceil(전체게시물 / 한페이지당 게시물수) -->
<!-- Math.ceil(30/10) = Math.ceil(3) = 3 -->
<!-- Math.ceil(32/10) = Math.ceil(3.xxx) = 4 -->
<c:set var="page" value="${(empty param.p)?1:param.p}"></c:set>
<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
<c:set var="lastNum" value="${Math.ceil(count/10)}"></c:set>
<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10), '.')}"></c:set>

<div>게시물 수: ${count}</div>
<div>페이지 번호: ${page}</div>
<div>페이지 시작번호: ${startNum}</div>
<div>전체 페이지 끝 번호: ${lastNum}</div>

<!-- 이전 페이지, 다음 페이지 링크 생성 -->
<!-- 이전 페이지 링크를 생성하는 경우: (시작번호-1) 값이 0보다 커야 함 -->
<c:if test="${startNum-1 > 0}">	
	<a href="?p=${startNum-1}">이전 </a>
</c:if>
<!-- 이전 페이지 링크를 생성하지 못하는 경우: (시작번호-1) 값이 0보다 작거나 같아야함 -->
<c:if test="${startNum-1 <= 0}">
	<span onclick="alert('이전 페이지가 없습니다.');">이전 </span>
</c:if>

<c:forEach var="i" begin="0" end="4">
	<a href="?p=${i+startNum}&column=${param.column}&keyword=${param.keyword}">${i+startNum}</a>	
</c:forEach>

<c:if test="${(startNum+4) < lastNum}">
	<a href="?p=${startNum+5}"> 다음</a>
</c:if>
<c:if test="${(startNum+4) >= lastNum}">
	<span onclick="alert('다음 페이지가 없습니다.');"> 다음</span>
</c:if> --%>

<!-- =========================== -->
<!-- 이전 페이지, 다음 페이지 링크 생성 -->
<%-- <c:set var="page" value="${param.p}"></c:set>
<c:set var="startNum" value="${page-(page-1)%5}"></c:set>

<a href="?p=${startNum-1}"> 
	이전
</a>
<c:forEach var="i" begin="0" end="4">
	<a href="?p=${i+startNum}">${i+startNum}</a>	
</c:forEach>
<a href="?p=${startNum+5}">
	다음
</a> --%>

<!-- =========================== -->
<!-- 처음 5개 페이지 링크 표시 -->
<!-- 페이지 시작번호: ?p=3 => 3-(3-1)%5 = 1 -->
<!-- startNum = page - (page-1) % page표시개수; -->
<!-- 6 7 8 9 10 -->
<%-- <c:set var="page" value="${param.p}"></c:set>
<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
<c:forEach var="i" begin="0" end="4">
	<a href="?p=${i+startNum}">${i+startNum}</a>	
</c:forEach> --%>
 
<!-- =========================== -->
<!-- 처음 5개 페이지 링크 표시 -->
<%-- <c:forEach var="i" begin="0" end="4">
	<a href="?p=${i+1}">${i+1}</a>	
</c:forEach> --%>

<!-- =========================== -->
<!-- 1 2 3 4 5 -->
<!-- <a href="?p=1">1</a>
<a href="?p=2">2</a>
<a href="?p=3">3</a>
<a href="?p=4">4</a>
<a href="?p=5">5</a> -->

<!-- =========================== -->
<!-- 1 2 3 4 5 -->

</body>
</html>