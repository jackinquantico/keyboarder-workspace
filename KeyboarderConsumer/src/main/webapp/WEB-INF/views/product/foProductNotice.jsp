<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>
        div{
            border: 1px solid red;
            box-sizing: border-box;
        }

        #fo-full-main{
            width: 1000px;
            height: 1000px;
            margin: auto;
        }

        #fo-header{
            width: 100%;
            height: 20%;
        }

        #fo-product-body{
            width: 100%;
            height: 80%;
        }

        #fo-product-main{
            width: 80%;
            height: 73%;
            margin: auto;
            margin-top: 80px;
        }

        .fo-product-all{
            width: 24.47%;
            height: 280px;
            display: inline-block;
            margin-bottom: 10px;
        }

        .fo-product-img{
            width: 100%;
            height: 140px;
        }

        .fo-product-name{
            width: 100%;
            height: 53px;
        }

        .fo-product-price{
            width: 100%;
            height: 40px;
        }

        .fo-buy-button{
            width: 100%;
            height: 45px;
        }

    </style>
	
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />

	<div id="fo-full-main">

        <div id="fo-header"></div>

        <div id="fo-product-body">
            <div id="fo-product-main">
                
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img">
                                <img src="" style="background-size: cover; width: 100%; height: 100%;">
                            </div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="fo-product-all" align="center">
                        <form>
                            <div class="fo-product-img"></div>
                            <div class="fo-product-name">상품 제목 넣어버리기</div>
                            <div class="fo-product-price">상품 가격 넣어버리기</div>
                            <div class="fo-buy-button" align="center">
                                <button type="submit" class="btn btn-outline-info" style="width: 100px; height: 40px;">
                                   	 구매하기
                                </button>
                            </div>
                        </form>
                    </div>
                
            </div>
        </div>
    </div>

</body>
</html>