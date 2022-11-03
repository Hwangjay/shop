package com.kenneth.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Action 인터페이스를 구현 클래스를 만들고 객체를 생성 => 액션 객체 
public interface Action {
	// Action 인터페이스 모델을 수행하기 위한 추상 메서드
	public void execute(
			HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException;
}
