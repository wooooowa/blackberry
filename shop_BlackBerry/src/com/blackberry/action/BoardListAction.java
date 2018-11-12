package com.blackberry.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.dao.BoardDAO;
import com.blackberry.dto.BoardDTO;
import com.blackberry.dto.CriteriaDTO;
import com.blackberry.dto.PageMakerDTO;

public class BoardListAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "board/boardlist.jsp";
		
		CriteriaDTO criDto = new CriteriaDTO();
		int page = 1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		System.out.println("페이지 번호 : " + page);
		criDto.setPage(page);
		
		// 게시글 검색
		String flag = null;
		String keyword = null;
		if(request.getParameter("keyword") != null) {
			System.out.println("=====> 게시글 검색기능 작동!!!!");
			
			flag = request.getParameter("flag");
			keyword = request.getParameter("keyword");
			criDto.setFlag(flag);
			criDto.setKeyword(keyword);
			System.out.println(page + "," + flag + "," + keyword);
			request.setAttribute("flag", flag);
			request.setAttribute("keyword", keyword);
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		
		// 게시글 목록 출력
		List<BoardDTO> boardList = bDao.boardListAll(criDto);
		request.setAttribute("boardList", boardList);
		
		// 현재 날짜 출력
		Date today = new Date();
		request.setAttribute("today", today);
		
		// 게시글 페이지네이션
		PageMakerDTO pageMaker = new PageMakerDTO();
		pageMaker.setCriDto(criDto);
		
		int totalCount = bDao.totalCount(criDto);  // 15
		pageMaker.setTotalCount(totalCount);
		request.setAttribute("pageMaker", pageMaker);
		
		System.out.println("===================================");
		System.out.println(pageMaker.toString());

		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
