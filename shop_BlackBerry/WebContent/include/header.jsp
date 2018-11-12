<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include.jsp" %>   
<% 
	String path = request.getContextPath(); //컨텍스트 경로
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackBerry_Shop</title>

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	* {
	   fontf -family: 'Nanum Gothic', serif;
	}
	body, ul{
		margin: 0px;
		padding: 0px;
	}
	ul{
		list-style-type: none;
	}
	a{
		text-decoration: none;
	}
	
	/* header(로그인, 회원가입, 마이페이지, 고객센터 ) */
	#header_line1{
		height: 30px;
		width: 100%;
		background-color: #353535;
		box-sizing: border-box;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1),
					0 6px 20px 0 rgba(0, 0, 0, 0.09);
	}	
	#header_line1_in{
		width: 70%;
		margin: 0 auto;	
	}
	#header_line1_ul {
		float: right;
	}
	#header_line1_ul > li > a{
		color: white;
		font-size: 11px;
		font-weight: bold;
		height: 30px;
		display: inline-block;
		padding: 0 10px;
		line-height: 30px;
	}
	#li_logout {
		color: #EAEAEA;
		font-size: 11px;
		height: 30px;
		
		display: inline-block;
		padding: 0 10px;
		line-height: 30px;
	}
	#li_logout > span {
		color: #D1B2FF;
		font-weight: bold;
	}
	#header_line1_ul > li{
		float: left; /* 태그들을 좌측, 우측 유동배치 */
		height: 30px;
		position: relative;

	}
	#header_line1_ul > li:hover{ /* li태그에 마우스를 올렸을 때 동작하는 내용 */
		background-color: #4A496F;
	}
	#header_line1_ul > li:hover #header_line1_dropdown { 
	/* #header_line1_ul > li hover했을 때 #header_line1_dropdown을 어떻게 제어할것인가 */
		display: block;
	}
	#header_line1_dropdown {
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		display: none; /* 존재자체를 없애는 것 */
		position: absolute;
		z-index: 1;
	}
	#header_line1_dropdown > a {
		display: block;
		font-size: 12px;   
		background-color: #353535;
		color: white;
		padding: 5px 10px;
		border-bottom: 1px solid #566270;
		width: 92px;
	}
	#header_line1_dropdown > a:hover{
		background-color: #4A496F;
		/* text-decoration: underline; 밑줄 */ 
	}
	#header_line1_mypage {
		width: 92px;
		text-align: center;
	}	
	/* 로고이미지, 검색창 */
	#header_line2 {
		width: 70%;
		height: 80px;
		margin: 15px auto;
		box-sizing: border-box;
	}
	#header_line2 img{
		display: inline-block;
		margin-top: 8px;
	}
	/* line2 검색창 */
	div#header_line2_wrap_search{
		height: 34px;
		display: inline-block;
		float: right;
		padding-top: 20px;
	}
	div#header_line2_search{
		border: 2px solid #566270;
		height: 34px;
		box-sizing: border-box;
		position: relative;
	}
	input#search_keyword {
		width: 353px;
		height: 30px;
		font-size: 13px;
		box-sizing: border-box;
		border: 0px; /* input태그 기본 선을 없애줌 */
		padding-left: 10px;
	}
	input#search_btn {
		width: 55px;
		height: 30px;
		background-color: #566270;
		color: white;
		font-size: 13px;
		border: 0px;
		position: absolute;
		right: 0px;
		top: 0px;
	}
	
	/* 네비게이션 메뉴바 */
	#header_line3{
		width: 100%;
		height: 49px;
		background-color: #566270;
		box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.15);
		box-sizing: border-box;	/* 크기고정 */	
	}
	#header_line3_ul > li {
		z-index:3;
		float: left;
		width: 180px;
		box-sizing: border-box;
		height: 49px;
		position: relative;
		text-align: center;
	}
	#header_line3_ul > li:hover {
		background-color: #4A496F;
		border-top: 5px solid white;
	}
	
	#header_line3_ul > li > a {
		width: 98px;
		color: white;
		line-height: 50px;
		font-size: 15px;
		display: inline-block;
	}
	#header_line3_in{
		width: 70%;
		margin: 0 auto;	
	}
	
	/* key dropdown */
	#header_line3_dropdown_key > a {
		background-color: #566270;
		display: block;
		color: white;
		width: 180px;
		text-align: center;
		padding: 5px 5px;
		line-height: 31px;
		font-size: 15px; 
	}
	#header_line3_dropdown_key > a:hover {
		background-color: #4A496F;
	}
	#header_line3_dropdown_key{
		position: absolute;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		box-sizing: border-box;		
		display: none;
	}
	#header_line3_ul > li:hover #header_line3_dropdown_key{
		display: block;
		top: 44px;
	}
	
	/* class dropdown */
	#header_line3_dropdown_classic > a {
		background-color: #566270;
		display: block;
		color: white;
		width: 180px;
		text-align: center;
		padding: 5px 5px;
		line-height: 31px;
		font-size: 15px; 
		
	}
	#header_line3_dropdown_classic > a:hover {
		background-color: #4A496F;
		
	}
	#header_line3_dropdown_classic {
		position: absolute;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		box-sizing: border-box;		
		display: none;
	}
	#header_line3_ul > li:hover #header_line3_dropdown_classic{
		display: block;
		top: 44px;
	}
	
	/* android dropdown */
	#header_line3_dropdown_Android >li >a {
		background-color: #566270;
		display: block;
		color: white;
		width: 180px;
		text-align: center;
		padding: 5px 5px;
		line-height: 31px;
		font-size: 15px;
		list-style-type: none;
	}
	#header_line3_dropdown_Android >li >a:hover {
		background-color: #4A496F;
	}
	#header_line3_dropdown_Android {
		display: none;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		box-sizing: border-box;	
		position: absolute;	
		
	}
	#header_line3_ul > li:hover #header_line3_dropdown_Android{
		display: block;
		top: 44px;
		
	}
	
	/* refur dropdown */
	#header_line3_dropdown_refur {
		display: none;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		box-sizing: border-box;	
		position: absolute;	
	}
	#header_line3_dropdown_refur > ul > li {
		background-color: #566270;
		position: relative;
	}
	#header_line3_dropdown_refur > ul> li:hover {
		background-color: #4A496F;
	}
	#header_line3_dropdown_refur ul > li >a {		
		display: block;
		color: white;
		width: 180px;
		text-align: center;
		padding: 5px 5px;
		line-height: 31px;
		font-size: 15px;
		list-style-type: none;
	}
	#header_line3_ul > li:hover #header_line3_dropdown_refur{
		display: block;
		top: 44px;
	}
	
	
	/* refur dropdown _ dropdown2 */
	#header_line3_dropdown2_refur {
		position:absolute;
		left: 180px;
		top: 0px;
		display: none;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		box-sizing: border-box;	
	}
	#header_line3_dropdown2_refur > a {
		display: block;
		background-color: #566270;
		color: white;
		width: 180px;
		text-align: center;
		padding: 5px 5px;
		line-height: 31px;
		font-size: 15px;
		list-style-type: none;
	}
	#header_line3_dropdown2_refur >a:hover{
		background-color: #4A496F;
	}
	#header_line3_dropdown_refur> ul >li:hover #header_line3_dropdown2_refur{
		display: block;
	}
	
</style>

</head>

<body>
	<header>
		<div id="header_wrap">
			<div id="header_line1">
				<div id="header_line1_in">
					<ul id="header_line1_ul">
						<c:choose>
							<c:when test="${empty sessionScope.loginUser}">
								<li><a href="login.bizpoll">로그인</a></li>
								<li><a href="constract.bizpoll">회원가입</a></li>
								<li>
								<a id="header_line1_mypage" href="">마이페이지▼</a>
									<div id="header_line1_dropdown">
										<a href="#">주문/배송</a>
										<a href="#">장바구니</a>
										<a href="#">위시리스트</a>
									</div>
								</li>
							</c:when>
							<c:otherwise>
								<li id="li_logout">
									<span>${sessionScope.loginUser.name}</span>
									(${sessionScope.loginUser.id})님
								</li>
								<li><a href="loginOut.bizpoll">로그아웃</a></li>
								<li>
								<a id="header_line1_mypage" href="">마이페이지▼</a>
									<div id="header_line1_dropdown">
										<a href="#">주문/배송</a>
										<a href="#">장바구니</a>
										<a href="#">위시리스트</a>
										<a href="<%=path %>/memberpw.bizpoll">비밀번호수정</a>
										<a href="<%=path %>/memberUpdate.bizpoll">회원정보</a>
										<a href="<%=path %>/memberdelete.bizpoll">회원탈퇴</a>
									</div>
							</li>
							</c:otherwise>
						</c:choose>
						
							
						<li><a href="">고객센터</a></li>
					</ul>
				</div>
			</div>
			<div id="header_line2">
				<a href="<%=path %>/index.bizpoll"><img id="header_logo" src="<%=path %>/img/logo1.png" alt="BlackBerry_logo" ></a>
				<div id="header_line2_wrap_search">
					<div id="header_line2_search">
						<input id="search_keyword" type="text" placeholder="검색어를 입력하세요."> 
						<input id="search_btn" type="submit" value="검색">  
						<!-- submit : 검색키워드를 JAVA로 보내줌 / value : 값 -->
					</div>
				</div>
			</div>
			<div id="header_line3">
				<div id="header_line3_in">
					<ul id="header_line3_ul">
						<li>
							<a href="<%=path %>/keyone.bizpoll">KEY시리즈</a>
							<div id="header_line3_dropdown_key">
								<a href="#">KEY1</a>
				 	    		<a href="#">KEY2</a>
							</div>
						</li>
				 	    <li>
				 	    	<a href="#">CLASSIC</a>
				 	    	<div id="header_line3_dropdown_classic">
				 	    		<a href="#">Q20</a>
				 	    		<a href="#">Q10</a>
				 	    		<a href="#">Q5</a>
				 	    	</div>
				 	    </li>
					    <li><a href="#">Android</a>
					    	<ul id="header_line3_dropdown_Android">
					    		<li><a href="#">패스포트</a></li>
					    		<li><a href="#">프리브</a></li>
					    	</ul>
					    </li>	
				 	    <li><a href="#">Accessory</a></li>
				 	    <li>
				 	    	<a href="#">중고제품</a>
				 	    	<div id="header_line3_dropdown_refur">
				 	    	<ul>
				 	    		<li><a href="#">KEY시리즈</a></li>
				 	    		<li>
				 	    			<a href="#">CLASSIC</a>
				 	    			<div id="header_line3_dropdown2_refur">
				 	    				<a href="#">Q20</a>
						 	    		<a href="#">Q10</a>
						 	    		<a href="#">Q5</a>
				 	    			</div>
				 	    		</li>
				 	    		<li><a href="#">Android</a></li>
				 	    		<li><a href="#">그외제품</a></li>
				 	    	</ul>
				 	    	</div>
				 	    </li>
				 	    <li><a href="<%=path %>/boardList.bizpoll">Q&A</a></li>
					</ul>
				</div>
				
			</div>
		</div>	
	</header>
	
	
	

</body>
</html>