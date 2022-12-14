<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<style>
        #orderConfirmForm {
            width: 90%;
            height: 550px;
            margin: auto;
            margin-top: 30px;
        }
        #info{ border : 1px solid rgb(187, 187, 187);}
        #date{ 
            border : 1px solid; 
            height : 70px;
        }
        #searchbtn {
        	width: 70px;  
        	height: 35px; 
        	background-color:black; 
        	line-height: 1px; 
        	margin-left: 30px;"
        }
        #orderConfirmList {
            height : 55%;
            border: 1px solid;
            margin :auto; 
	       	margin-bottom: 30px; 
	       	font-size: 13px;
	       	overflow-y: scroll;
        }
      
    </style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">

<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;정산내역 전체조회</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
	<div id="orderConfirmForm">
        <div id="info">
            <p style="margin-top : 20px; margin-left:20px;">
                ⦁ &nbsp;&nbsp;정산확정금액은 구매자가 구매확정 후 K-Money 로 전환됩니다. <br>
                ⦁ &nbsp;&nbsp;지급된 K-Money 는 판매자님의 출금 요청 후 영업일 기준 3일 이내에 입금됩니다.
            </p>
        </div>
        <br><br>
        <div id="date">
            <div style="line-height: 70px; margin-left: 20px;">
                <span style="margin-right : 70px; font-size: 20px;">조회기간</span>
                <input type="month" style="height: 35px;">
                <input type="button" class="btn btn-dark" value="검색" id="searchbtn"  >
            </div>
        </div>
        <br><br>

        <div id="orderConfirmList" >
            <br>
            <input type="button" class="btn btn-outline-secondary" value="엑셀다운로드" style="float:right; margin-right: 40px;">
            <br><br><br>
            <table class="table table-bordered" align="center" style="width:95%; ">
                <thead align="center">
                    <tr>
                    	<th width="10%">주문번호</th>
                        <th width="10%">정산일</th>
                        <th width="10%">상세내역</th>
                        <th width="10%">상품금액</th>
                        <th width="7%">배송비</th>
                        <th width="10%">총 판매금액</th>
                        <th width="10%">판매수수료</th>
                        <th width="13%">KEYBOAR-DER 쿠폰</th>
                        <th width="10%">입점사 쿠폰</th>
                        <th width="10%">정산확정금액</th>
                    </tr>
                </thead>
                <tbody style="background-color : white;">
                	<c:forEach var="s" items="${ list }">
                		<tr>
	                        <td>${ s.orderNo }</td>
	                        <td>${ s.settleDate }</td>
	                        <td><input type="button" class="btn btn-outline-dark" value="내역확인" align="center"></td>
	                        <td>${s.price }</td>
	                        <td>2500원</td>
	                        <td>${ s.paymentBill }</td>
	                        <td>${ s.commition }</td>
	                        <td>${ s.keyCouponPrice }</td>
	                        <td>${ s.marketCouponPrice }</td>
	                        <td>${ s.settleDept }</td>
                    </tr>
                	</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
	
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>