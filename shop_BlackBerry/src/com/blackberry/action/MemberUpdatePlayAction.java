package com.blackberry.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blackberry.dao.MemberDAO;
import com.blackberry.dto.MemberDTO;

public class MemberUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "";
		HttpSession session = request.getSession();

		String id = request.getParameter("inputid");
		String name = request.getParameter("inputname");
		String phone = request.getParameter("inputphone");
		
		String email_id = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		
		String email = email_id + "@" + email_url;
		
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO mDto = new MemberDTO(id, name, phone, email, zipcode, addr1, addr2);
		System.out.println(mDto.toString());
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memUpdate(mDto);
		if(result > 0) {  // 수정성공	
			url = "index.bizpoll";
			
			// session값을 최신정보로 수정!!!
			session.removeAttribute("id");
			session.setAttribute("loginUser", mDto);
			
		} else {  // 수정실패
			url = "memberUpdate.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}



