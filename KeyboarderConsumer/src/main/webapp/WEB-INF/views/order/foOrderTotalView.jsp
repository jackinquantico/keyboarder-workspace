<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 전체 조회</title>

	<style>
        div{
            /*border: 1px solid red;*/
            box-sizing: border-box;
        }

        .order-all-main{
            width: 1200px;
            height: 1000px;
            margin: auto;
        }

        #order-title{
            width: 100%;
            height: 10%;
            font-size: 50px;
            font-weight: bold;
            line-height: 90px;
            margin-top: 40px;
        }

        #order-date-tracking{
            width: 80%;
            height: 200px;
            margin: auto;
            border: 2px solid black;
            border-radius: 30px;
        }

        #delivery-lookup{
            width: 100%;
            height: 100px;   
        }

        .order-product-main{
            width: 86%;
            height: 202px;
            margin: auto;
            border: 2px solid black;
            border-radius: 30px;
        }
        
        #date-search:hover{
        	opacity: 0.7;
        	cursor: pointer;
        }
        
        #refund-btn:hover{
        	opacity: 0.7;
        	cursor: pointer;
        }
        
        #resetButton:hover{
        	opacity: 0.7;
        	cursor: pointer;
        }

    </style>
    
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />

	<div class="order-all-main">
        <div id="order-title" align="center">
            	주문내역조회
        </div>
        <br>
        <div id="order-date-tracking">
        	<!-- 조회 기간에 따른 주문내역 조회 가능 -->
        	<form action="foSearchDate.order">
	            <div id="delivery-lookup">
	                 <div style="display: inline-block; margin-left: 33%; font-size: 20px; margin-top: 35px; width: 12%;">
	                    	 조회기간
	                 </div>
	                 <input type="month" id="orderMonth" name="searchOrderMonth" style="margin-left: 10%;">
	             </div>
	             <div id="delivery-button" align="center">
	                 <button type="submit" class="btn btn-primary" id="date-search" style="margin-top: 10px; width: 15%;" onclick="selectOrderDate">
	                 	검색하기
	                 </button>
	                 &nbsp;&nbsp;
	                 <button type="button" class="btn btn-primary" id="resetButton" style="margin-top: 10px; width: 15%;" onclick="selectOrderDate">
	                 	초기화
	                 </button>
	             </div>
             </form>
        </div>
        <br><br>
        <hr style="background-color : black; height: 5px;">
        <br><br clear="both">
        <!-- form 태그 추가로 인해 %에서 px로 변경 필요 -->
        <c:choose>
	        <c:when test="${ not empty dateList }">
	        	<c:forEach var="date" items="${ dateList }">
			        <div class="order-product-main">
			            <form action="refundPay.fo" method="post">
			            	<input type="hidden" name="orderNo" value="${ date.orderNo }">
			            	<input type="hidden" name="paymentNo" value="${ date.paymentNo }">
			                <div class="order-product-date" style="float: left; width: 15%; height: 200px;">
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
			                        	주문일시
			                    </div>
			                    <hr>
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 40px;" align="center">
			                        ${ date.orderDate }
			                    </div>
			                </div>
			                <div class="order-product-img" style="float: left; width: 30%; height: 200px;">
			                    <div style="width: 90%; height: 180px; margin: auto; margin-top: 10px">
			                        <img src="${ date.productAttachment }" style="background-size: cover; width: 100%; height: 100%;">
			                	</div>
			                </div>
			                <div class="order-product-name-price" style="float: left; width: 40%; height: 200px;">
			                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 20px;" align="center">
			                        <a href="foDetailView.order?ordNo=${ date.orderNo }">
			                        	${ date.productName }
			                        </a>
			                    </div>
			                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 20px;" align="center">
			                        	결제 금액 : ${ date.orderPrice }원
			                    </div>
			                </div>
			                <div class="order-product-delivery-status" style="float: left; width: 15%; height: 200px;">
			                <c:choose>
			                	<c:when test="${ date.orderStatus eq 1 }">
				                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	배송중
				                    </div>
			                    </c:when>
			                    <c:when test="${ date.orderStatus eq 2 }">
				                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	배송완료
				                    </div>
			                    </c:when>
			                    <c:when test="${ date.orderStatus eq 3 }">
				                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	구매확정
				                    </div>
			                    </c:when>
			                    <c:when test="${ date.orderStatus eq 4 }">
				                    <div class="orderStatus" style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	환불
				                    </div>
			                    </c:when>
			                </c:choose>
			                    <hr>
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 50px;" align="center">
			                    <c:choose>
				                	<c:when test="${ date.orderStatus eq 1 }">
					                    <button type="submit" class="btn btn-primary" id="refund-btn">환불요청</button>
					                </c:when>
				                    <c:when test="${ date.orderStatus eq 2 }">
					                	<button type="submit" class="btn btn-primary" id="refund-btn">환불요청</button>
									</c:when>
				                    <c:when test="${ date.orderStatus eq 3 }">
					                    <button type="submit" class="btn btn-primary" id="refund-btn" disabled>환불요청</button>
					                </c:when>
				                    <c:when test="${ date.orderStatus eq 4 }">
					                    <button type="submit" class="btn btn-primary" id="refund-btn" disabled>환불요청</button>
									</c:when>
			                	</c:choose>
			                    </div>
			                </div>
			            </form>
			        </div>
			        
			        <br>
	        	</c:forEach>
	        </c:when>
	        <c:when test="${ empty dateList and empty orderList }">
	        	<div align="center" style="margin-top: 50px; font-size: 25px;">
		        	주문 내역이 없습니다.	        	
	        	</div>
	        </c:when>
	        <c:when test="${ not empty orderList }">
	        	<c:forEach var="ord" items="${ orderList }">
			        <div class="order-product-main">
			            <form action="refundPay.fo" method="post">
			            	<input type="hidden" name="orderNo" value="${ ord.orderNo }">
			            	<input type="hidden" name="paymentNo" value="${ ord.paymentNo }">
			                <div class="order-product-date" style="float: left; width: 15%; height: 200px;">
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
			                        	주문일시
			                    </div>
			                    <hr>
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 40px;" align="center">
			                        ${ ord.orderDate }
			                    </div>
			                </div>
			                <div class="order-product-img" style="float: left; width: 30%; height: 200px;">
			                    <div style="width: 90%; height: 180px; margin: auto; margin-top: 10px">
			                        <img src="${ ord.productAttachment }" style="background-size: cover; width: 100%; height: 100%;">
			                	</div>
			                </div>
			                <div class="order-product-name-price" style="float: left; width: 40%; height: 200px;">
			                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 20px;" align="center">
			                        <a href="foDetailView.order?ordNo=${ ord.orderNo }">
			                        	${ ord.productName }
			                        </a>
			                    </div>
			                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 20px;" align="center">
			                        	결제 금액 : ${ ord.orderPrice }원
			                    </div>
			                </div>
			                <div class="order-product-delivery-status" style="float: left; width: 15%; height: 200px;">
			                <c:choose>
			                	<c:when test="${ ord.orderStatus eq 1 }">
				                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	배송중
				                    </div>
			                    </c:when>
			                    <c:when test="${ ord.orderStatus eq 2 }">
				                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	배송완료
				                    </div>
			                    </c:when>
			                    <c:when test="${ ord.orderStatus eq 3 }">
				                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	구매확정
				                    </div>
			                    </c:when>
			                    <c:when test="${ ord.orderStatus eq 4 }">
				                    <div class="orderStatus" style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
				                        	환불
				                    </div>
			                    </c:when>
			                </c:choose>
			                    <hr>
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 50px;" align="center">
			                    <c:choose>
				                	<c:when test="${ ord.orderStatus eq 1 }">
					                    <button type="submit" class="btn btn-primary" id="refund-btn">환불요청</button>
					                </c:when>
				                    <c:when test="${ ord.orderStatus eq 2 }">
					                	<button type="submit" class="btn btn-primary" id="refund-btn">환불요청</button>
									</c:when>
				                    <c:when test="${ ord.orderStatus eq 3 }">
					                    <button type="submit" class="btn btn-primary" id="refund-btn" disabled>환불요청</button>
					                </c:when>
				                    <c:when test="${ ord.orderStatus eq 4 }">
					                    <button type="submit" class="btn btn-primary" id="refund-btn" disabled>환불요청</button>
									</c:when>
			                	</c:choose>
			                    </div>
			                </div>
			            </form>
			        </div>
			        
			        <br>
	        	</c:forEach>
	        </c:when>
        </c:choose>
        
        <br>
        
    </div>
    
    <script>
    	$(function(){
    		
    		var date = new Date();
    		
    		String(date);
    		
    		var year = date.getFullYear();
    		var month = date.getMonth() + 1;
    		
    		document.getElementById("orderMonth").value = year + "-" + month;
    		
    		$("#resetButton").click(function() {
    			
    			location.href="foTotalView.order";
    		});
    		
    		<%--
    		$.ajax({
    			url : "selectDate.order",
   			data : 
    			
    		});
    		--%>
    	});
    </script>
    
</body>
</html>































