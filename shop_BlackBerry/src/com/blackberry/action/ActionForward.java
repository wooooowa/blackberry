package com.blackberry.action;

public class ActionForward {
	// View Page(결과값을 어디로 전송할지)
	private String path;
	// 페이지 이동하는 방법(sendRedirect, Forward)
	// true -> sendRedirect, false -> Forward
	private boolean isRedirect;  // index.jsp
	
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {   // path = index.jsp
		this.path = path;
	}
	public boolean isRedirect() {   // false
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {   
		this.isRedirect = isRedirect;
	}
	
	
}
