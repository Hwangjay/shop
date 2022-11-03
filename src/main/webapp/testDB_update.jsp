<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연동 시험</title>
</head>
<body>

<%
// (1 단계) JDBC 드라이버 로드
//Class.forName("com.mysql.jdbc.Driver");			// MySql
Class.forName("oracle.jdbc.driver.OracleDriver");	// Oracle

// (2 단계) 데이터 베이스 연결 객체 생성 
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String uid = "ora_user";
String pass = "1234";
Connection conn = DriverManager.getConnection(url, uid, pass);

// (3 단계) Statement 객체 생성
Statement stmt = conn.createStatement();

// (4 단계) SQL문 실행 및 결과 처리
// executeUpdate : 삽입(insert/update/delete)
//String sql_insert = "insert into member values('유재식', 'js1005', '1234', 'js1004@gmail.com', '010-5555-6666', 0)";
//String sql_update = "update member set phone='010-1234-5678' where userid='kenneth'";
String sql_delete = "delete from member where userid='js1005'";

//int result1 = stmt.executeUpdate(sql_insert);
//int result2 = stmt.executeUpdate(sql_update);
int result3 = stmt.executeUpdate(sql_delete);

//(5 단계) 사용한 리소스 해제
stmt.close();
conn.close();
%>

</body>
</html>