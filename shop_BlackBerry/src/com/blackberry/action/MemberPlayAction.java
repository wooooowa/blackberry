package com.blackberry.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.dao.MemberDAO;
import com.blackberry.dto.MemberDTO;

public class MemberPlayAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "welcome.jsp";
		
		// view단에서 전송한 데이터를 받아오세요.
		String id = request.getParameter("inputid");
		String pw = request.getParameter("inputpw");
		String name = request.getParameter("inputname");
		String phone = request.getParameter("inputphone");
		
		String email_id = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		
		String email = email_id + "@" + email_url;
		
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, email, zipcode, addr1, addr2);
		/*System.out.println(mDto.toString());	*/
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memInsert(mDto);
		if(result > 0) {  // 등록성공	
			
		} else {  // 등록실패
			url = "member.bizpoll";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
