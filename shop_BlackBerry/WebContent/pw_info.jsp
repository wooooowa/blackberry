<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackBerry_비밀번호수정</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	body, ul {
		margin: 0;
		padding: 0;	
		font-family: 'Nanum Gothic', sans-serif;
		background-image: url('img/back_q20.png');
			
	}
	ul { list-style-type: none; }
	a {
		text-decoration: none;
	}
	
	#box {
		width: 500px;
		height: 730px;
		margin: 0 auto;
		background-color: #f5f6f7;
	    opacity: 0.96;
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
		font-size: 15px;
		font-weight: 100;
		margin-bottom: 20px;
	}
	hr {
    	width: 98%;
    	margin: 20px auto;
    	border: thin solid #EAEAEA;
    }
	
	/* Section(input, 로그인버튼) */
	#group_join{
		color: #8c8c8c;
		font-size: 11px;
		text-align: right;
		margin-bottom: 7px;
	}
	#group_join > a {
		color: inherit;
	}
	h3 {
		font-size: 15px;
	}
	.div_input {
		background-color: white;
		border: 1px solid #dadada;
		width: 408px;
		height: 29px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}	
	#bb_pw img {
		vertical-align: middle;
		margin-left: 25px;
	}
	#bb_pw_ck img {
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
	}
	
	/* 주소 css  */
	#bb_adress > input {
		margin-top: 10px;
	}
	#sample6_postcode {
		background-color: white;
		border: 1px solid #dadada;
		width: 278px;
		height: 20px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}
	#ad_btn {
		background-color: #4A496F;
		border: 0; 
		color: white;
		height: 41px;
		width: 120px;
		margin: 0 auto;
	}
	.address {
		background-color: white;
		border: 1px solid #dadada;
		width: 408px;
		height: 20px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}
	#btn_join {
		width: 460px;
        height: 59px;
        font-size: 22px;
        text-align: center;
        background-color: #494693;
        color: white;
        display: block;
        padding-top: 2px;
        line-height: 59px;
        margin-top: 30px;

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
    
    /* 이메일 select */
    #bb_email {
    	padding: 5px;
    	background-color: white;
    	border: 1px solid #dadada;
    }
	#bb_email input, select {
		width: 140px;
		height: 30px;
		box-sizing: border-box;
	}
    .error {
    	color: #ED0000;
    	font-size: 12px;
    	display: none;
    	position: absolute;
    	margin: 20px 0px;
    }

</style>


<!-- input focus -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){

		/* focus : 초점을 가게 하는 것  blur : 초점이 해제하는 것 */
		$("#inputpw0").focus(function(){
			$("#bb_pw0").css("border", "1px solid #5F00FF");
		});
		$("#inputpw").focus(function(){
			$("#bb_pw").css("border", "1px solid #5F00FF");
		});
		$("#inputpw_ck").focus(function(){
			$("#bb_pw_ck").css("border", "1px solid #5F00FF");
		});
	

		$("#inputpw0").blur(function(){
			$("#bb_pw0").css("border", "1px solid #dadada");
		});
		$("#inputpw").blur(function(){
			$("#bb_pw").css("border", "1px solid #dadada");
		});
		$("#inputpw_ck").blur(function(){
			$("#bb_pw_ck").css("border", "1px solid #dadada");
		});
		
		
		/* error 체크 */
		$(".input_join").blur(function(){
			/* input태그에 입력된 값을 가져옴 */
			var inputVal = $(this).val();
			/* input태그 값이 없으면 경고창 출력 */
			if(inputVal == "") {
				$(this).next().text("필수정보입니다.").css("display", "block");
				$(this).parent().css("margin-bottom", "30px");
			} else {
				$(this).next().css("display", "none");
				$(this).parent().css("margin-bottom", "10px");
			}
			
		});
		/* 비밀번호  재확인 input태그를 blur했을 때 비밀번호와 비밀번호 재확인 값을 비교 */
		$("#inputpw_ck").blur(function(){
			var pw1 = $("#inputpw").val();
			var pw2 = $("#inputpw_ck").val();
			if(pw1 != "" && pw2 != "") {
				if(pw1 == pw2) {  /* 값이 일치한 경우  */
					$(".checkpw").next().css("display", "none");
				} else {  /* 값이 일치하지않는 경우 */
					$(this).next().text("비밀번호가 일치하지 않습니다.").css("display", "block");
					$(this).select;
					$(this).parent().css("margin-bottom", "30px");
				}
			}
			
		});
	});	
	
	/* 현재 비밀번호 입력받은 값이 일치한지 확인 하는 과정 */
	$(document).on("blur", "#inputpw0", function(){
		var nowPw = $("#inputpw0").val();
		if(nowPw != ""){
			$.ajax({
				url: "pwCheck.bizpoll",
				type: "POST",
				dataType: "json",
				data: "id=${sessionScope.loginUser.id}&pw=" + nowPw,
				success: function(data){
					
					if(data.message == "-1"){
						$("#inputpw").focus();
						$("#inputpw0").next().text("비밀번호가 일치합니다.").css("display", "block").css("color", "#0054FF");
						$("#inputpw0").parent().css("margin-bottom", "30px");
					} else {
						$("#inputpw0").select();
						$("#inputpw0").next().text("비밀번호가 일치하지 않습니다.").css("display", "block").css("color", "#F46665");
						$("#inputpw0").parent().css("margin-bottom", "30px");
					}
				},
				error:function(){
					alert("System Error!!");
				}
				
			});
		}
		
	});
	
	/* 유효성체크하는 값을 받아온다. */
	$(document).on("click", "#btn_join", function(){
		var form = $("#frm_mem"),
		mpw0 = $("#inputpw0"),
		mpw = $("#inputpw"),
		mpw2 = $("#inputpw_ck");

		
		var pw0 = $.trim(mpw0.val());
		var pw = $.trim(mpw.val());
		var pw2 = $.trim(mpw2.val());
		/* 영문자,숫자 포함 특수문자 사용가능.8~20자리  */
		var regPass = /^.*(?=.{8,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

		/* 새비밀번호 유효성체크 */
		if(pw0 == ""){
			mpw0.focus();
			mpw0.next().text("필수정보입니다.").css("display", "block");
			mpw0.parent().css("margin-bottom", "30px");
			return false;
		} else if(pw == ""){
			mpw.focus();
			mpw.next().text("필수정보입니다.").css("display", "block");
			mpw.parent().css("margin-bottom", "30px");
			return false;
		} else if(!regPass.test(pw)){
			mpw.select();
			mpw.next().text("8~20자 이내 영문자, 숫자, 특수문자만 입력해주세요.").css("display", "block");
			mpw.parent().css("margin-bottom", "30px");
			return false;
		} else if(pw2 == ""){
			mpw2.focus();
			mpw2.next().text("필수정보입니다.").css("display", "block");
			mpw2.parent().css("margin-bottom", "30px");
			return false;
		} else if(pw != pw2) {
			mpw2.select();
			mpw2.next().text("비밀번호가 일치하지않습니다.").css("display", "block");
			mpw2.parent().css("margin-bottom", "30px");
			return false;
		} 
		
		if(pw0 == pw) {
			mpw.focus();
			mpw.val('');
			mpw2.val('');
			mpw.next().text("현재비밀번호는 사용이 불가능합니다.").css("display", "block");
			mpw.parent().css("margin-bottom", "30px");
			return false;
		}
		
		/* 유효성체크 값이 유효한 값 확인 끝 !! */
		form.submit();

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
				<h4><b>비밀번호수정</b></h4>
			</div>
			<hr>
		</header>
		
		<section>
			<form action="memberpwplay.bizpoll" name="frm_mem" method="POST" id="frm_mem">
				<span><h3>현재비밀번호</h3></span>
				<div class="div_input" id="bb_pw0">
					<label for="inputpw0" ></label>
					<input type="password" id="inputpw0" name="inputpw0" class="input_join checkpw">
					<span class="error">필수정보입니다.</span>
				</div>
				<hr>
				<br>
				<span><h3>새비밀번호</h3></span>
				<div class="div_input" id="bb_pw">
					<label for="inputpw" ></label>
					<input type="password" id="inputpw" name="inputpw" class="input_join checkpw">
					<span class="error">필수정보입니다.</span>
					<span id="pwicon"><img src="img/pc_icon.png"></span>
				</div>
				
				<span><h3>새비밀번호 재확인</h3></span>
				<div class="div_input" id="bb_pw_ck">
					<label for="inputpw_ck"></label>
					<input type="password" placeholder="비밀번호를 다시한번 입력해주세요." id="inputpw_ck" name="inputpw_ck" class="input_join checkpw">
					<span class="error">필수정보입니다.</span>
					<span id="pwicon2"><img src="img/pc_icon_check.png"></span>
				</div>
				
				<input type="hidden" name="updateId" value="${sessionScope.loginUser.id}">

				<!-- 수정 버튼 -->
				<div><a href="#" id="btn_join">비밀번호 수정</a></div>
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
</div>	
</body>
</html>