<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        	opacity: 0.9;
        	cursor: pointer;
        	color: white;
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
             <div id="delivery-lookup">
                 <div style="display: inline-block; margin-left: 33%; font-size: 20px; margin-top: 35px; width: 12%;">
                    	 조회기간
                 </div>
                 <input type="month" style="margin-left: 10%;">
             </div>
             <div id="delivery-button" align="center">
                 <button type="submit" class="btn btn-primary" id="date-search" style="margin-top: 10px; width: 20%;" onclick="selectOrderDate">
                 	검색하기
                 </button>
             </div>
        </div>
        <br><br>
        <hr style="background-color : black; height: 5px;">
        <br><br clear="both">
        <!-- form 태그 추가로 인해 %에서 px로 변경 필요 -->
        <c:if test="${ not empty orderList }">
        	<c:forEach var="ord" items="${ orderList }">
		        <div class="order-product-main">
		            <form>
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
			                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
			                        	환불
			                    </div>
		                    </c:when>
		                </c:choose>
		                    <hr>
		                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 50px;" align="center">
		                        <button type="button" class="btn btn-primary">환불요청</button>
		                    </div>
		                </div>
		            </form>
		        </div>
		        
		        <br>
        	</c:forEach>
        </c:if>
        
        <%--
        <div class="order-product-main">
            <form>
                <div class="order-product-date" style="float: left; width: 15%; height: 200px;">
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
                        	주문일시
                    </div>
                    <hr style="width: 80%; margin-left: 15px; background-color: black; height: 2px;"> 
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 40px;" align="center">
                        22-02-03
                    </div>
                </div>
                <div class="order-product-img" style="float: left; width: 30%; height: 200px;">
                    <div style="width: 84%; height: 160px; margin-left: 10px; margin-top: 20px; border-radius: 30px;">
                        <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MTlfMjEg%2FMDAxNjU4MTY2ODUyMDk2.rYbdL6xRUcVwKXgw3ixjv1y9DpL715DNDoH7iZC4_Wog.FsdShZZI_8nZ8Nz3y50G7fCp4PzSFzzpIa1NRRZhsu4g.JPEG.khj221100%2FIMG_1269.JPG&type=sc960_832" style="background-size: cover; width: 100%; height: 100%; border-radius: 30px;">
                	</div>
                </div>
                <div class="order-product-name-price" style="float: left; width: 40%; height: 200px;">
                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 30px;" align="center">
                        <a href="foDetailView.order"> <%-- ?ordNo=${ ord.orderNo }  --%><%--
                        	닌자87PRO 풀윤활 RGB 저소음 스위치 기계식 커스텀키보드 퍼플B퍼플레빗 Durock T1
                        </a>
                    </div>
                    <div style="width: 100%; height: 100px; font-size: 17px; padding-top: 25px;" align="center">
                        	결제 금액 : 171000원
                    </div>
                </div>
                <div class="order-product-delivery-status" style="float: left; width: 15%; height: 200px;">
	                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 120px;" align="center">
	                        	환불
	                    </div>
                    <hr style="width: 80%; margin-left: 15px; background-color: black; height: 2px;">
                    <div style="width: 100%; height: 80px; font-size: 18px; line-height: 60px;" align="center">
                        <button type="button" class="btn btn-outline-primary">환불요청</button>
                    </div>
                </div>
            </form>
        </div>
          --%>
        
        <br>
        
    </div>
    
    <%--
    <script>
    	function selectOrderDate(){
    		
    		$.ajax({
    			url : "selectDate.order",
   			data : 
    			
    		});
    	}
    </script>
     --%>
    
    

</body>
</html>































