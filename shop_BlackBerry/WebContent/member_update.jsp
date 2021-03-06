<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/include.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BlackBerry_Join</title>

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
		width: 550px;
		height: 1000px;
		margin: 0 auto;
		background-color: #f5f6f7;
	   	margin-top: 20px;
		border: 1px solid #dadada;
		border-radius: 10px;
	}
	#content_layout {
		width: 460px;
		margin: 0 auto;
		margin-top: 20px;
		padding: 10px;
		background-color: #f5f6f7;
		
		/* border: 1px solid #dadada;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2),
					0 6px 20px 0 rgba(0, 0, 0, 0.19); */
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

	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

<!-- input focus -->
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		/* @의 index 값 추출  -> 0~@:emailid @~끝까지:emailurl */
		var email_info = "${sessionScope.loginUser.email}";
		var index = email_info.indexOf('@');
		var emailid = email_info.substring(0, index);
		var emailurl = email_info.substring(index + 1);
		$("#email_id").val(emailid);
		$("#email_url").val(emailurl);
		
		
		/* focus : 초점을 가게 하는 것  blur : 초점이 해제하는 것 */
		$("#inputid").focus(function(){
			$("#bb_id").css("border", "1px solid #5F00FF");
			
		});
		$("#inputname").focus(function(){
			$("#bb_name").css("border", "1px solid #5F00FF");
		}); 
		$("#inputphone").focus(function(){
			$("#bb_phone").css("border", "1px solid #5F00FF");
		});
		$("#inputname").focus(function(){
			$("#bb_name").css("border", "1px solid #5F00FF");
		}); 
		$("#email_id").focus(function(){
			$("#bb_email").css("border", "1px solid #5F00FF");
		}); 
		
		
		$("#inputid").blur(function(){
			$("#bb_id").css("border", "1px solid #dadada");	
		});
		$("#inputname").blur(function(){
			$("#bb_name").css("border", "1px solid #dadada");
		}); 
		$("#inputphone").blur(function(){
			$("#bb_phone").css("border", "1px solid #dadada");
		});
		$("#inputname").blur(function(){
			$("#bb_name").css("border", "1px solid #dadada");
		}); 
		$("#email_id").blur(function(){
			$("#bb_email").css("border", "1px solid #dadada");
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


		/* 이메일 select */
		$("#selmail").change(function(){
			/* #selmail의 value 값을 selmail 변수에 담아라 */
			var selmail = $("#selmail").val();
			
			if(selmail == "directVal") {
				$("#email_url").val("");
				$("#email_url").focus();
	
			} else {
				/* #email_url의 value 속성에 selmail변수에 값을 넣어라 */
				$("#email_url").val(selmail);
			}
		});	
		/* 우편번호, 주소 클릭했을때 다음 우편번호 API 실행  */
		$(".addrbtn").click(function(){
			$("#ad_btn").click();
		});
		
	});			
		
	$(document).on("click", "#btn_join", function(){
		/* 유효성체크하는 값을 받아온다. */
		var form = $("#frm_mem"),
		mid = $("#inputid"),
		mname = $("#inputname"),
		mphone = $("#inputphone"),
		memailid = $("#email_id"),
		memailurl = $("#email_url"),
		zipcode = $("#sample6_postcode"),
		maddr1 = $("#sample6_address"),
		maddr2 = $("#sample6_address2");
		

		/* trim: 앞뒤 공백 제거 */
		var id = $.trim(mid.val());
		var regId = /^[a-zA-Z0-9]{4,12}$/; /* 4~12자까지 영대소문자와 숫자만 입력 가능 */
		if(id == ""){
			mid.focus();
			mid.next().text("필수정보입니다.").css("display", "block");
			mid.parent().css("margin-bottom", "30px");
			return false;
			
		} else if(!regId.test(id)) {
			mid.focus();
			mid.next().text("영문자와 숫자만 입력해주세요.").css("display", "block");
			mid.parent().css("margin-bottom", "30px");
			return false;
		}

		
		/* 전화번호 유효성 체크  
		       전화번호는 숫자값만 들어오는 유효성체크 추가 */
		var phone = $.trim(mphone.val());
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if(phone == ""){
			mphone.focus();
			mphone.next().text("필수정보입니다.").css("display", "block");
			mphone.parent().css("margin-bottom", "30px");
			return false;
		} else if($.isNumeric(phone) == false){ /* 숫자값만 들어왔는지 체크 */
			mphone.select();
			mphone.next().text("숫자만 입력해주세요.").css("display", "block");
			mphone.parent().css("margin-bottom", "30px");
			return false;
		} else if(!regPhone.test(phone)){
			mphone.focus();
			mphone.next().text("올바른 값을 입력하세요.").css("display", "block");
			mphone.parent().css("margin-bottom", "30px");
			return false;
		}
		/* 주소 유효성체크 */
		var post = $.trim(zipcode.val());
		var addr1 = $.trim(maddr1.val());
		var addr2 = $.trim(maddr2.val());
		
		if(post == ""){
			zipcode.select();
			zipcode.next().text("필수정보입니다.").css("display", "block");
			zipcode.parent().css("margin-bottom", "30px");
			return false;
		} else if(addr1 == ""){
			maddr1.select();
			maddr1.next().text("필수정보입니다.").css("display", "block");
			maddr1.parent().css("margin-bottom", "30px");
			return false;
		} else if(addr2 == "") {
			maddr2.focus();
			maddr2.next().text("필수정보입니다.").css("display", "block");
			maddr2.parent().css("margin-bottom", "30px");
			return false;
		}
			
		/* 이메일 유효성체크 */
		var mailid = $.trim(memailid.val());
		var mailurl = $.trim(memailurl.val());
		var mail = mailid + "@" + mailurl;
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
		if(mailid == "") {
			memailid.focus();
			memailid.next().text("필수정보입니다.").css("display", "block");
			memailid.parent().css("margin-bottom", "30px");
			return false;
		} else if( mailurl == "") {
			memailurl.focus();
			memailurl.next().text("필수정보입니다.").css("display", "block");
			memailurl.parent().css("margin-bottom", "30px");
			return false;
		} else if(!regEmail.test(mail)) {		
			memailid.select();
			$("#email_url").next().text("E-mail형식이 올바르지않습니다.").css("display", "block");
			memailurl.parent().css("margin-bottom", "30px");
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
				<h4>회원정보수정</h4>
				
			</div>
		</header>
		
		<section>
			<form action="memberupdateplay.bizpoll" name="frm_mem" method="POST" id="frm_mem">
				<br>
				<span><h3>아이디</h3></span>
				<div class="div_input" id="bb_id">
					<label for="inputid"></label>
					<input type="text" maxlength="12" id="inputid" name="inputid" class="input_join" value="${sessionScope.loginUser.id}" readonly="readonly">
					<span class="error" id="input_error">필수정보입니다.</span>
				</div>
				
				<span><h3>이름</h3></span>
				<div class="div_input" id="bb_name">
					<label for="inputname"></label>
					<input type="text" id="inputname" name="inputname" class="input_join" value="${sessionScope.loginUser.name}">
					<span class="error">필수정보입니다.</span>
				</div>
				
				<span><h3>전화번호</h3></span>
				<div class="div_input" id="bb_phone">
					<label for="inputphone"></label>
					<input type="text" placeholder="핸드폰번호(-없이 입력하세요.)" maxlength="11" id="inputphone" name="inputphone" class="input_join" value="${sessionScope.loginUser.phone}">
					<span class="error">필수정보입니다.</span>
				</div>
				
				<span><h3>주소</h3></span>
				<div class="" id="bb_adress">
					<label for="inputad"></label>
					<input type="text" id="sample6_postcode" class="input_join addrbtn" name="zipcode" placeholder="우편번호" readonly="readonly" value="${sessionScope.loginUser.zipcode}">
					<span class="error">필수정보입니다.</span>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="ad_btn">
					<span class="error">필수정보입니다.</span>
					<input type="text" id="sample6_address" class="input_join address addrbtn" name="addr1" readonly="readonly" value="${sessionScope.loginUser.addr1}">
					<span class="error">필수정보입니다.</span>
					<input type="text" id="sample6_address2" class="input_join address" name="addr2" placeholder="상세주소" value="${sessionScope.loginUser.addr2}">
					<span class="error">필수정보입니다.</span>
				</div>
				
				<span><h3>이메일</h3></span>
				<div id="bb_email">
					<label for="inputemail"></label>
					
					<input type="text" id="email_id" name="email_id"  class="input_join" placeholder="ID">
					<span class="error">필수정보입니다.</span>
					<span> @ </span>
					<input type="text" id="email_url" name="email_url" class="input_join"  placeholder="URL">
					<span class="error">필수정보입니다.</span>
					<select id="selmail">
						<option value="" selected="selected">Email 선택</option>
						<option value="directVal">직접입력</option>
						<option value="naver.com">naver.com(네이버)</option>
						<option value="daum.net">daum.net(다음)</option>
						<option value="gmail.com">gmail.com(구글)</option>
						<option value="nate.com">nate.com(네이트)</option>
					</select>
					
				</div>	

				<!-- 수정 버튼 -->
				<div><a href="#" id="btn_join">회원수정</a></div>
			</form>	
		</section>
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
</div>	
</body>
</html>