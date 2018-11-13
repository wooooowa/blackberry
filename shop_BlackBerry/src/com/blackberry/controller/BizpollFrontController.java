package com.blackberry.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.action.Action;
import com.blackberry.action.ActionForward;
import com.blackberry.action.BoardDetailAction;
import com.blackberry.action.BoardDownloadAction;
import com.blackberry.action.BoardListAction;
import com.blackberry.action.BoardSearchAction;
import com.blackberry.action.BoardUpdateAction;
import com.blackberry.action.BoardUpdatePlayAction;
import com.blackberry.action.BoardViewcntAction;
import com.blackberry.action.BoardInsertAction;
import com.blackberry.action.BoardInsertPlayAction;
import com.blackberry.action.ConstractAction;
import com.blackberry.action.IdCheckAction;
import com.blackberry.action.IndexAction;
import com.blackberry.action.KeyoneAction;
import com.blackberry.action.LoginAction;
import com.blackberry.action.LoginOutPlayAction;
import com.blackberry.action.LoginPlayAction;
import com.blackberry.action.MemberAction;
import com.blackberry.action.MemberDeleteAction;
import com.blackberry.action.MemberDeletePlayAction;
import com.blackberry.action.MemberPlayAction;
import com.blackberry.action.MemberUpdateAction;
import com.blackberry.action.MemberUpdatePlayAction;
import com.blackberry.action.PwCheckAction;
import com.blackberry.action.PwUpdateAction;
import com.blackberry.action.PwUpdatePlayAction;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

/**
 * Servlet implementation class BizpollFrontController
 */
@WebServlet("/BizpollFrontController")
public class BizpollFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BizpollFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// GET, POST 둘다 받음
		// 한글깨짐 방지 (POST방식): 가장 위에 적어주세요.
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;   // 실제 동작하는 부분
		ActionForward forward = null;   // forward, sendRedirect 설정
		// uri - ctx = 내가 원하는 Action경로
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		
		System.out.println("uri: " + uri);
		System.out.println("ctx: " + ctx);
		System.out.println("페이지이동=====>" + command);
		
		//Action 이동
		if(command.equals("/index.bizpoll")) {
			action = new IndexAction();
			forward = action.excute(request, response);
		} else if(command.equals("/constract.bizpoll")) {
			action = new ConstractAction();
			forward = action.excute(request, response);
		} else if(command.equals("/member.bizpoll")) {
			action = new MemberAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberplay.bizpoll")) {
			action = new MemberPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/login.bizpoll")) {
			action = new LoginAction();
			forward = action.excute(request, response);
		} else if(command.equals("/LoginPlay.bizpoll")) {
			action = new LoginPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/loginOut.bizpoll")) {
			action = new LoginOutPlayAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberUpdate.bizpoll")){
			action = new MemberUpdateAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/memberupdateplay.bizpoll")){
			action = new MemberUpdatePlayAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/idCheck.bizpoll")){
			action = new IdCheckAction();
			forward = action.excute(request, response);		
		} else if(command.equals("/pwCheck.bizpoll")) {
			action = new PwCheckAction();
			forward = action.excute(request, response);
		} else if(command.equals("/memberpw.bizpoll")) {
			action = new PwUpdateAction();
			forward = action.excute(request, response);		
		} else if(command.equals("/memberpwplay.bizpoll")) {
			action = new PwUpdatePlayAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/memberdelete.bizpoll")) {
			action = new MemberDeleteAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/memberdeleteplay.bizpoll")) {
			action = new MemberDeletePlayAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/keyone.bizpoll")) {
			action = new KeyoneAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardList.bizpoll")) {
			action = new BoardListAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardSerch.bizpoll")) {
			action = new BoardSearchAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardDetail.bizpoll")) {
			action = new BoardDetailAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardViewcnt.bizpoll")) {
			action = new BoardViewcntAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardInsert.bizpoll")) {
			action = new BoardInsertAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardInsertPlay.bizpoll")) {
			action = new BoardInsertPlayAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/download.bizpoll")) {
			action = new BoardDownloadAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardUpdate.bizpoll")) {
			action = new BoardUpdateAction();
			forward = action.excute(request, response);	
		} else if(command.equals("/boardUpdatePlay.bizpoll")) {
			action = new BoardUpdatePlayAction();
			forward = action.excute(request, response);	
		}
		
		
		
		
		//공통 분기작업(페이지이동)
		if(forward != null) {
			if(forward.isRedirect()) {  //sendRedirect방식
				response.sendRedirect(forward.getPath());
			} else {  // false: forward방식
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}

}

