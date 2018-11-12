<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackBerry_게시판</title>
<style type="text/css">
	body { margin: 0; padding: 0; }
	ul { list-style-type: none; list-style: none; }
	a { text-decoration: none; color: black;}
	#board_layout {
		width: 1300px;
		margin: 0 auto;
		margin-top: 50px;
	}
	/* 게시판 */
	#board_tit {
		margin: 0 auto;
		font-size: 50px;
		font-weight: 800;
		background: url(img/bb_tit.png) 14px 0px no-repeat;
		padding: 5px 0 0 0;
		display: block;
		float: left;
		width: 100%;
		margin-bottom: 50px;
	}
	#board_top {
		margin: 0 auto;
		height: 150px;
		margin-bottom: 50px;
		display: block;
	}
	/* 검색창 */
	#wrap_search {
		width: 500px;
		height: 34px;
		float: left;
		display: inline-block;
	}
	select {
		width: 130px;
		height: 34px;
		box-sizing: border-box;
		display: inline-block;
		float: left;
		border: 2px solid #D5D5D5;
	}
	#search {
		width: 300px;
		border: 2px solid #D5D5D5;
		height: 34px;
		box-sizing: border-box;
		position: relative;
		margin-left: 140px;
	}
	input#board_search_keyword {
		width: 240px;
		height: 30px;
		font-size: 13px;
		box-sizing: border-box;
		border: 0px; /* input태그 기본 선을 없애줌 */
		padding-left: 10px;
	}
	input#board_search_btn {
		width: 55px;
		height: 30px;
		background-color: #D5D5D5;
		color: white;
		font-size: 13px;
		border: 0px;
		position: absolute;
		right: 0px;
		top: 0px;
	}
	/* 게시판정렬 */
	div.tab {
		width: 500px;
		height: 34px;
		margin-left: 925px;
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
		font-size: 18px;
		display: block;
		color: #8C8C8C;
		padding: 0 30px;
		
	}
	#tab_ul > li a:hover {
    color: #896AB7; /* 마우스 대면 글자색 네이버컬러로 바뀜 */
    }
    
    /* 게시판 테이블 */
    #layout_table {
    	margin: 0 auto;	
    	margin-top: 30px;
    	font-size: 16px;
    	border-top: 5px solid #2D0087;
    	border-bottom: 1px solid #2D0087;
    }
    table {
    	width: 1300px;
    	border-collapse: collapse;
    	border-spacing: 0;
    }
    td {
    	border-bottom: 1px solid #EAEAEA;
    }
    .tabele_h {
    	height: 50px;
    }
	.table_no {
		width: 100px;
		text-align: center;
	}
	.table_tit {
		width: 670px;
		text-align: left;
	}
	.table_user {
		width: 150px;
		text-align: center;
	}
	.table_date {
		width: 107px;
		text-align: center;
	}
	.table_select {
		width: 100px;
		text-align: center;
	}
	.table_file {
		width: 70px;
		text-align: center;
	}
	.table_like {
		width: 100px;
		text-align: center;
	}
	.fa-heart-o{
		color: red;
	}
	.fa-heart{
		color: red;
		display: none;
	}

	#like_cnt {
		cursor: pointer;
		line-height: 50px;
	}
	
	/* 글쓰기 버튼   */
	#board_bottom {
		margin: 0 auto;
		height: 150px;
		margin-top: 20px;
		display: block;
	}
	#btn_write {
    	background-color: #2D0087;
    	color: white;
    	font-size: 12px;
   		border: none;
		cursor: pointer;
		width: 80px;
		height: 40px;
		line-height: 40px;
		border-radius: 5px;
		float: right;
		text-align: center;
	}
	#btn_write:hover {
    	opacity: 0.8;
	}
	
	/* 페이지네이션 */
	.pagination {
		width: 800px;
		margin: 0 auto;
		padding-top: 50px;
		box-sizing: border-box;
	}
	.pagination a {
	    color: black;
	    float: left;
	    padding: 8px 16px;
	    text-decoration: none;
	    transition: background-color .3s;
	    margin: 0 auto;
	}
	.pagination a.active {
	    background-color: #654693;
	    color: white;
	}
	.pagination a:hover {
		background-color: #ddd;
	}
	
	.new_time {
		display: inline-block;
		background-color: #2D0087;
    	color: white;
    	width: 45px;
    	height: 20px;
    	line-height: 20px;
    	text-align: center;
    	border-radius: 10px;
    	font-size: 11px;
	}

</style>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#board_search_btn").click(function(){
			var flag = $("#sel_value").val();
			var keyword = $("#board_search_keyword").val();
			location.href="boardList.bizpoll?flag="+flag+"&keyword="+keyword;
		});
	});	
</script>

</head>
<body>
<div id="board_layout">
	<div id="board_tit">Q&A</div>
	<div id="board_top">
		<div id="wrap_search">
			<div id="selbox">
				<select id="sel_value" name="sel_value">
					<option value="3" selected="selected">카테고리 선택</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목 +내용</option>
					<option value="4">작성자</option>
				</select>
			</div>
			<div id="search">
					<input id="board_search_keyword" type="text" placeholder="검색어를 입력하세요."> 
					<input id="board_search_btn" type="submit" value="검색">  
					<!-- submit : 검색키워드를 JAVA로 보내줌 / value : 값 -->
			</div>
		</div>
		<div class="tab">
			<ul id="tab_ul">
				<li>
					<a href="">최신글순</a>
				</li>
				<li>
					<a href="">조회순</a>
				</li>
				<li>
					<a href="">댓글순</a>
				<li>		
			</ul>
		</div>
	</div>
	<div id="layout_table">
		<table>
			<tbody>
			<c:forEach items="${boardList}" var="bDto">
				<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="today2"/>
				<fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate2"/>
				<tr>
					<td class="tabele_h table_no">${bDto.bno}</td>
					<td class="tabele_h table_tit">
					<a href="boardViewcnt.bizpoll?bno=${bDto.bno}">${bDto.title}</a>
					<c:if test="${today2 == regdate2}">
						<span class="new_time">New</span>
					</c:if>	
					</td>
					<td class="tabele_h table_user">${bDto.writer}</td>		
					<td class="tabele_h table_date">
						<c:choose>
							<c:when test="${today2 == regdate2}">
								<fmt:formatDate pattern="HH:mm:ss" value="${bDto.regdate}"/>
							</c:when>
							<c:otherwise>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td class="tabele_h table_select">${bDto.viewcnt}</td>
					<td class="tabele_h table_file">
						<c:if test="${bDto.filesize > 0}">
							<span><i class="fa fa-paperclip"></i></span>
						</c:if>
					</td>
					<td class="tabele_h table_like">
						<!-- <span id="like_icon"></span> -->
						<span><i class="fa fa-heart-o" id="fa-o3"></i></span>
						<span><i class="fa fa-heart" id="fa3"></i></span>
						<span class="like_cnt">${bDto.goodcnt}</span>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="board_bottom">
		<c:choose>
			<c:when test="${empty sessionScope.loginUser}">
				<a href="login.bizpoll" id="btn_write">글쓰기</a>	
			</c:when>
			<c:otherwise>
				<a href="boardInsert.bizpoll" id="btn_write">글쓰기</a>
			</c:otherwise>
		</c:choose>		
		
		<div class="pagination">
			<c:if test="${pageMaker.prev}">
			  <a href="boardList.bizpoll?page=${pageMaker.startPage -1}">&laquo;</a>
			  <a href="boardList.bizpoll?page=${pageMaker.firstPage}">${pageMaker.firstPage}</a>
			  <a>...</a>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">  
			  <a <c:out value="${pageMaker.criDto.page == idx? 'class=active':''}"/> 
			   href="boardList.bizpoll?page=${idx}&flag=${flag}&keyword=${keyword}">${idx}</a>		  
			</c:forEach>  
			
			<c:if test="${pageMaker.next}">
			  <a>...</a>
			  <a href="boardList.bizpoll?page=${pageMaker.finalPage}">${pageMaker.finalPage}</a>
			  <a href="boardList.bizpoll?page=${pageMaker.endPage +1}">&raquo;</a>
			</c:if>
		</div>
	</div>
	
</div>
</body>
<%@ include file="/footer.jsp" %>
</html>