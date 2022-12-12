<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세 조회</title>

	<style>
        div{
            /* border: 1px solid red;*/
            box-sizing: border-box;
        }

        .order-all-main{
            width: 1200px;
            height: 1100px;
            margin: auto;
        }

        #order-title{
            width: 100%;
            height: 10%;
            font-size: 50px;
            font-weight: 800px;
            line-height: 90px;
            font-weight: bold;
            padding-top: 40px;
        }

        #delivery-lookup{
            width: 100%;
            height: 100px;   
        }

        .order-product-main{
            width: 80%;
            height: 210px;
            margin: auto;
            border: 2px solid black;
            border-radius: 30px;
        }

        .order-orderer-main{
            width: 80%;
            height: 250px;
            margin: auto;
            border: 2px solid black;
            border-radius: 30px;
        }

        .order-name{
            width: 100%;
            height: 50px;
            font-size: 30px;
            font-weight: 300;
        }
        
        #refund-btn:hover{
        	opacity: 0.7;
        	cursor: pointer;
        }
        
    </style>
    
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />

	<div class="order-all-main">
        <div id="order-title" align="center">
            	주문내역 상세조회
        </div>
        <br>
        <hr style="background-color: black; height: 5px;">
        <br clear="both">

		<div class="order-product-main">
            <form>
                <div class="order-product-date" style="float: left; width: 15%; height: 200px;">
                    <div style="width: 100%; height: 80px; font-size: 18px; font-weight: bolder; line-height: 120px;" align="center">
                      	  주문일시
                    </div>
                    <hr style="width: 80%; margin-left: 15px; background-color: black; height: 2px;">
                    <!-- 주문 일시가 보여짐 -->
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 40px;" align="center">
                        ${ orderDetailList.orderDate }
                    </div>
                </div>
                <div class="order-product-img" style="float: left; width: 30%; height: 200px;">
                	<!-- 주문한 상품 사진이 보여짐 -->
                    <div style="width: 84%; height: 160px; margin-left: 10px; margin-top: 22px; border-radius: 30px;">
                        <img src="${ orderDetailList.productAttachment }" style="background-size: cover; width: 100%; height: 100%; border-radius: 30px;">
                	</div>
                </div>
                <div class="order-product-name-price" style="float: left; width: 40%; height: 200px;">
                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
                       	주문번호 : ${ orderDetailList.orderNo }
                    </div>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
                        	상품명 : ${ orderDetailList.productName }
                    </div>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
                        	상품가격 : ${ orderDetailList.productPrice }원
                    </div>
                    <c:choose>
	                    <c:when test="${ orderDetailList.keyCouponPrice ne 0 }">
		                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
		                        	쿠폰가격 : ${ orderDetailList.keyCouponPrice }
		                    </div>
	                    </c:when>
	                    <c:when test="${ orderDetailList.stoCouponPrice ne 0 }">
		                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
		                        	쿠폰가격 : ${ orderDetailList.stoCouponPrice }
		                    </div>
	                    </c:when>
	                    <c:otherwise>
		                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
		                        	쿠폰가격 : 사용 안함
		                    </div>
	                    </c:otherwise>
                    </c:choose>
                    <div style="width: 100%; height: 40px; font-size: 17px; padding: 10px 20px; margin: 0px;">
                        	판매자 : ${ orderDetailList.sellerName }
                    </div>
                </div>
                <div class="order-product-delivery-status" style="float: left; width: 15%; height: 200px;">
                	<c:choose>
                		<%-- 배송 상태에 따라 배송 현황 내용 변경 --%>
                		<c:when test="${ orderDetailList.orderStatus eq 1 }">
		                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px; font-weight: bolder;" align="center">
		                        	배송 중
		                    </div>
                    	</c:when>
                    	<c:when test="${ orderDetailList.orderStatus eq 2 }">
		                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px; font-weight: bolder;" align="center">
		                        	배송 완료
		                    </div>
                    	</c:when>
                    	<c:when test="${ orderDetailList.orderStatus eq 3 }">
		                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px; font-weight: bolder;" align="center">
		                        	구매 확정
		                    </div>
                    	</c:when>
                    	<c:when test="${ orderDetailList.orderStatus eq 4 }">
		                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px; font-weight: bolder;" align="center">
		                        	환불 요청
		                    </div>
                    	</c:when>
                    </c:choose>
                    <hr style="width: 80%; margin-left: 15px; background-color: black; height: 2px;">
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 60px;" align="center">
                        <button type="button" class="btn btn-primary" id="refund-btn">환불요청</button>
                    </div>
                </div>
            </form>
        </div>

        <br><hr style="background-color: black; height: 5px;"><br>

        <div class="order-orderer-main">
        	<!-- 받는 사람의 정보가 보여짐 -->
            <div class="order-name" style="padding: 18px 50px; margin: 0px; font-weight: bold;">
                	받는 사람 정보
            </div>
            <div class="order-infomation">
                <div style="width: 100%; height: 66px; font-size: 17px; padding: 30px 50px; margin: 0px;">
                    	받는사람 : ${ orderDetailList.conName }
                </div>
                <div style="width: 100%; height: 66px; font-size: 17px; padding: 20px 50px; margin: 0px;">
                    	연락처 : ${ orderDetailList.conPhone }
                </div>
                <div style="width: 100%; height: 66px; font-size: 17px; padding: 10px 50px; margin: 0px;">
                    	배송지 : ${ orderDetailList.conAddress }
                </div>
            </div>
        </div>

        <br><hr style="background-color: black; height: 5px;"><br>

        <div class="order-orderer-main">
        	<!-- 결제 정보가 보여짐 -->
            <div class="order-name" style="padding: 18px 50px; margin: 0px; font-weight: bold;">
                	결제 정보
            </div>
            <div class="order-infomation" style="float: left; width: 40%;">
                <div style="width: 100%; height: 49px; font-size: 17px; padding: 30px 50px; margin: 0px;">
                    	결제수단 : 신용 / 체크 카드
                </div>
                <div style="width: 100%; height: 49px; font-size: 17px; padding: 12px 50px; margin: 0px;">
                    	상품가격 : ${ orderDetailList.productPrice }원
                </div>
                <c:choose>
                	<c:when test="${ orderDetailList.keyCouponPrice ne 0 }">
		                <div style="width: 100%; height: 49px; font-size: 17px; padding: 7px 50px; margin: 0px;">
		                    	쿠폰할인 : ${ orderDetailList.keyCouponPrice } 원
		                </div>
                	</c:when>
                	<c:when test="${ orderDetailList.stoCouponPrice ne 0 }">
		                <div style="width: 100%; height: 49px; font-size: 17px; padding: 7px 50px; margin: 0px;">
		                    	쿠폰할인 : ${ orderDetailList.stoCouponPrice } 원
		                </div>
                	</c:when>
                	<c:otherwise>
                		<div style="width: 100%; height: 49px; font-size: 17px; padding: 7px 50px; margin: 0px;">
		                    	쿠폰할인 : 사용 안함
		                </div>
                	</c:otherwise>
                </c:choose>
                <div style="width: 100%; height: 49px; font-size: 17px; padding: 0px 50px; margin: 0px;">
                    	배송비 : 2500원
                </div>
            </div>
            <c:choose>
            	<c:when test="${ orderDetailList.keyCouponPrice ne 0 }">
		            <div style="float: left; width: 60%; height: 200px; padding-top: 60px; padding-left: 35px; font-size: 20px;">
		                              최종 결제 금액 : ${ orderDetailList.productPrice - orderDetailList.keyCouponPrice + 2500 }원
		                <br>
		               	 최종결제금액 = 상품가격 - 쿠폰가격 + 배송비
		            </div>
            	</c:when>
            	<c:when test="${ orderDetailList.stoCouponPrice ne 0 }">
		            <div style="float: left; width: 60%; height: 200px; padding-top: 60px; padding-left: 35px; font-size: 20px;">
		                              최종 결제 금액 : ${ orderDetailList.productPrice - orderDetailList.stoCouponPrice + 2500 }원
		                <br>
		               	 최종결제금액 = 상품가격 - 쿠폰가격 + 배송비
		            </div>
            	</c:when>
            	<c:otherwise>
		            <div style="float: left; width: 60%; height: 200px; padding-top: 60px; padding-left: 35px; font-size: 20px;">
		                              최종 결제 금액 : ${ orderDetailList.productPrice + 2500 }원
		                <br>
		               	 최종결제금액 = 상품가격 - 쿠폰가격 + 배송비
		            </div>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>    

</body>
</html>