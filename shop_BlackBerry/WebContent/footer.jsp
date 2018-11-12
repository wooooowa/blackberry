<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body { margin: 0; padding: 0; }
	ul { list-style-type: none; list-style: none; }
	a { text-decoration: none; }
	
	/* footer */
	#footer {
        padding: 50px 0 0 0; 
        background-color: black;
		height: 120px;
		bottom:0;
		width: 100%;  
    }
    #footer * {/* 이용약관  */
        font-size: 11px;
        line-height: normal;
        list-style: none;
        color: #5D5D5D;
    }
    #footer > ul {
        text-align: center;
        margin: 0 auto 9px;
    }
    #footer > ul > li {
        display: inline-block; /* 이용약관 이후 글씨 세로에서 다~~옆으로 붙게함 */ 
        border-left: 1px solid #333;/* 글씨 사이 | 붙이기 */
        padding: 0 5px 0 7px;/* |옆에 띄기 */
    }
    #footer > ul > li:first-child {
        border-left: 0px!important;
    }
    #foot_addr {
    	height: 30px;
    	text-align: center;
    }
    #address {
        margin: 0 auto;
        text-align: center;
    }
    #address * {
        font: 9px verdana;
    }
    #address a {
    font-weight: bold;
    }
    a:hover {
        text-decoration: underline;/* 호버 했을 때 밑줄 생김 */
    }
    #footer > ul > li a:hover {
    color: #896AB7; /* 마우스 대면 글자색 네이버컬러로 바뀜 */
    }
</style>
</head>
<body>
	<!-- footer -->
	<footer>
        <div id="footer">
        	<div id="foot_addr">
	           <span>(주)BlackBerry / 사업자등록번호: 0123-45-6789  / 주소: 광주 광역시 북구 경양로 170 / Tel.062-123-4567</span>
        	</div>
			<ul>
              <li><a href="#">이용약관</a></li>
               <li><strong><a href="#">개인정보처리방침</a></strong></li>
               <li><a href="#">책임의 한계와 법적고지</a></li>
               <li><a href="#">회원정보 고객센터</a></li>
            </ul>
            <div id="address">
                <span>Copyright</span>
                <span>ⓒ</span>
                <span>
                   <strong>
                    <a href="#">BlackBerry Corp.</a>
                   </strong>
                 </span>
                 <span>All rights Reserved.</span>    
            </div>           
                
        </div>            
    </footer>
	<!-- footer -->	

</body>
</html>