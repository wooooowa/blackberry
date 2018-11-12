<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KEYONE</title>
<style type="text/css">
	body, ul {
		margin: 0;
		padding: 0;
	}
	#wrap {
		background-color: black;
	} 
	#inwrap {
		width: 1680px;
		margin: 0 auto;
		position: relative;
	}
	#over1 {
		position: absolute;
		top: 300px;
		left: 100px;
		color: white;
	}
	#keyone_img {
		position: absolute;
		width: 1680px;
		margin: 0 auto;
		top: 80px;
		left: 950px;
		height: 900px;
	}
	.section_wrap {
		background-color: #333;
		width: 1680px;
		margin: 0 auto;
		color: white;
		height: 580px;
	}
	.section {
		width: 418px;
		margin: 0 auto;
		text-align: center;
		float: left;
		background-color: #333;
		height: 250px;
	}
	.line {
		border-right: 1px;
		border-right-style: solid;
		border-right-color: #474747;
	}
	.section_text_1 {	
		font-size: 20px;
		opacity: 0.8 !important;
	}
	.section_text_2 {
		font-size: 80px;
		opacity: 0.8 !important;
		
	}
	.section_text_3 {
		font-size: 15px;
		opacity: 0.8 !important;
	}

</style>
</head>
<body>
	<div id="wrap">
		<div id="inwrap">
			<div id="over1">
				<img alt="" src="img/overview-1_1-1.png"><br><br>
				<img alt="" src="img/overview-1_2.png"><br>
				<p>Impressively designed and distinctly different, BlackBerry KEYone
				<br>reimagines how we communicate and get things done.</p>
			</div>
			<div id="keyone_img">
				<img alt="" src="img/keyonepdp1.png">
			</div>
			<div id="back_img">
				<img alt="keyone" src="img/keyone_d.jpg">
			</div>
			<div class="section_wrap">
				<div class="section line">
					<br>
					<span class="section_text_1">Screen</span><br><br>
					<span class="section_text_2">4.5’’</span><br><br>
					<span class="section_text_3">Touchscreen</span>
				</div>

				<div class="section line">
					<br>
					<span class="section_text_1">Battery</span><br><br>
					<span class="section_text_2">26+</span><br><br>
					<span class="section_text_3">Hours</span>
				</div>

				<div class="section line">
					<br>
					<span class="section_text_1">Camera</span><br><br>
					<span class="section_text_2">12MP</span><br><br>
					<span class="section_text_3">Auto-focus Large pixel</span>
				</div>

				<div class="section">
					<br>
					<span class="section_text_1">Support</span><br><br>
					<span class="section_text_2">256GB</span><br><br>
					<span class="section_text_3">MicroSD card</span>
				</div>

				<img alt="" src="img/keyone_blt.JPG" width="1683px">
			</div>
		</div>
	</div>	
</body>
<%@ include file="footer.jsp" %>
</html>