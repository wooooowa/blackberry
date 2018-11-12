package com.blackberry.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.dao.MemberDAO;
import com.blackberry.dto.MemberDTO;

public class PwUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		String id = request.getParameter("updateId");
		String pw = request.getParameter("inputpw");
		
		System.out.println("변경할 ID:" + id);
		System.out.println("변경할 pw:" + pw);
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.pwUpdate(id, pw);
		if(result > 0) {  // pw 수정성공
			url = "index.bizpoll";
		} else {  // pw 수정실패
			url = "pwCheck.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
