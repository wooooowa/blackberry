package com.blackberry.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.common.Constants;
import com.blackberry.dao.BoardDAO;
import com.blackberry.dto.BoardDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "boardList.bizpoll";

		// 파일 업로드 처리
		File uploadDir = new File(Constants.UPLOAD_PATH); // D:\\upload\\
		if(!uploadDir.exists()) { // 저장할 경로가 없다면
			uploadDir.mkdir();	  // 디렉토리를 생성하세요.
			
		}
		// request를 확장시킨 MultipartRequset생성
		// request는 전부 String 타입
		// 파일 <- request로는 전송불가
		// 파일 <- request를 향상 시킨 MultipartRequest를 사용
		// 파일뿐만 아니라 기존에 String 타입도 전부 multi타입으로 받아야함
		MultipartRequest multi = new MultipartRequest(request,                     	    // request
														Constants.UPLOAD_PATH,   	    // 파일업로드 디렉토리
														Constants.MAX_UPLOAD,   	    // 업로드 최대 용량
														"UTF-8", 					    // 인코딩
														new DefaultFileRenamePolicy()); // 파일이름중복정책
		
		int bno = Integer.parseInt(multi.getParameter("bno"));
		String writer = multi.getParameter("inputwriter");
		String title = multi.getParameter("inputtitle");
		String content = multi.getParameter("content");
		String filename = " "; // (공백)
		String postfile = multi.getParameter("post-file-name");
		int filesize = 0;
		
		System.out.println(bno + "," + title + "," + writer + "," + content + "," + postfile);
		
		try {
			Enumeration files = multi.getFileNames();
			
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				filename = multi.getFilesystemName(file1);  // 첨부파일의 파일이름
				File f1 = multi.getFile(file1);				// 첨부파일의 파일
				if(f1 != null) {
					filesize =(int)f1.length(); // 파일 사이즈 저장
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(filename == null || filename.trim().equals("")) {  
			filename = "-";		// 파일첨부 없을때 filename에 - 넣어주세요.(이름만저장!)
		}
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO bDto = new BoardDTO(bno, title, content, writer, filename, filesize);
		int result = bDao.boardUpdate(bDto);

		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);  // 등록, 수정은 true로 해야 반복되지않는다.
		
		return forward;
	}


}
