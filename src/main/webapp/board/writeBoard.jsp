<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>
<link rel="stylesheet" type="text/css" href="css/product.css"> 
<script type="text/javascript" src="script/board.js"></script>
</head>
<body>
<div id="wrap" align="center">
<h2>게시글 등록</h2>
'*' 표시 항목은 필수 입력 입니다.
<form action="board?command=board_write" method="post" name="frm">
	<!-- <input type="hidden" name="command" value="board_write"> -->
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" name="name">*
			</td>
		</tr>
		<tr>
			<th>암 호</th>
			<td>
				<input type="text" name="pass" size="20">*
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="email" size="20">*
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title" size="70">*
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="80" rows="10" name="content" placeholder="게시글 내용을 작성하세요."></textarea>	</td>
		</tr>
	</table>
	<br>
	<input type="submit" value="등록" onclick="return checkBoard()">
	<input type="reset" value="취소">
	<input type="button" value="목록" onclick="location.href='board?command=board_list'">
</form>
</div>

</body>
</html>