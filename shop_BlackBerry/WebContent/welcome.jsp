<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>       
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- refresh : 새로고침  content="3초뒤 index.bizpoll로 이동" -->
<!-- <meta http-equiv="refresh" content="3; url=index.bizpoll"> -->

<title>Welcome!</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
	body,h1 {font-family: "Raleway", sans-serif}
	body, html {height: 100%}
	.bgimg {
	    background-image: url('img/keyone_d.jpg');
	    min-height: 100%;
	    background-position: center;
	    background-size: cover;
	}
	#rCnt {
		margin: 0 auto;
		width: 100px;	
		font-size: 50px;
		text-align: center;
	}

</style>

<script type="text/javascript">
	var cnt=4; // 실행할때 1초가 걸리기때문에 4로 설정
	function countdown(){
		if(cnt == 0) { // 4, 3, 2, 1, 0
			clearInterval(s);
			location.href="index.bizpoll";
		}
		document.getElementById("rCnt").innerHTML=cnt;
		cnt--;			
	}
	var s = setInterval(countdown, 1000);  // Start!!!! 1초단위로 countdown()실행
</script>
</head>
<body>
	  <!-- 카운트다운 방법 -->
	  <!-- 1. meta 태그 활용
	  	   2. JavaScript의 setInterval()활용 -->
	  	   
	<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
	  <div class="w3-display-topleft w3-padding-large w3-xlarge">
	    <img alt="logo" src="img/blackberry-logo.png">
	  </div>
	  <div class="w3-display-middle">
	    <h1 class="w3-jumbo w3-animate-top">WELCOME! BlackBerry</h1>
	    <hr class="w3-border-grey" style="margin:auto;width:40%">
	    <p class="w3-large w3-center"><span id="rCnt">5</span></p>
	    <p class="w3-large w3-center">메인페이지로 이동합니다.</p>
	  </div>
	  <div class="w3-display-bottomleft w3-padding-large">
	             BlackBerry <a href="#" target="_blank">상품 바로보기</a>
	  </div>
	  	   
	</div>
</body>
</html>