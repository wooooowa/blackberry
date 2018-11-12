<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>상품페이지</title>
<style type="text/css">
	body { margin: 0; padding: 0; }
	ul { list-style-type: none; list-style: none; }
	a { text-decoration: none; }
	#layout {
		margin: 0 auto;
		width: 1200px;
		height: 1500px;
	}
	#wrap_tit {
		padding: 10px 0px 10px 0px;
		font-size: 25px;
	}
	#wrap_img {
		float: left;
		padding-top:70px; 
	}
	#wrqp_box {
		float: right;
		width: 45%;
		padding: 40px 0 0 0;
		height: 600px;
	}
	.detail {
		float: left;
		color: #3b4065;
		display: block;
		width: 100%;
		margin: 10px 0;
	}
	#price {
		font-size: 40px;
	}
	#sel_op {
		padding: 5px;
    	background-color: white;
    	border: 1px solid #dadada;
		width: 460px;
		height: 30px;
		box-sizing: border-box;
	}
	#btn_cart {
		background-color: #eaeaea;
		color: #353535;
		width: 460px;
        height: 59px;
        font-size: 22px;
        text-align: center;
        display: block;
        line-height: 59px;
        margin-top: 20px;
	}
	#btn_buy {
		background-color: #494693;
        color: white;
        width: 460px;
        height: 59px; 
        font-size: 22px;
        text-align: center;
        display: block;                                  
        line-height: 59px;
  		margin-top: 50px;
	}
	.btn:hover {
    	opacity: 0.8;
	}
	p{
		font-size: 13px;
		color: #D5D5D5;
	}
	#agree_p {
		color: #747474;
	}
	.agree_line {
		color: #eaeaea;
		width: 460px;
		height:2px;
		float: left;
		display: block;
	}
	.agree_text {
		color: #CD3B3B;
		margin-top: 50px;
	}
	.d_img{
		margin: 0 auto;
		width: 100%;
	}
	#about {
		width: 1200px;
		margin: 0 auto;
	}

</style>

</head>
<body>
	<div id="layout">
		<div id="wrap_tit">
			<h1>BlackBerry 	Q20 64GB</h1>
		</div>
		<hr>
		<div id="wrap_img">
			<img src="img/bb_p1.jpg" alt="q20">
		</div>
		<div id="wrqp_box">
			<span class="detail" id="price">\500,000</span>
			<span class="detail"><b>상품코드</b> P0001</span>
			<span class="detail"><b>상품옵션</b></span>
			<select id="sel_op">
				<option value="" selected="selected">색상을 선택하세요</option>
				<option value="블랙">블랙</option>
				<option value="화이트">화이트</option>
				<option value="실버">실버</option>
			</select>
			<span class="detail"><b>배송비</b> 무료 (해외배송일 경우, 별도의 배송비가 추가됩니다.)</span>
			<span>
				<p>평일 12시 이전 주문하시면 당일발송됩니다.</p>
			</span>
			<div class="agree_line"><hr></div>
			
			<div class="agree">
				<h3 class="agree_text"><i class="fa fa-exclamation-circle"></i> 구매시 꼭 읽어주세요</h3>
				<p id="agree_p">본 기기는 해외단말기로서 국내 통신환경에 최적화 되어 있지 않아  데이터 속도<br>
				저하, 부가서비스/애플리케이션 미지원 등 일부 서비스가 제한적일 수 있습니다.</p>
			</div>
			<div class="agree_line"><hr></div>
			
			<div class="btn">	
				<a href="#" id="btn_buy">구매하기</a>
			</div>			
			<div class="btn">
				<a href="#" id="btn_cart">장바구니담기</a>
			</div>
		</div>
	</div>


</body>
<%@ include file="footer.jsp" %>
</html>