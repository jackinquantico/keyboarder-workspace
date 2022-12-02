<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송주문</title>

    <style>
        div{
            border: 1px solid red;
            box-sizing: border-box;
            margin: auto;
        }

        .delivery-view-main{
            width: 100%;
            height: 863px;
        }

        .delivery-header{
            border: 1px solid blue;
            width: 100%;
            height: 10%;
        }

        .delivery-tracking{
            border: 1px solid green;
            width: 100%;
            height: 10%;
        }

        .delivery-date-tracking{
            border: 1px solid purple;
            width: 100%;
            height: 30%;
        }

        .delivery-information{
            border: 1px solid pink;
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
            font-size: 10px;
            display: inline-block;
            margin-left: 1%;
        }

        #delivery-tracking-main{
            width: 100%;
            height: 100%;
        }

        .delivery-status-main{
            border: 1px solid orange;
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
            background-color: pink;
            
        }

        #delivery-information-count, #delivery-information-count-num{
            display: inline-block;
            font-size: 150%;
            margin-left: 3.0%;
            margin-top: 8px;
        }

        #delivery-information-main{
            width: 100%;
            height: 100%;
            margin-left: 0%;
        }

        .delivery-information-notice{
            width: 100%;
            height: 85%;
        }

        #delivery-list{
            border-collapse: collapse;
        }

        #delivery-list>thead>tr>th{
            font-size: 16px;
            height: 30px;
            text-align: center;
        }

        #delivery-list>tbody>tr>td{
            font-size: 16px;
            text-align: center;
        }

        .delivery-date-tracking{
            width: 100%;
            height: 30%;
        }

        #delivery-lookup{
            width: 100%;
            height: 80px;
            background-color: red;
        }
        
        #delivery-period{
        	width: 100%;
        	height: 80px;
        	background-color: yellow;
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
		                    <div class="delivery-status">배송준비중</div>
		                    <div class="delivery-status-num">10</div>
		                </div>
		                <div class="delivery-status-main">
		                    <div class="delivery-status">배송중</div>
		                    <div class="delivery-status-num">10</div>
		                </div>
		                <div class="delivery-status-main">
		                    <div class="delivery-status">배송완료</div>
		                    <div class="delivery-status-num">10</div>
		                </div>
		                <div class="delivery-status-main">
		                    <div class="delivery-status">구매확정</div>
		                    <div class="delivery-status-num">10</div>
		                </div>
		            </div>
		        </div>
		
		        <!-- 배송 날짜별 조회 -->
		        <div class="delivery-date-tracking">
		            <br>
		            <form action="" method="">
		                <div id="delivery-lookup">
		                    <div style="display: inline-block; margin-left: 2%; font-size: 20px; margin-top: 25px; width: 8%;">
		                    	조회기간
		                    </div>
		                    <select style="margin-left: 5%;">
		                        <option>전체</option>
		                        <option>언제로할까</option>
		                    </select>
		                    <input type="date" style="margin-left: 3%;">
		                    	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp~
		                    	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		                    <input type="date">
		                </div>
		                <div id="delivery-period">
		                    <div style="display: inline-block; margin-left: 2%; font-size: 20px; margin-top: 25px; width: 8%;">검색어</div>
		                    <select style="margin-left: 5%;">
		                        <option>입점사코드</option>
		                        <option>언제로할까</option>
		                    </select>
		                    <div style="width: 30%; display: inline-block; margin-left: 3%;">
		                        <input type="text" name="keyword" placeholder="검색어를 입력해주세요" style="width: 100%;">
		                    </div>
		                </div>
		                <div id="delivery-button" align="center">
		                	<button type="submit" style="margin-top: 17px; width: 20%;">
		                		검색하기
		                	</button>
		                </div>
		            </form>        
		        </div>
		
		        <!-- 배송 정보 조회 -->
		        <div class="delivery-information">
		            <div id="delivery-information-header">
		                <div id="delivery-information-main">
		                    <div id="delivery-information-count">주문건 : </div>       
		                    <div id="delivery-information-count-num">20</div>    
		                    <button style="width: 20%; height: 60%; margin-left: 60%;">엑셀 다운로드</button>         
		                </div>
		            </div>
		            <div class="delivery-information-notice">
		                <form>
		                    <table border="1"width="100%" id="delivery-list">
		                        <thead>
		                            <tr style="border-color: blue;">
		                                <th width="5%">주문번호</th>
		                                <th width="7%">배송상태</th>
		                                <th width="8%">상품코드</th>
		                                <th width="13%">상품명</th>
		                                <th width="8%">판매단가</th>
		                                <th width="8%">할인쿠폰</th>
		                                <th width="7%">판매자부담할인액</th>
		                                <th width="7%">키보드부담할인액</th>
		                                <th width="7%">주문금액</th>
		                                <th width="7%">구매자ID</th>
		                                <th width="7%">수령자명</th>
		                                <th width="8%">결제일</th>
		                                <th width="8%">주문확정여부</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td width="5%">30</td>
		                                <td width="7%">배송완료</td>
		                                <td width="8%">123456</td>
		                                <td width="13%">아무개 키보드</td>
		                                <td width="8%">100000</td>
		                                <td width="8%">3000</td>
		                                <td width="7%">3000</td>
		                                <td width="7%">-</td>
		                                <td width="7%">100000</td>
		                                <td width="7%">apple</td>
		                                <td width="7%">신짱구</td>
		                                <td width="8%">2000-07-05</td>
		                                <td width="8%">Y</td>
		                            </tr>
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