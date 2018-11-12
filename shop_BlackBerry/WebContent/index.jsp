<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- 스크립트릿 : JAVA를 사용할 수 있게 해줌  -->
<!-- index.jps 페이지에 header.jsp 페이지를 추가 -->
<%@ include file="include/header.jsp" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BLACKBERRY</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	body { margin: 0; padding: 0; }
	ul { list-style-type: none; list-style: none; }
	a { text-decoration: none; }
	
	/* 네비게이션 */
	nav {
		width: 300px; 
		font-weight: bold;
		color: #757575;
		text-align: center;
		position: fixed;
		height: 100%;
		top: 0px; /* position위치 */
		animation: animateleft 0.6s;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2),
					0 4px 20px 0 rgba(0,0,0,0.19);
		z-index: 5;
		background-color: white;
				
	}
	#nav_div {
		padding-top: 80px;
		
	}
	#close_btn {
		background-color: black;
		width: 20px;
		height: 70px;
		padding: 24px 0;
		box-sizing: border-box;
		position: absolute;
		right: -20px; /* 버튼위치 */
		top: 400px; /* 버튼위치 */
	}
	#close_btn > i {
		color: white;
		font-size: 12px;
	} 
	#nav_div > h3 {
		font-size: 40px;
		padding-top: 20px;
		padding-bottom: 30px;
		margin: 10px 0;
		font-weight: 400;
	}
	
	.nav_a {
		display: block; 
		width: 100%;
		padding: 12px 16px;
		font-size: 20px;
		color: #757575;
		box-sizing: border-box;
	}
	.nav_a:hover {
		color: black;
		background-color: #ccc;
	}
	#snslink {
		width: 207px;
		height: 42px;
		margin: auto;
		padding: 10px 0;
	}
	#snslink > ul > li {
		float: left;
		padding: 0 10px;
		font-size: 36px;
		
	}
	#snslink > ul > li > a {
		color: black; 
	}
	
	/* 캐러셀 */
	.row {
		width: 80%;
		margin: 0 auto;
	}
	.btn_buy {
		text-align: right;
	}
	/* Best title */
	.bb_tt {
		height: 100px;
		width: 1490px;
		margin: 0 auto;
		margin-bottom: 8px;
	}
	.bb_tt_h3 {
		float: left;
	}
	.bb_tt_h3 > h3 {
		font-weight: 700;
		font-size: 30px;
		background: url(img/bb_tit.png) 14px 0px no-repeat;
		padding: 25px 0 0 0px;
		margin-bottom: 1px;
		display: inline-block;
	}
	div.tab {
		width: 500px;
		margin-left: 1100px;
		line-height: 100px;
	}
	
	#tab_ul {
		overflow: hidden;
	}
	#tab_ul > li {
		float: left;
		position: relative;

	}
	#tab_ul >li:after {
		content:'';
		position:absolute;
		left:0;
		top:45px;
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
	
	
	/* video */
	#video_wrap {
		background-color: black;
		height: 900px;
	}
	#video_wrap > h3 {
		font-size: 40px;
		text-align: center;
		color: white;
	}
	#video_wrap span {
		color: white;
	}
	#video_wrap_in {
		float: left;
		margin: 0px 203px auto;
	}
    #video_wrap_in > div {
		float: left;
		padding: 0px 10px;
		
	}
	
	/* Top버튼 */
	#myBtn {
		width: 100px;
		height: 100px;
		background-color: black;
		color: white;
		transform: rotate(315deg);
		position: fixed;
		right: -50px;
		bottom: -50px;
		text-align: center;
		font-size: 12px;
	}
	#myBtn:hover {
		background-color: #4A496F;
	}

	.p_name {
		text-align: center;
		display: none;
		font-size: 20px;
	}
	.col-md-3:hover .p_name {
		display: block;
	}
	#price {
		text-align: right;
	}
	
    
</style>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$('.carousel').carousel({
			  interval: 2000
			});
	});
	
	$(document).ready(function(){
		var state = false; /* 현재상태 변수 */
		$("#arrowright").css("display", "none");
		$("#nav").animate({left: '-300px'}, 300);
		$("#arrowleft").css("display", "none");
		$("#arrowright").css("display", "inline-block");
		$("#content").css("padding-left", "0px");
		
		
		$("#close_btn").on("click", function(){
			if(!state) { /* true일 때 */
				$("#nav").animate({left: '-300px'}, 300);
				$("#arrowleft").css("display", "none");
				$("#arrowright").css("display", "inline-block");
				$("#content").css("padding-left", "0px");
			} else {
				$("#nav").animate({left: '0px'}, 300);
				$("#arrowright").css("display", "none");
				$("#arrowleft").css("display", "inline-block");
				$("#content").css("padding-left", "300px");
			}
			state = !state;
		});			
	});


</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#myBtn").css("display", "none");
	});
	$(window).scroll(function(){
		if($(document).scrollTop() > 20) {
			$("#myBtn").css("display", "block");
		} else {
			$("#myBtn").css("display", "none");
		}
	});
	$(document).on("click", "#myBtn", function(){
		/* $(document).scrollTop(0); */
		$("html, body").animate({scrollTop: 0}, 1000);
	});
	
</script>
</head>
<body>
	<!-- 네비게이션 -->
		<nav id="nav">
			<div id="close_btn">
				<i class="fa fa-chevron-left" id="arrowleft"></i>
				<i class="fa fa-chevron-right" id="arrowright"></i>
			</div>
		<div id="nav_div">	
			<a id="nav_logo"><img src="img/logo2.png"></a>
			<h3><b>BlackBerry</b><br><br>￣</h3>
			<a class="nav_a" href="#">About Us</a>
			<a class="nav_a" href="#">Support</a>
			<a class="nav_a" href="#">Contact Us</a>
			<br><br><br>
			<div id="snslink">
				<ul>
					<li><a href="https://ko-kr.facebook.com/FacebookKorea/"><i class="fa fa-facebook-official"></i></a></li>
					<li><a href="https://www.instagram.com"><i class="fa fa-instagram"></i></a></li>
					<li><a href="https://twitter.com"><i class="fa fa-twitter"></i></a></li>
					<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
				</ul>
			</div>
		</div>	
		</nav>
		
	
	<!-- main 캐러셀 -->
	<section>
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="img/bb0.JPG" alt="">
		      <div class="carousel-caption">
		        
		      </div>
		    </div>
		    <div class="item">
		      <img src="img/bb0.JPG" alt="">
		      <div class="carousel-caption">
		        <br>
		      </div>
		    </div>
		    <br>
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</section>


	<!-- 베스트상품목록 6개 -->
	<div class="row">
	<br><br>
	<div class="bb_tt">
		<div class="bb_tt_h3">
			<h3>　BlackBerry Best Products</h3>
		</div>
		<div class="tab">
			<ul id="tab_ul">
				<li>
					<a href="">CLASSIC</a>
				</li>
				<li>
					<a href="">KEY</a>
				</li>
				<li>
					<a href="">PASSPORT</a>
				<li>		
			</ul>
		</div>
	</div>
	  <c:forEach items="${bestList}" var="bestDto">
		  <div class="col-sm-6 col-md-4">
		    <div class="thumbnail">
		      <img src="img/${bestDto.p_img}" alt="best">
		      <div class="caption">
		        <h3>${bestDto.p_name}</h3>
		        <%-- <h3>${bestDto.p_price}</h3> --%>
		        <fmt:setLocale value="ko_kr"/>
		        <h3 id="price"><fmt:formatNumber value="${bestDto.p_price}" type="currency"/></h3>
		        <p>The BlackBerryr®Classic™ is the smart phone you trust, with the power you couldn't imagine.</p>
		        <p class="btn_buy"><a href="#" class="btn btn-default" role="button" id="btn_buy">Buy Now</a></p>
		      </div>
		    </div>
		  </div>
	  </c:forEach>
	  </div>
		  <br><br><br>
		  
	<!-- 신상품목록 4개 -->
	<div class="row">

	  <div class="bb_tt">
		  <div class="bb_tt_h3">
		  	<h3>　BlackBerry New Products</h3>
		  </div>
	  </div>
	  
	  <c:forEach items="${newList}" var="newDto">
		  <div class="col-xs-6 col-md-3">
		    <a href="#" class="thumbnail">
		      <img src="img/${newDto.p_img}" alt="new">
		    </a>
		    <h5 class="p_name">${newDto.p_name}</h5>
		  </div>
	  </c:forEach>

	</div>
	<br><br><br><br><br><br>
	
	<!-- 동영상 -->
	<div id="video_wrap">
		<br><br><br><br>
		<h3><b>Do more. Faster.</b> <br>
			Smarter keyboard with shortcuts</h3>
			<br><br><br>
		<div id="video_wrap_in">
			<div>
				<video src="img/BlackBerryKeyOne1.mp4" style="width: 475px; visibility: visible;" autoplay="autoplay" loop="loop"></video>
				<br><span>
					<h1>Shortcuts</h1>
					<p>Program each key to instantly bring up <br>
					   contacts and apps you use most often, <br>
					   such as pressing “B” to open browser.</p>
				</span>   
			</div>	
			<div>
				<video src="img/BlackBerryKeyOne2.mp4" style="width: 475px; visibility: visible;" autoplay="autoplay" loop="loop"></video>
				<br><span>
					<h1>Shortcuts</h1>
					<p>Program each key to instantly bring up <br>
					   contacts and apps you use most often, <br>
					   such as pressing “B” to open browser.</p>
				</span> 
			</div>	
			<div> 
				<video src="img/BlackBerryKeyOne3.mp4" style="width: 475px; visibility: visible;" autoplay="autoplay" loop="loop"></video>
				<br><span>
					<h1>Shortcuts</h1>
					<p>Program each key to instantly bring up <br>
					   contacts and apps you use most often, <br>
					   such as pressing “B” to open browser.</p>
				</span> 
			</div>	
		</div>
		<br><br><br><br>
	</div>
	<!-- 동영상 -->

	<!-- Top버튼 -->
	<div id="myBtn">
		<span>Top</span>
	</div>


</body>
<%@ include file="footer.jsp" %>
</html>