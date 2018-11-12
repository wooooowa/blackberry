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
		margin: 0 auto;
		padding: 20px 20px 35px 20px;
		background-color: white;			
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
		width: 650px;
		height: 28px;
		border: none;
		display: inline-block;
	}
	#writer_line {
		border: 2px solid #EAEAEA;
		margin-top: 10px;
		width: 500px;
		height: 30px;
		display: inline-block;
		margin-bottom: 15px;
	}
	#inputwriter {
		width: 300px;
		height: 25px;
		border: none;
		display: inline-block;
	}
	
	#content_layout {
		width: 1100px;
		margin: 0 auto;
		padding: 0;
		margin-bottom: 30px;
	}
	#content{
		width: 1000px;
		padding: 0;
	}

	#inputcontent {
		width: 1000px;
		border: none;
		margin-top: 20px;
		padding: 10px 0px 30px 0px; 
		margin-bottom: 10px;
		border: 1px solid #EAEAEA;
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
		color: #363636;
	}
	#div_button {
		width: 1000px;
		height: 50px;
		margin: 0 auto;
		margin-top: 20px;
		margin-bottom: 100px;
	}
	button {
    	background-color: #2D0087;
    	color: white;
   		border: none;
		cursor: pointer;
		width: 200px;
		height: 50px;
		line-height: 50px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.1),
					0 6px 10px 0 rgba(0, 0, 0, 0.1);
		font-size: 19px;
		display: inline-block;	
		float: right;
	}
	button:hover {
    	opacity: 0.8;
	}
	#delete_btn {
		margin-right: 30px;
		background-color: #5D5D5D;
	}


	/* 첨부파일 */
	.fileBox { width: 700px; border: 2px solid #EAEAEA; }
	.fileBox .fileName {
		display:inline-block;
		width:450px;
		height:28px;
		padding-left:10px;
		margin-right:5px;
		line-height:30px;
		border:none;
		background-color:#fff;
		vertical-align:middle;
		color: black;
	}
	.fileBox .btn_file {
		display:inline-block;
		background-color: #494693;
		width:100px;
		height:30px;
		color:white;
		font-size:12px;
		line-height:30px;
		text-align:center;
		vertical-align:middle;
		margin-left: 9px;
	}
	.fileBox input[type="file"] {
		position:absolute;
		width:1px;
		height:1px;
		padding:0;
		margin:-1px;
		overflow:hidden;
		clip:rect(0,0,0,0);
		border:0;
   }
   /* 경고문 */
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
   hr {
   		color: #EAEAEA;
   }
   .error {
    	color: #ED0000;
    	font-size: 12px;
    	display: none;
    	float: right;
    	height: 30px;
    	line-height: 30px;
    	margin-right: 100px;
    }

</style>
<script type="text/javascript" src="<%=path%>/smarteditor/js/service/HuskyEZCreator.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).on("click", "#insert_btn", function(elClickedObj){
		var title = $("#inputtitle").val();
		// 스마트에디터로 content부분 값 넘겨받는 부분
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		if(title == ""){
			$("#inputtitle").focus();
			$(".error").css("display", "block");
			return false;
		}
		$("#frm_bin").submit();
	});

</script>
</head>
<body>

	<div id="board_tit"><span id="board_tit_qa">Q&A</span></div>
	<div id="board_layout">
		<form action="boardInsertPlay.bizpoll" name="frm_bin" method="POST" id="frm_bin" enctype="multipart/form-data">
		<div id="content_layout">
			<div id="title_line">
				<span class="span_h">제 목</span>
				<span class="error"><b>제목을 입력해주세요.</b></span>
				<div id="title">
					<input type="text" id="inputtitle" name="inputtitle">
					
				</div>
			</div>
			<div id="writer_line">
				<span class="span_h">작성자</span>
				<div id="writer">
					<input type="text" id="inputwriter" value="${sessionScope.loginUser.id}" name="inputwriter" readonly="readonly">
				</div>
			</div>
			<div id="content_layout">
				<textarea id="content" name="content" rows="10" cols="100"></textarea>
			</div>
			
			<script type="text/javascript">
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
					oAppRef: oEditors,
					elPlaceHolder: "content",
					sSkinURI: "<%=path%>/smarteditor/SmartEditor2Skin.html",
					fCreator: "createSEditor2"
				});
			</script>
			
			<div class="fileBox">
				<span class="span_h">첨부파일</span>
				<input type="text" class="fileName" readonly="readonly">
				<label for="uploadBtn" class="btn_file">찾아보기</label>
				<input type="file" id="uploadBtn" name="uploadfile" class="uploadBtn">
			</div>
			
		</div>
			<!-- 경고문 -->
			<div id="waring">
				<ul id="waring_text">
					<li>· 문의가 집중되거나 주말의 경우 답변이 지연될 수 있습니다. 최대한 빠르게 답변 드리도록 하겠습니다.</li>
					<li>· 욕설, 비속어, 비방성 등의 부적절한 단어 포함되어 있는 경우, 처벌을 받을 수 있습니다.</li>
				</ul>
			</div>
			<hr>
			<div id="div_button">
				<button type="button" id="insert_btn">등 록</button>
				<button type="button" id="delete_btn">취 소</button>
			</div>
			
		<div>
		
		</div>	
	</form>	
</div>
</body>
<%@ include file="/footer.jsp" %>
</html>