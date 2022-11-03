package com.kenneth.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kenneth.dao.BoardDao;
import com.kenneth.dto.BoardVo;

public class BoardListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardListAction");

		BoardDao bDao = BoardDao.getInstance();
		BoardVo bVo = new BoardVo();
		
		// 기본 값 설정 (검색대상:column, 검색내용:keyword, 페이지:page)
		String column = "num";	// 검색 대상(분야)
		String keyword = "";	// 검색 내용(검색어)
		int page = 1;
		
		// 검색 입력 양식으로 부터 받은 검색 대상과 내용을 가져옴
		String t_column = request.getParameter("column");
		String t_keyword = request.getParameter("keyword");		
		String t_page = request.getParameter("p");			// page
		
		// 검색 대상, 내용, 페이지가 null이거나 ""이 아니라면, 사용
		if(t_column != null && !t_column.equals("")) {
			column = t_column;
		}
		if(t_keyword != null && !t_keyword.equals("")) {
			keyword = t_keyword;			
		}
		if(t_page != null && !t_page.equals("")) {
			page = Integer.parseInt(t_page);
		}

		// 게시판 등록 데이터 처리
//		bDao.insertBoard(bVo);
		
		// 컬럼과 키워드를 사용하여 DB로부터 검색한 결과 리스트를 반환하고 전달
//		List<BoardVo> boardList = bDao.selectAllBoards();		// 모든 행 데이터 표시
//		List<BoardVo> boardList = bDao.getBoardList(page);		// 하나의 페이지에 표시할 데이터
		List<BoardVo> boardList = bDao.getBoardList(column, keyword, page);		// 검색을 통해 하나의 페이지에 표시할 데이터
//		int count = bDao.getBoardCount();					// 전체 게시물 수
		int count = bDao.getBoardCount(column, keyword);	// 디비에서 키워드를 통해 검색한 게시물 수

		request.setAttribute("boardList", boardList);
		request.setAttribute("count", count);
		
		// 페이지 이동
		String url = "board/boardList.jsp";
		request.getRequestDispatcher(url).forward(request, response);
	}

}
