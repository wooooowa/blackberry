package com.blackberry.action;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blackberry.common.Constants;

public class BoardDownloadAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		
		String filename = request.getParameter("file");
		/*System.out.println("파일이름 : " + filename);*/
		
		String path = Constants.UPLOAD_PATH +filename;
		// D:\\upload\\
		byte b[] = new byte[4096]; // byte배열 생성
		
		// 서버에 저장된 파일을 읽기 위한 스트림 생성
		FileInputStream fis = new FileInputStream(path);
		// 파일의 종류 (mimeType)
	    String mimeType = request.getServletContext().getMimeType(path);
	    
	    if(mimeType == null) {
	    	mimeType = "application/octet-stream; charset=utf-8";
	    	
	    }
	    // 파일 이름에 한글이 포함된 경우
	    // new String(바이트배열, 변환할 인코딩) 8859_1 서유럽언어
	    // header에 특수문자 사용못함, 서유럽언어로 변환
	    filename = new String(filename.getBytes("utf-8"), "8859_1");
	    
	    // http header
	    response.setHeader("content-Disposition", "attachment;filename=" + filename);
	    
	    // http body
	    // OutputStream 생성 (서버에서 클라이언트에 쓰기)
	    ServletOutputStream out = response.getOutputStream();
	    
	    // 실질적으로 파일을 다운로드 해주는 코드
	    // 파일이 35,000 byte => 한번에 다운로드 불가능  => 8번 반복해서 쪼개서 보내줌
	  
	    int numRead;
	    while(true) {
	    	// 4096 byte로 쪼개서 파일 읽어오기
	    	numRead = fis.read(b, 0, b.length);
	    	if(numRead == -1) break;
	    	out.write(b, 0, numRead);
	    }
	    // 파일 처리 관련 리소스 정리
	    fis.close();
		out.flush(); // 초기화
		out.close(); 
		
		return null;   // 파일만 다운받기때문에 페이지이동안함
	}

}
