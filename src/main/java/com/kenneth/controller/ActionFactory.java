package com.kenneth.controller;

import com.kenneth.controller.action.Action;
import com.kenneth.controller.action.BoardListAction;
import com.kenneth.controller.action.BoardWriteAction;
import com.kenneth.controller.action.BoardWriteFormAction;

// *** 커맨드 패턴 ***
// * 기존 방식:
//	- 주소에 요청(request)하면 파라미터(명령)에 의해 호출
//	- 서블릿을 통해 원한 비즈니스 로직을 수행

// * 적용 방식
//  - 주소에 명령(command)을 포함하여 컨트롤러 하나 두고 모든 요청을 처리
//  - 요청이 들어오면 그에 합당한 비즈니스 로직을 담은 모델을 찾아 수행

// ** 팩토리 패턴
// 컨트롤러에서 직접 모델(액션객체)을 생성하지 않는 대신,
// 액션객체를 생성해내는 팩토리(공장) 역할을 하는 클래스를 통해 생성 
public class ActionFactory {
	// 싱글톤
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory(){		
	}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	// 액션 객체: Action 인터페이스 구현 객체
	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory: "+ command);
		
		// 커맨드 패턴에 따른 명령 처리
		if(command.equals("board_list")) {
			// 처리할 액션 객체를 생성
			action = new BoardListAction();
		} else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		} else if(command.equals("board_write")) {
			action = new BoardWriteAction();
		}
		
		return action;
	}

}
