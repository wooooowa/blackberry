<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackBerry_회원탈퇴</title>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	body, ul {
		margin: 0;
		padding: 0;	
		font-family: 'Nanum Gothic', sans-serif;
		background-image: url('img/back_q20.png');
		background-repeat: no-repeat;
			
	}
	ul { list-style-type: none; }
	a {
		text-decoration: none;
	}
	
	#box {
		width: 1000px;
		height: 800px;
		margin: 0 auto;
		background-color: #f5f6f7;
	    opacity: 0.93;
	   	margin-top: 70px;
		border: 1px solid #dadada;
		border-radius: 10px;

	}
	#content_layout {
		width: 460px;
		margin: 0 auto;
		margin-top: 20px;
		padding: 10px;
	}
	#header_div img {
		display: block;
		margin: 30px auto;
	}
	#header_div > h4 {
		text-align: center;
		font-size: 35px;
		font-weight: 100;
		margin-bottom: 20px;
	}
	hr {
    	margin: 0 auto;
    	border: thin solid #EAEAEA;
    }

	h3 {
		font-size: 15px;
	}
	.div_input {
		background-color: white;
		border: 1px solid #dadada;
		width: 408px;
		height: 29px;
		margin: 0 auto;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}	
	#bb_pw img {
		vertical-align: middle;
		margin-left: 25px;
	}

	.input_join {
		width: 358px;
		height: 16px;
		border-width: 0px;
		padding: 7px 0px 6px 0px;
		cursor: pointer;
		position: relative;
		margin: 0 auto;
	}

	#btn_o {
		width: 460px;
        height: 59px;
        font-size: 22px;
        text-align: center;
        background-color: #494693;
        color: white;
        display: block;
        padding-top: 2px;
        line-height: 59px;  
        margin: 0 auto;
	}
	#btn_x {
		width: 460px;
        height: 59px;
        font-size: 22px;
        text-align: center;
        background-color: #5D5D5D;
        color: white;
        display: block;
        margin: 0 auto;
        padding-top: 2px;
        line-height: 59px; 
        margin-top: 10px; 
        
	}
    
    /* copyright~ */
    #address {
    	margin: 0 auto;
    	text-align: center;
    }
    #address * {
    	font: 9px verdana;
    }
    #address img {
    	vertical-align: middle;
    }

    .error {
    	color: #ED0000;
    	font-size: 12px;
    	display: none;
    	position: absolute;
    	margin: 20px 0px;
    }
    .text {
    	text-align: center;
    }
    #agree {
    	width: 430px;
    	margin: 0 auto;
    }
    #agree > h4{
    	color: #494693;
    	font-size: 13px;
    }
    #agree > p {
    	font-size: 11px;
    }
    .red  {
    	color: red;
    }
    
    #modal_all {
		z-index: 3;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		display: none;
		border: 1px solid #dadada;
		border-radius: 10px;
	}
	#modal_layout > h3 {
		text-align: center;
	}
	#modal_layout > h4 {
		font-size: 25px;
		text-align: center;
	}
	#close_btn {
		position: absolute;
		right: 20px;
		top: 15px;
		color: gray!important;
		font-size: 20px;
		padding: 5px;
		display: block;
	}
	#close_btn:hover {
		background-color: #ccc;
	}
	
	#modal_layout {
		width: 460px;
		margin: 0 auto;
		margin-top: 100px;
		border: 1px solid #dadada;
		padding: 30px;
		background-color: #f5f6f7;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19);
		position: relative;			
	}
	
	button {
    	background-color: #5D5D5D;
    	color: white;
   		padding: 14px 20px;
   	    margin: 10px 13px;
   		border: none;
		cursor: pointer;
		width: 200px;
	}
	button:hover {
    	opacity: 0.8;
	}


</style>


<!-- input focus -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		/* focus : 초점을 가게 하는 것  blur : 초점이 해제하는 것 */
		$("#inputpw").focus(function(){
			$("#bb_pw").css("border", "1px solid #5F00FF");
		});

		$("#inputpw").blur(function(){
			$("#bb_pw").css("border", "1px solid #dadada");
		});
		
		/* Modal창 켜고 끄기 */
		$("#btn_o").click(function(){
			$("#modal_all").css("display", "block");	
			
		});
		$("#close_btn").click(function(){
			$("#inputpw").val("");
			$("#modal_all").css("display", "none");
		});
		
	});	


	/* 현재 비밀번호 입력받은 값이 일치한지 확인 하는 과정 */
	$(document).on("click", "#y_btn", function(){
		var nowPw = $("#inputpw").val();
			$.ajax({
				url: "memberdeleteplay.bizpoll",
				type: "POST",
				dataType: "json",
				data: "id=${sessionScope.loginUser.id}&pw=" + nowPw,
				success: function(data){
					
					if(data.message == "-1"){
						location.href="index.bizpoll";
					} else {
						$("#modal_all").css("display", "none");
						$("#inputpw").select();
						$("#inputpw").next().text("비밀번호가 일치하지 않습니다.").css("display", "block").css("color", "#F46665");
						$("#inputpw").parent().css("margin-bottom", "30px");
					}
				},
				error:function(){
					alert("System Error!!");
				}
				
			});
		});
</script>

</head>
<body>
<div id="box">
	<div id="content_layout">
		<header>
			<div id="header_div">
				<a href="index.bizpoll">
					<img alt="블랙베리로고" src="img/logo1.png">
				</a>
				<h4><b>회원탈퇴</b></h4>
				<h3 class="text">유의사항 확인 후 탈퇴신청을 해주시기 바랍니다.</h3>
				<hr>
			</div>
			<div id="agree">
			<h4>BlackBerry 아이디는 재사용 및 복구 불가안내</h4>
			<p>회원탈퇴 진행시 본인을 포함한 타인 모두 <span class="red">아이디 재사용이나 복구가 불가능</span>합니다.
			       또한 회원 탈퇴 처리 중에는 취소가 불가능하니 신중하게 결정바랍니다.</p>
			<h4>회원정보 및 서비스 삭제 안내</h4>
			<p><span class="red">회원정보 및 서비스 이용기록이 모두 삭제</span>되며, 삭제된 데이터는 복구되지않습니다.
			       회원 탈퇴시 적립금, 할인 쿠폰 등 모두 소멸되며 재가입시에도 복원되지 않습니다.</p>
			
			</div>
			<hr>
		</header>
		
		<section>
			<form action="" name="" method="POST" id="">
				<span><h3>비밀번호</h3></span>
				<div class="div_input" id="bb_pw">
					<label for="inputpw" ></label>
					<input type="password" id="inputpw" name="inputpw" class="input_join">
					<span class="error">필수정보입니다.</span>
					<span id="pwicon"><img src="img/pc_icon.png"></span>
				</div>

				<!-- 탈퇴 버튼 -->
				<div><a href="#" id="btn_o">예, 탈퇴하겠습니다.</a></div>
				<div><a href="#" id="btn_x">취소하기</a></div>
			</form>	
		</section>
		<br><br>
		<footer>
			<div id="footer">
               
                <div id="address">
                    <span>
                        <a href="#">
                            <img id="addr_logo" alt="블랙베리로고" src="img/logo2.png" width="20">
                        </a>
                    </span>
                    <span>Copyright</span>
                    <span>ⓒ</span>
                    <span>
                        <strong>
                            <a href="#">BlackB Corp.</a>
                        </strong>
                    </span>
                    <span>All rights Reserved.</span>
                </div>
            </div>
		</footer>
	</div>
	<div id="modal_all">
		<div id="modal_layout">
			<span id="close_btn"><i class="fa fa-close"></i></span>
			<h4>회원탈퇴</h4><hr>
			<h3>정말 BlackBerry 쇼핑몰을 <span class="red">탈퇴</span>하시겠습니까?</h3>
			<button type="button" id="n_btn">아니요</button>
			<button type="button" id="y_btn">예</button>
		</div>
	</div>
</div>
</body>
</html>