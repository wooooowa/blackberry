package com.blackberry.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.dao.ProductDAO;
import com.blackberry.dto.ProductDTO;

public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url ="index.jsp";
		
		// 동작하는 부분
		// : BEST상품출력 => BEST 상품을 DB에서 조회
		// Model단 이동(DAO)
		// ProductDAO pDao = new ProductDAO();
		// ArrayList<ProductDTO> bestlist = new ArrayList<>();
		// bestlist = pDao.bestview();
		
		// 싱글톤 패턴 
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bestList = pDao.bestView();
		List<ProductDTO> newList = pDao.newView();
		
		request.setAttribute("bestList", bestList);
		request.setAttribute("newList", newList);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);		//index.jsp로 이동
		forward.setRedirect(false); //forward방식을 사용
		
		return forward;
	}

}
