<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>    
<%
	String referer = request.getHeader("referer");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackBerry_Login</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	body, ul {
		margin: 0;
		padding: 0;
		font-family: 'Nanum Gothic', sans-serif;	
	}
	ul { list-style-type: none; }
	a {
		text-decoration: none;
	}
	
	#modal_all {
		z-index: 3;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.4);
		display: none;
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
	
	/* 로고 */
	#content_layout {
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
	#header_div img {
		display: block;
		margin: 42px auto;
	}
	/* Section(그룹로그인, input(id,pw), 로그인버튼, find) */
	#group_login{
		color: #8c8c8c;
		font-size: 11px;
		text-align: right;
		margin-bottom: 7px;
	}
	#group_login > a {
		color: inherit;
	}
	.div_input {
		background-color: white;
		border: 1px solid #dadada;
		width: 408px;
		height: 29px;
		margin-bottom: 14px;
		padding: 10px 35px 10px 15px;
	}
	.input_login {
		width: 408px;
		height: 16px;
		border-width: 0px;
		padding: 7px 0px 6px 0px;
		cursor: pointer;
	}
	#btn_login {
		width: 460px;
        height: 59px;
        font-size: 22px;
        text-align: center;
        background-color: #494693;
        color: white;
        display: block;
        padding-top: 2px;
        line-height: 59px;
	}
    #secrue {
    	text-align: right;
    	font-size: 12px;
    }

    hr {
    	width: 98%;
    	margin: 20px auto;
    	border: thin solid #EAEAEA;
    }
    /* 로그인 찾기 */
   #member {
        color: #8C8C8C;
        font-sizw: 12px;
        text-align: center;
    }
    #member > a{
        color: inherit;
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
   
    /* sns 로그인 */
    #snslink {
    	text-align: center;
		width: 460px;
		height: 59px;
		margin: auto;
		line-height: 59px;
		background-color: #6C6C6C;
		font-size: 18px;
	}
	#snslink img {
		vertical-align: middle;
	}
	#snslink > a {
		color: white;
		
	}
	#err_check {
		color: red;
		display: none;
		font-size: 13px;
		height: 20px;
		line-height: 20px;
		
	}	
</style>

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		/* focus : 초점을 가게 하는 것 blur : 초점이 해제하는 것 */
		$("#inputid").focus(function(){
			$("#bb_id").css("border", "1px solid #5F00FF");
		});
		$("#inputpw").focus(function(){
			$("#bb_pw").css("border", "1px solid #5F00FF");
		}); 
		
		$("#inputid").blur(function(){
			$("#bb_id").css("border", "1px solid #dadada");			
		});
		$("#inputpw").blur(function(){
			$("#bb_pw").css("border", "1px solid #dadada");
		});

		/* 로그인 유효성체크  */
		$("#btn_login").on("click", function(){
			var val1 = $("#inputid").val();
			var val2 = $("#inputpw").val();
			if(val1 != "" && val2 != ""){
				/* $("#frm_login").submit(); */
				$.ajax({
					url: "LoginPlay.bizpoll",
					type: "POST",
					dataType: "json",
					data: "id=" + val1 + "&pw=" + val2,
					success: function(data){

						if(data.message == "1"){
							location.href="<%=referer%>";
						} else {
							$("#err_check").text("아이디 또는 비밀번호가 일치하지 않습니다.").css("display", "block");
						}
					},
					error:function(){
						alert("System Error!!");
					}
					
				});

			} else {
				$("#err_check").text("아이디와 비밀번호를 올바르게 입력해주세요.").css("display", "block");
				return;
			}
		});
		
		var inputid = document.getElementById("inputid");
		var inputpw = document.getElementById("inputpw");
		/* id값 넣고 엔터하면 pw로 포커스 */
		inputid.addEventListener("keyup", function(event) {
		    event.preventDefault();
		    if (event.keyCode === 13) {
		    	inputpw.focus();
		    }
		});
		/* pw값 넣고 엔터하면 로그인*/
		inputpw.addEventListener("keyup", function(event) {
		    event.preventDefault();
		    if (event.keyCode === 13) {
		        document.getElementById("btn_login").click();
		    }
		});
	}); 
</script>


</head>
<body>
		<div id="content_layout">
			<span id="close_btn"><i class="fa fa-close"></i></span>
			<header>
				<div id="header_div">
					<a href="index.bizpoll">
						<img alt="블랙베리로고" src="img/logo1.png">
					</a>
				</div>
			</header>
			
			<section>
				<div id="group_login">
						<a href="">사업자로그인방법</a>
				</div>
					
				<form action="LoginPlay.bizpoll" method="POST" name="frm_login" id="frm_login">
					<div class="div_input" id="bb_id">
						<input type="text" placeholder="ID" id="inputid" name="inputid" class="input_login">
					</div>
					<div class="div_input" id="bb_pw">
						<input type="password" placeholder="PASSWORD" id="inputpw" name="inputpw" class="input_login">
					</div>
					
					<span id="err_check">아이디와 비밀번호를 올바르게 입력해주세요.</span>
					<div><a href="#" id="btn_login" onclick="index.bizpoll">로그인</a></div>						
				</form>
					
					<br>
	                <div id="snslink">
		                <a href="#"><img src="img/googleplus_.png" width="25px">　Google 로그인 </a>
	                </div>
	                
			</section>
			<aside>
				<div><hr></div>
	                <div id="member">
	                	<a href="#">아이디 찾기</a>
	                	&nbsp;
	                	<span class="si">|</span>
		                &nbsp;
		                <a href="#">비밀번호 찾기</a>
		                &nbsp;
		                <span class="si">|</span>
		                <a href="#">회원가입</a>
		                &nbsp;
	                </div>
			</aside>
			<br>
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
</body>
</html>