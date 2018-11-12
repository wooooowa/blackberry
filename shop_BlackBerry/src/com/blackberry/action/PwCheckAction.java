package com.blackberry.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.blackberry.dao.MemberDAO;

public class PwCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("id: " + id);
		System.out.println("pw: " + pw);
		
		// DB에서 pw값 가지고 와서 비교
		// id값을 구하는 방법 2가지(Session)
		// 1. Controller단에서 Session객체 호출해서 ID값 빼오는 방법
		// 2. View단에서 Session에 담겨있는 id값을 pw값과 함께 보내는 방법
		
		// 2번째 방법
		MemberDAO mDao = MemberDAO.getInstance();
		String msg = mDao.confirmPW(id, pw);

		JSONObject jObj = new JSONObject();
		jObj.put("message", msg);

		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);

		return null; // 페이지 이동하지않기 위해 null을 넣음
	}

}
