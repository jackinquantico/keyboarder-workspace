<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송주문</title>

    <style>
        div{
            /* border: 1px solid red; */
            box-sizing: border-box;
            margin: auto;
        }

        .delivery-view-main{
            width: 100%;
            height: 863px;
        }

        .delivery-header{
            width: 100%;
            height: 10%;
        }

        .delivery-tracking{
            width: 100%;
            height: 10%;
            margin-bottom: 20px;
        }
        
        .delivery-status-main{
        	border: 2px solid black;
        }

        .delivery-date-tracking{
            width: 100%;
            height: 30%;
        }

        .delivery-information{
            width: 100%;
            height: 50%;
        }

        .delivery-header>#middle-title{
            font-size: 35px;
            margin-left: 2%;
            display: inline-block;
            margin-top: 17px;
        }

        .delivery-header>#long-title{
            font-size: 15px;
            display: inline-block;
            margin-left: 1%;
        }

        #delivery-tracking-main{
            width: 100%;
            height: 100%;
        }

        .delivery-status-main{
            width: 24.8%;
            height: 100%;
            display: inline-block;
            font-size: 170%;
            padding-top: 1.5%;
            padding-left: 2.0%;            
        }

        .delivery-status, .delivery-status-num{
            display: inline-block;
        }

        .delivery-status{
            width: 150px;
        }

        .delivery-status-num{
            margin-left: 33%;
            text-decoration: underline;
        }

        #delivery-information-header{
            width: 100%;
            height: 15%;            
        }

        #delivery-information-count, #delivery-information-count-num{
            display: inline-block;
            font-size: 150%;
            margin-left: 3.0%;
        }

        #delivery-information-main{
            width: 100%;
            height: 100%;
            margin-left: 0%;
            padding-top: 5px;
        }

        .delivery-information-notice{
            width: 100%;
            height: 85%;
            overflow: scroll;
        }

        #delivery-list{
            border: 0px;
		    border-collapse: collapse;
        }

        #delivery-list>thead>tr{
            font-size: 16px;
            height: 30px;
            text-align: center;
            position: sticky;
		    top: 0px;
		    background-color: lightgray !important;
        }

        #delivery-list>tbody>tr>td{
            font-size: 16px;
            text-align: center;
        }

        .delivery-date-tracking{
            width: 100%;
            height: 25%;
            margin-bottom: 20px;
        }

        #delivery-lookup{
            width: 100%;
            height: 70px;
        }
        
        #delivery-period{
        	width: 100%;
        	height: 55px;
        }
        
        #modalClick:hover{
        	cursor: pointer;
        }
        
        .all{
            width: 500px;
            height: 35px;
            font-size: 18px;
        }

        .title{
            width: 180px;
        }
        
    </style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

	<div class="content-wrapper">

		<div class="content">
			<!-- 가운데만 만들어 보자구! -->
		    <div class="delivery-view-main">
		
		        <!-- 배송 조회 헤더 부분 -->
		        <div class="delivery-header">
		                <p id="middle-title">배송 관리</p>
		                <p id="long-title">주문의 배송상태와 구매확정 현황을 확인하세요.</p>
		        </div>
		
		        <!-- 배송 현황 조회 -->
		        <div class="delivery-tracking">
		            <div id="delivery-tracking-main">
		                <div class="delivery-status-main">
		                    <div class="delivery-status">배송중</div>
		                    <div class="delivery-status-num">${ status1 }</div>
		                </div>
		                <div class="delivery-status-main">
		                    <div class="delivery-status">배송완료</div>
		                    <div class="delivery-status-num">${ status2 }</div>
		                </div>
		                <div class="delivery-status-main">
		                    <div class="delivery-status">구매확정</div>
		                    <div class="delivery-status-num">${ status3 }</div>
		                </div>
		                <div class="delivery-status-main">
		                    <div class="delivery-status">환불</div>
		                    <div class="delivery-status-num">${ status4 }</div>
		                </div>
		            </div>
		        </div>
		
		        <!-- 배송 날짜별 조회 -->
		        <div class="delivery-date-tracking" style="border: 2px solid black;">
		            <br>
		            <form action="" method="">
		                <div id="delivery-lookup">
		                    <div style="display: inline-block; margin-left: 2%; font-size: 20px; margin-top: 7px; width: 8%;">
		                    	조회기간
		                    </div>
		                    <input type="date" style="margin-left: 5%;">
		                    	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp~
		                    	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		                    <input type="date">
		                </div>
		                <div id="delivery-period">
		                    <div style="display: inline-block; margin-left: 2%; font-size: 20px; width: 8%;">검색어</div>
		                    <select style="margin-left: 5%;">
		                        <option>입점사코드</option>
		                        <option>언제로할까</option>
		                    </select>
		                    <div style="width: 30%; display: inline-block; margin-left: 3%;">
		                        <input type="text" name="keyword" placeholder="상품명을 입력해주세요" style="width: 100%;">
		                    </div>
		                </div>
		                <div id="delivery-button" align="center">
		                	<button type="button" class="btn btn-outline-success" style="width: 20%; font-size: 17px;">
		                		검색하기
		                	</button>
		                </div>
		            </form>        
		        </div>
		        		
		        <!-- 배송 정보 조회 -->
		        <div class="delivery-information" style="border: 2px solid black;">
		            <div id="delivery-information-header">
		                <div id="delivery-information-main" style="border: 2px solid black;">
		                    <div id="delivery-information-count" style="margin-top: 6px;">주문건&nbsp:&nbsp </div>       
		                    <div id="delivery-information-count-num" style="margin-top: 5px;">&nbsp${ orderCount }&nbsp</div>
		                    <button type="button" class="btn btn-outline-secondary" style="width: 20%; height: 60%; margin-left: 60%;" onclick="location.href='excelDownload.poOrder'">
		                    	엑셀다운로드
		                    </button>
		                </div>
		            </div>
		            <div class="delivery-information-notice" style="border: 2px solid black;">
		                <form>
		                    <table border="1" width="100%" id="delivery-list">
		                        <thead>
		                            <tr>
		                                <th width="7%">주문번호</th>
		                                <th width="7%">배송상태</th>
		                                <th width="5%">상품코드</th>
		                                <th width="25%">상품명</th>
		                                <th width="6%">판매단가</th>
		                                <th width="6%">할인쿠폰</th>
		                                <th width="7%">판매자부담할인액</th>
		                                <th width="7%">키보더부담할인액</th>
		                                <th width="5%">주문금액</th>
		                                <th width="5%">구매자ID</th>
		                                <th width="6%">수령자명</th>
		                                <th width="6%">결제일</th>
		                                <th width="8%">주문확정여부</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        	<% int count = 0; %>
		                        	<c:forEach var="ord" items="${ ordList }">
		                        		<c:choose>
		                        			<c:when test="${ not empty ordList }">
					                            <tr>
					                                <td id="modalClick" class="click" data-toggle="modal" data-target="#deliveryModal<%= count %>">
					                                	${ ord.orderNo }
					                                </td>
					                                <c:choose>
					                                	<c:when test="${ ord.orderStatus eq 1 }">
					                                		<td>배송중</td>
					                                	</c:when>
					                                	<c:when test="${ ord.orderStatus eq 2 }">
					                                		<td>배송완료</td>
					                                	</c:when>
					                                	<c:when test="${ ord.orderStatus eq 3 }">
					                                		<td>구매확정</td>
					                                	</c:when>
					                                	<c:when test="${ ord.orderStatus eq 4 }">
					                                		<td>환불</td>
					                                	</c:when>
					                                </c:choose>
					                                <td>${ ord.productNo }</td>
					                                <td>${ ord.productName }</td>
					                                <td>${ ord.productPrice }</td>
					                                <c:choose>
					                                	<c:when test="${ ord.keyCouponPrice ne 0 }">
					                                		<td>${ ord.keyCouponPrice }</td>
					                                	</c:when>
					                                	<c:when test="${ ord.stoCouponPrice ne 0 }">
					                                		<td>${ ord.stoCouponPrice }</td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td>0</td>
					                                	</c:otherwise>
					                                </c:choose>
					                                <td>${ ord.keyCouponPrice }</td>
					                                <td>${ ord.stoCouponPrice }</td>
					                                <td>${ ord.orderPrice }</td>
					                                <td>${ ord.conId }</td>
					                                <td>${ ord.conName }</td>
					                                <td>${ ord.orderDate }</td>
					                                <c:choose>
					                                	<c:when test="${ ord.orderStatus eq 3 }">
					                                		<td>Y</td>
					                                	</c:when>
					                                	<c:otherwise>
					                                		<td>N</td>
					                                	</c:otherwise>
					                                </c:choose>
					                            </tr>
					                            <!-- The Modal -->
											    <div class="modal" id="deliveryModal<%= count++ %>">
											        <div class="modal-dialog">
											        <div class="modal-content">
											        
											            <!-- Modal body -->
											            <div class="modal-body">
											                <div>
											                	<h2 class="modal-title">배송정보</h2>
											                	<hr>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">주문번호</div>
											                        <div class="content" style="display: inline-block;">${ ord.orderNo }</div>
											                    </div>
											                    <c:choose>
					                                				<c:when test="${ ord.orderStatus eq 1 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">배송상태</div>
													                        <div class="content" style="display: inline-block;">배송중</div>
													                    </div>
											                    	</c:when>
											                    	<c:when test="${ ord.orderStatus eq 2 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">배송상태</div>
													                        <div class="content" style="display: inline-block;">배송완료</div>
													                    </div>
											                    	</c:when>
											                    	<c:when test="${ ord.orderStatus eq 3 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">배송상태</div>
													                        <div class="content" style="display: inline-block;">구매확정</div>
													                    </div>
											                    	</c:when>
											                    	<c:when test="${ ord.orderStatus eq 4 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">배송상태</div>
													                        <div class="content" style="display: inline-block;">환불</div>
													                    </div>
											                    	</c:when>
											                    </c:choose>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">상품번호</div>
											                        <div class="content" style="display: inline-block;">${ ord.productNo }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">상품명</div>
											                        <div class="content" style="display: inline-block;">${ ord.productName }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">상품금액</div>
											                        <div class="content" style="display: inline-block;">${ ord.productPrice }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">주문일</div>
											                        <div class="content" style="display: inline-block;">${ ord.orderDate }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">구매자명</div>
											                        <div class="content" style="display: inline-block;">${ ord.conName }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">구매자ID</div>
											                        <div class="content" style="display: inline-block;">${ ord.conId }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">구매자전화</div>
											                        <div class="content" style="display: inline-block;">${ ord.conPhone }</div>
											                    </div>
											                </div>
											                
											                <br>
											
											                <h2>금액확인</h2>
											
											                <hr>
											
											                <div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">주문금액</div>
											                        <div class="content" style="display: inline-block;">${ ord.orderPrice }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">판매자부담할인금액</div>
											                        <div class="content" style="display: inline-block;">${ ord.keyCouponPrice }</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">키보더할인금액</div>
											                        <div class="content" style="display: inline-block;">${ ord.stoCouponPrice }</div>
											                    </div>
											                    <c:choose>
					                                				<c:when test="${ ord.keyCouponPrice ne 0 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">할인쿠폰</div>
													                        <div class="content" style="display: inline-block;">${ ord.keyCouponPrice }</div>
													                    </div>
											                    	</c:when>
											                    	<c:when test="${ ord.stoCouponPrice ne 0 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">할인쿠폰</div>
													                        <div class="content" style="display: inline-block;">${ ord.stoCouponPrice }</div>
													                    </div>
											                    	</c:when>
											                    	<c:otherwise>
											                    		<div class="all">
													                        <div class="title" style="display: inline-block;">할인쿠폰</div>
													                        <div class="content" style="display: inline-block;">0</div>
													                    </div>
											                    	</c:otherwise>
											                    </c:choose>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">배송비</div>
											                        <div class="content" style="display: inline-block;">2500</div>
											                    </div>
											                    <div class="all">
											                        <div class="title" style="display: inline-block;">수수료율</div>
											                        <div class="content" style="display: inline-block;">15%</div>
											                    </div>
											                    <c:choose>
											                    	<c:when test="${ ord.keyCouponPrice ne 0 }">
													                    <div class="all">
													                        <div class="title" style="display: inline-block;">판매수수료(예상)</div>
													                        <div class="content" style="display: inline-block;">${ ord.commission - ord.keyCouponPrice }</div>
													                    </div>
											                    	</c:when>
											                    	<c:otherwise>
											                    		<div class="all">
													                        <div class="title" style="display: inline-block;">판매수수료(예상)</div>
													                        <div class="content" style="display: inline-block;">${ ord.commission }</div>
													                    </div>
											                    	</c:otherwise>
											                    </c:choose>
											                    <c:choose>
											                    	<c:when test="${ ord.keyCouponPrice ne 0 }">
											                    		<c:choose>
													                    	<c:when test="${ ord.orderStatus eq 1 or ord.orderStatus eq 2 }">
															                    <div class="all">
															                        <div class="title" style="display: inline-block;">정산예정금액</div>
															                        <div class="content" style="display: inline-block;">${ (ord.orderPrice - ord.commission) + ord.keyCouponPrice }</div>
															                    </div>
													                    	</c:when>
													                    	<c:when test="${ ord.orderStatus eq 3 }">
															                    <div class="all">
															                        <div class="title" style="display: inline-block;">정산확정금액</div>
															                        <div class="content" style="display: inline-block;">${ (ord.orderPrice - ord.commission) + ord.keyCouponPrice }</div>
															                    </div>
													                    	</c:when>
													                    	<c:otherwise>
													                    		<div class="all">
															                        
															                    </div>
													                    	</c:otherwise>
												                    	</c:choose>
											                    	</c:when>
											                    	<c:otherwise>
											                    		<c:choose>
												                    		<c:when test="${ ord.orderStatus eq 1 or ord.orderStatus eq 2 }">
															                    <div class="all">
															                        <div class="title" style="display: inline-block;">정산예정금액</div>
															                        <div class="content" style="display: inline-block;">${ ord.orderPrice - ord.commission }</div>
															                    </div>
													                    	</c:when>
													                    	<c:when test="${ ord.orderStatus eq 3 }">
															                    <div class="all">
															                        <div class="title" style="display: inline-block;">정산확정금액</div>
															                        <div class="content" style="display: inline-block;">${ ord.orderPrice - ord.commission }</div>
															                    </div>
													                    	</c:when>
													                    	<c:otherwise>
													                    		<div class="all">
															                        
															                    </div>
													                    	</c:otherwise>
												                    	</c:choose>
											                    	</c:otherwise>
											                    </c:choose>
											                    <hr>
											                    <p style="margin: auto;">
											                   	 배송관리에서 조회하시는 정산예정금액은 주문상품별 예상되는 금액으로,
											                    	정확한 정산금액은 ‘정산관리’ 메뉴에서 확인해주세요.
											                	</p>
											                </div>
											            </div>
											        	
											            <!-- Modal footer -->
											            <div class="modal-footer" >
											                <button type="button" class="btn btn-danger" data-dismiss="modal" style="margin: auto;">닫기</button>
											            </div>
											        </div>
											        </div>
											    </div>
		                            		</c:when>
		                            	</c:choose>
		                            </c:forEach>
		                        </tbody>
		                    </table>
		                </form> 
		            </div>
		        </div>
	    	</div>
		</div>
	</div>
</body>
</html>

































