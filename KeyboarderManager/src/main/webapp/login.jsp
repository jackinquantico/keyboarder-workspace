<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        #wrap {
            width : 1920px;
            height : 1080px;
        }

        #wrap>div {
            float : left;
        }

        #login_left {
            background-color: #323232;
            width : 777px;
            height : 100%;
        }

        #login_text {
            color : white;
            font-size : 36px;
            margin-top : 25%;
            margin-left : 40%;
        }

        #login_text div {
            float : left;
        }

        #login_text1 {
            font-weight: 600;
        }

        #login_text2 {
            font-weight: 300;
        }

        #login_right {
            width : 1143px;
            height : 100%;
        }

        #login_area {
            width : 505px;
            height : 470px;
            margin-left : 25%;
            margin-top : 305px;
            text-align: center;
        } 

        #login_form {
            margin-top: 20px;
        }

        #login_form input {
            margin : 2%;
            width : 70%;
            height : 50px;
            border-radius: 5px;
        }

        input[type=submit] {
            background-color: #323232;
            color : white;
            font-size: 18px;
        }

        input[type=submit]:hover {
            cursor: pointer;
        }

        #saveIdArea {
            text-align: left;
        }

        label {
            position: relative;
            top : -6px;
            font-size: 20px;   
        }

        #findAndJoin {
            position: relative;
            top : 15px;
            font-size: 20px;
        }

        #findAndJoin a {
            text-decoration: none;
            color : black;
        }
    </style>
</head>
<body>
    
    <div id="wrap">

        <div id="login_left">
            <div id="login_text">
                <div id="login_text1">KEYBOAR</div>
                <div id="login_text2">-DER</div>
                <br>
                판매자매니저 로그인
            </div>
        </div>

        <div id="login_right">

            <div id="login_area">
                <h2>개인 / 국내 사업자</h2>
                <hr>
                <form id="login_form" action="login.me" method="post">
                    <input type="text" id="userId" name="sellerId" placeholder="아이디를 입력하세요" required>                 
                    <input type="password" name="sellerPwd" placeholder="비밀번호를 입력하세요" required>                   
                    <input type="submit" value="로그인">
                    <br>
                    <div id="saveIdArea">
                        <input type="checkbox" id="saveId" name="saveId" value="y" 
                        style="width:25px; height : 25px; margin-left: 14%;"> <label for="saveId">아이디 저장</label>
                    </div>
                </form>
                <hr>
                <div id="findAndJoin">
                    <a href="">아이디 찾기</a>&nbsp;|
                    <a href="">비밀번호 찾기</a>&nbsp;|
                    <a href="">판매자 가입</a>
                </div>
            </div>

        </div>
    </div>

	<script>
	    $(function(){
	        var responseMessage = "<c:out value="${msg}" />";
	        if(responseMessage != ""){
	            alert(responseMessage)
	        }
	    }) 
	</script>


</body>
</html>