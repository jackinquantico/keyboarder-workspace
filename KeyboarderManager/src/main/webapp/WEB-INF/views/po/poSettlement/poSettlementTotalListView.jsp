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
            width: 95%;
            height: 70%;
            margin: auto;
            margin-top: 30px;
        }
        #info{ border : 1px solid rgb(187, 187, 187);}
        #date{ 
            border : 1px solid; 
            height : 100px;
        }
        #orderConfirmList {
            height : 20%;
            border: 1px solid;
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
            <p style="margin-top : 15px; margin-left:15px;">
                ⦁ 정산확정금액은 구매자가 구매확정 후 K-Money 로 전환됩니다. <br>
                ⦁ 지급된 K-Money 는 판매자님의 출금 요청 후 영업일 기준 3일 이내에 입금됩니다.
            </p>
        </div>
        <br><br>
        <div id="date">
            <div style="margin-top:30px; margin-left: 20px;">
                <span style="margin-right : 100px; font-size: 20px;">조회기간</span>
                <input type="date" style="height: 38px;"> ~ <input type="date" style="height: 38px;">
                <input type="button" class="btn btn-dark" value="검색" style="width:74px; background-color:black; margin-left: 30px;" >
            </div>
        </div>
        <br><br>

        <div id="orderConfirmList">
            <br>
            <input type="button" class="btn btn-secondary" value="엑셀다운로드" style="float:right; margin-right: 70px;">
            <br><br><br>
            <table class="table table-bordered" style="margin:auto; margin-bottom: 30px; width:90%; font-size: 13px;">
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
	                        <td></td>
	                        <td>2500원</td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
	                        <td></td>
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