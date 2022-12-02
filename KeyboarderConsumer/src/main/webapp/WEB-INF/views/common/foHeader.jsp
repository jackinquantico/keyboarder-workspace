<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
        .fo-header-full{
            width: 1000px;
            height: 100px;
            margin: auto; 
        }

        #fo-header-logo{
            width: 20%;
            height: 100%;
            display: inline-block;
            margin-left: 5%;
        }

        #fo-header-login{
            width: 40%;
            height: 100%;
            display: inline-block;
            float: right;
        }

        #login-button{
            width: 40%;
            height: 100%;
            float: left;
            font-size: 20px;
            line-height: 95px;
        }

        #order-button{
            width: 35%;
            height: 100%;
            float: left;
            font-size: 17px;
            line-height: 95px;
        }

        #logout-button{
            width: 25%;
            height: 100%;
            float: left;
            line-height: 95px;
        }
        
        a:hover{
        	cursor: pointer; 
        	opacity: 0.5;
        }

    </style>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="fo-header-full">
            <div id="fo-header-logo">
                <a href="index.jsp"><img src="" style="background-size: cover; width: 100%; height: 100%;"></a>
            </div>
            <div id="fo-header-login">
                <div id="order-button" align="center">
                    <a href="foTotalView.order"><button type="button" class="btn btn-outline-secondary">주문내역조회</button></a>
                </div>
                <div id="login-button" align="center">
                    <a href=""><button type="button" class="btn btn-outline-success">회원가입</button></a>
                </div>
                <div id="logout-button">
                    <a href=""><button type="button" class="btn btn-outline-primary">로그아웃</button></a>
                </div>
            </div>
        </div>

</body>
</html>