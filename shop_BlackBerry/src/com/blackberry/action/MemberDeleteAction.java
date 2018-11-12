package com.blackberry.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		
		// 회원삭제을 하려면 반드시 선행조건
		// : 로그인이 되있어야한다!!
		// : session이 null이 아니면 = 로그인
		HttpSession session = request.getSession(); // session값 가져옴
		if(session.getAttribute("loginUser") == null) {   //로그인 no
			url = "index.bizpoll";
		} else {   //로그인 ok
			url = "member_delet_agree.jsp";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}


}
