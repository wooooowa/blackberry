package com.blackberry.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.blackberry.dao.MemberDAO;

public class IdCheckAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println("id:" + id);
		
		if(id != null) {
			if(id.trim().equals("") == false) {
				MemberDAO mDao = MemberDAO.getInstance();
				String msg = mDao.confirmID(id);
				/* Ajax => Json방식 => 값을 다시 전달 Json방식 */
				/* request.setAttribute("idCount", msg); */
				// json-simple 라이브러리 필요
				JSONObject jObj = new JSONObject();
				jObj.put("message", msg);
				jObj.put("id", id);
				//Json 객체에 담는 데이터를 호출한 페이지로 전송하는 기능
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(jObj);
			}
		}
		return null;
	}

}
