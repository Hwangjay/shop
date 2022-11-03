package com.kenneth.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kenneth.dto.BoardVo;
import com.kenneth.dto.ProductVo;
import com.kenneth.util.DBManager;

public class BoardDao {
	// 싱글톤
	private static BoardDao instance = new BoardDao();
	private BoardDao() {
	}
	public static BoardDao getInstance() {
		return instance;
	}
	
//	게시물 등록
//	입력값 : 전체 게시물 정보
//	반환값 : 쿼리 수행 결과
	public int insertBoard(BoardVo bVo) {
		
		int result = -1;
		Connection conn = null;
		// 동일한 쿼리문을 특정 값만 바꿔서 여러번 실행해야 할때, 매개변수가 많아서 쿼리문 정리 필요
		PreparedStatement pstmt = null;		// 동적 쿼리
		
		String sql = "INSERT INTO board(num, name, email, pass, title, content) "
				+ "VALUES(board_seq.nextval, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBManager.getConnection();
			
			// (3 단계) Statement 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getName());			
			pstmt.setString(2, bVo.getEmail());
			pstmt.setString(3, bVo.getPass());
			pstmt.setString(4, bVo.getTitle());
			pstmt.setString(5, bVo.getContent());
			
			// (4 단계) SQL문 실행 및 결과 처리
			result = pstmt.executeUpdate();				// 쿼리 수행
		} catch(Exception e) {
			e.printStackTrace();			
		} finally {
			DBManager.close(conn, pstmt);
		}
		return result;		
	}
	
//	게시물 목록 조회
//	반환값 : 게시물 데이터 정보
	public List<BoardVo> selectAllBoards(){
		String sql = "SELECT * FROM board order by num desc";
		BoardVo bVo = null;
		List<BoardVo> list = new ArrayList<BoardVo>();	// List 컬렉션 객체 생성
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			
			// (3 단계) Statement 객체 생성
			pstmt = conn.prepareStatement(sql);
			
			// (4 단계) SQL문 실행 및 결과 처리 => executeQuery : 조회(select)
			rs = pstmt.executeQuery();
			// rs.next() : 다음 행(row)을 확인, rs.getString("컬럼명")
			while(rs.next()){
				bVo = new BoardVo();
				// 디비로부터 회원 정보 획득
				bVo.setNum(rs.getInt("num"));		// 컬럼명 num인 정보를 가져옴
				bVo.setName(rs.getString("name"));	// DB에서 가져온 정보를 bVo객체에 저장
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				System.out.println(bVo);
				
				list.add(bVo);		// list 객체에 데이터 추가
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return list;
	}
	
//	한 페이지에 10개의 게시물 표시
//	게시판 하단에 페이지 표시
		
	// 게시글 검색
	public List<BoardVo> getBoardList(){
		return getBoardList("title", "", 1);
	}
	// 페이지 별 리스트 표시
	public List<BoardVo> getBoardList(int page){
		return getBoardList("title", "", page);
	}
	// 검색 기능과 페이징을 구현하여 게시물 리스트 획득 
	public List<BoardVo> getBoardList(String column, String keyword, int page){
		String sql = "SELECT * FROM ("
				+ "SELECT ROWNUM N, b.* "
				+ "FROM (SELECT * FROM board where "+column+" like ? order by num desc) b"
				+ ") "
				+ "WHERE   N BETWEEN ? AND ?";
//		첫번째 ? => 1, 11, 21, 31, 41, => an = 1+(page-1)*10 
//		등차수열의 n에 대한 식은 첫째항 A 공차가 B인 경우 => A + B(n-1)
//		두번째 ? => 10, 20, 30, 40 => page*10
		
		BoardVo bVo = null;
		List<BoardVo> list = new ArrayList<BoardVo>();	// List 컬렉션 객체 생성
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			
			// (3 단계) Statement 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ keyword +"%");		// keyword
			pstmt.setInt(2, 1+(page-1)*5);				// startNum		1, 6, 11, 16, ...	
			pstmt.setInt(3, page*5);					// 현재 페이지에서 표시할 마지막 번호		5, 10, 15, ...
			
			// (4 단계) SQL문 실행 및 결과 처리 => executeQuery : 조회(select)
			rs = pstmt.executeQuery();
			// rs.next() : 다음 행(row)을 확인, rs.getString("컬럼명")
			while(rs.next()){
				bVo = new BoardVo();
				// 디비로부터 회원 정보 획득
				bVo.setNum(rs.getInt("num"));		// 컬럼명 num인 정보를 가져옴
				bVo.setName(rs.getString("name"));	// DB에서 가져온 정보를 bVo객체에 저장
				bVo.setEmail(rs.getString("email"));
				bVo.setPass(rs.getString("pass"));
				bVo.setTitle(rs.getString("title"));
				bVo.setContent(rs.getString("content"));
				bVo.setReadcount(rs.getInt("readcount"));
				bVo.setWritedate(rs.getTimestamp("writedate"));
				System.out.println(bVo);
				
				list.add(bVo);		// list 객체에 데이터 추가
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	
	// 전체 게시물 수 조회
	public int getBoardCount() {
		return getBoardCount("title", "");
	}
	// 특정 컬럼의 키워드를 통해 전체 게시물 수 조회
	public int getBoardCount(String column, String keyword) {
		int count = 0;
		String sql = "SELECT COUNT(num) count FROM ("
				+ "SELECT ROWNUM N, b.* "
				+ "FROM (SELECT * FROM board where "+column+" like ? order by num desc) b"
				+ ") ";		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			
			// (3 단계) Statement 객체 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+ keyword +"%");
			
			// (4 단계) SQL문 실행 및 결과 처리 => executeQuery : 조회(select)
			rs = pstmt.executeQuery();
			// rs.next() : 다음 행(row)을 확인, rs.getString("컬럼명")
			if(rs.next()){
				count = rs.getInt("count");
			}	
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		
		return count;
	}
		
	
	// 게시물 번호로 특정 게시물 다음 게시물 데이터 조회
	public BoardVo getNextBoard(int num) {
		BoardVo bVo = null;
		return bVo;
	}
	// 게시물 번호로 특정 게시물 이전 게시물 데이터 조회
	public BoardVo getPrevBoard(int num) {
		BoardVo bVo = null;
		return bVo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
