package com.kenneth.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kenneth.dao.BoardDao;

public class BoardWriteFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardWriteFormAction");
		String url = "/board/writeBoard.jsp";
		
		BoardDao bDao = BoardDao.getInstance();
		request.getRequestDispatcher(url).forward(request, response);
	}

}
