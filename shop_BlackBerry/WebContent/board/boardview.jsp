<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body { margin: 0; padding: 0; }
	ul { list-style-type: none; list-style: none; }
	a { text-decoration: none; }
	#board_layout {
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
	}
	#content_layout {
		width: 1000px;
		height: 100%;
		margin: 0 auto;
		border: 1px solid #D5D5D5;
		padding: 20px 20px 35px 20px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1),
					0 6px 10px 0 rgba(0, 0, 0, 0.1);
					
	}
	
	#board_tit {
		width: 1000px;
		margin: 0 auto;
		font-size: 50px;
		font-weight: 800;
		background: url(img/bb_tit.png) 14px 0px no-repeat;
		padding: 5px 0 0 0;
		display: block;
		margin-top: 20px;
	}
	#title_line {
		border: 2px solid #EAEAEA;
		margin-bottom: 10px;
		width: 1000px;
		height: 30px;
		display: inline-block;
	}
	#inputtitle {
		width: 600px;
		height: 25px;
		border: none;
		display: inline-block;
	}

	#inputdate {
		width: 150px;
		height: 30px;
		line-height: 30px;
		float: right;
		border: none;
		display: inline-block;
		color: #8C8C8C;
		font-size: 12px;
	}
	#writer_line {
		border: 2px solid #EAEAEA;
		margin-bottom: 10px;
		width: 1000px;
		height: 30px;
		display: inline-block;
	}
	#inputwriter {
		width: 500px;
		height: 25px;
		float: left;
		border: none;
	}
	#content {
		height: 100%;
		width: 1000px;
		border: none;
		padding: 10px 0px 10px 0px;
		margin-top: 20px; 
	}
	#inputcontent {
		width: 1000px;
		border: none;		
		padding: 10px 0px 20px 0px; 
		border-bottom: 1px solid #EAEAEA;
	}
	.span_h {
		width: 100px;
		height: 30px;
		line-height: 30px;
		display: inline-block;
		background-color: #EAEAEA;
		text-align:center;
		float: left;
		margin-right: 20px;
	}
	#div_button {
		width: 1042px;
		height: 50px;
		margin: 0 auto;
		margin-top: 20px;
		
	}
	button {
    	background-color: #5D5D5D;
    	color: white;
   		border: none;
		cursor: pointer;
		width: 100px;
		height: 30px;
		line-height: 30px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1),
					0 6px 10px 0 rgba(0, 0, 0, 0.1);
	}
	button:hover {
    	opacity: 0.8;
    	
	}
	#update_btn { background-color: #1F51B7; float: right; }
	#delete_btn { background-color: #ED4C00; float: right; margin-right: 10px;}
	#list_btn { background-color: #2D0087; }
	
	
	
	#reply {
		width: 1000px;
		height: 100%;
		margin: 0 auto;
		border: 1px solid #D5D5D5;
		padding: 20px 20px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1),
					0 6px 10px 0 rgba(0, 0, 0, 0.1);
		margin-bottom: 100px;			
	}
	#inputreply {
		width: 850px;
		height: 45px;
		display: inline-block;
	}
	#login_text {
		height: 30px;
		width: 1000px;
		color: #2D0087;
	}
	
	#insert_btn { 
		background-color: #5D5D5D;
		float: right;
		height: 45px;
		width: 115px;
	}
	
	div.tab {
		width: 500px;
		height: 30px;
		margin-bottom: 20px;
	}
	#tab_ul > li {
		float: left;
		position: relative;
	}
	#tab_ul >li:after {
		content:'';
		position:absolute;
		left:0;
		top:5px;
		width:1px;
		height:15px;
		background-color:#dddddd;
	}
	#tab_ul > li > a {
		font-size: 15px;
		display: block;
		color: #8C8C8C;
		padding: 0 20px;
		
	}
	#tab_ul > li a:hover {
    color: #896AB7; /* 마우스 대면 글자색 네이버컬러로 바뀜 */
    }
    .fa-heart-o {
    	color: red;
    	float: right;
    	width: 24px;
    	height: 24px;
    	line-height: 24px;
    }
    #reply_list {
    	width: 1000px;
    	background-color: #f6f6f6;
    	height: 100%;
    }
    #reply_content {	
    	height: 40px;
    	line-height: 40px;
    	margin-top: 10px;
    	display: block;
    	padding-bottom: 10px;
    }
    #replycontent_one {
    	width: 980px;
    	height: 100%;
    	margin: 0 auto;
    	border: none;
    	margin-bottom: 10px;
    	height: 100%;
    	background-color: white;
    }
    #waring {
    	width: 1000px;
    	height: 70px;
    	background: #f6f6f6 url(img/icon_exc.png) 25px 50% no-repeat;
    	color: #999999;
    	font-size: 12px;
    	margin-top: 10px;
    	position: relative; 
    }
    #waring_text{
    	list-style: none;
    	position: absolute;
    	top: 17px;
    	left: 80px;
    }
    .reply_padding {
    	margin-left: 10px;
    }
    
    hr{
    	border: 1px solid #EAEAEA;
    }
    #file_line {
		border: 2px solid #EAEAEA;
		margin-bottom: 10px;
		width: 700px;
		height: 30px;
		display: inline-block;
	}
	#inputfile {
		width: 500px;
		height: 30px;
		line-height: 30px;
		float: left;
		border: none;
		color: #2D0087;
		font-size: 13px;
	}
</style>
</head>
<body>
<div id="board_tit">Q&A</div>
<div id="board_layout">
	<div id="content_layout">
		<div id="title_line">
			<span class="span_h">제 목</span>
			<div id="title">
				<input type="text" id="inputtitle" value="${boardview.title}" name="inputtitle" readonly="readonly">
				
			</div>
		</div>
		<div id="writer_line">
			<span class="span_h">작성자</span>
			<div id="writer">
				<input type="text" id="inputwriter" class="input" value="${boardview.writer}" name="inputwriter" readonly="readonly">
				<span id="inputdate">작성일자　|　<fmt:formatDate pattern="yyyy-MM-dd" value="${boardview.regdate}"/></span>
			</div>
		</div>	
		
		<div id="content">
			${boardview.content}
			<input type="text" id="inputcontent" class="input" value=""name="inputcontent" readonly="readonly">
		</div>
		
		<div class="tab">
				<div id="file_line">
					<span class="span_h">첨부파일 <i class="fa fa-paperclip"></i></span>
					<div id="file">
					<span id="inputfile">
						<a href="download.bizpoll?file=${boardview.filename}">${boardview.filename}
						( <fmt:formatNumber pattern="0.0" value="${boardview.filesize/1024}"/> KB )</a>
					</span>	 
					</div>
				</div>

			<ul id="tab_ul">
				<li>
					<a href="">댓글 ${boardview.replycnt}</a>
				</li>
				<li>
					<a href="">조회수 ${boardview.viewcnt}</a>
				</li>
				<li>
					<a href="">좋아요 <span><i class="fa fa-heart-o"></i></span>${boardview.goodcnt}</a>
				</li>		
			</ul>
			
		</div>
		
	</div>
	<div id="div_button">
	
			<button type="button" id="reply_btn">답글</button>
			<button type="button" id="list_btn">목록</button>	

			<c:if test="${sessionScope.loginUser.id == boardview.writer}">
				<button type="button" id="update_btn">수정</button>
				<button type="button" id="delete_btn">삭제</button>
			</c:if>
	</div>
	<div>
		<div id="reply">
			<c:choose>
				<c:when test="${empty sessionScope.loginUser}">
					<span id="login_text">로그인을 하셔야 댓글을 작성하실 수 있습니다.</span>
				</c:when>
			<c:otherwise>
				<input type="text" id="inputreply" name="inputreply" placeholder="댓글을 작성해주세요.">
				<button type="button" id="insert_btn">등 록</button>
				<div id="waring">
					<ul id="waring_text">
						<li>· 문의가 집중되거나 주말의 경우 답변이 지연될 수 있습니다. 최대한 빠르게 답변 드리도록 하겠습니다.</li>
						<li>· 욕설, 비속어, 비방성 등의 부적절한 단어 포함되어 있는 경우, 처벌을 받을 수 있습니다.</li>
					</ul>
				</div>
			</c:otherwise>
			</c:choose>
				<div id="reply_list">
					<div id="reply_content">
						<span id="reply_writer" class="reply_padding"><b>작성자</b></span>
						<span id="reply_date">(작성일자)</span>
						</div>
					<div id="replycontent_one">
						<span class="reply_padding">너는 누구니? 왜 그런 질물을 하는거니</span>
					</div>
					<hr>
				</div>
		</div>
	</div>	
</div>
</body>
<%@ include file="/footer.jsp" %>
</html>