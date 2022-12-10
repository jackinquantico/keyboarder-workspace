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
            margin: auto;
            margin-top: 30px;
        }
        #info { border : 1px solid rgb(187, 187, 187);}
        #date {  
            border : 1px solid; 
            height : 70px;
        }
        
        #searchbtn {
        	width: 70px;  
        	height: 30px; 
        	background-color:black; 
        	line-height: 1px; 
        	margin-left: 30px;"
        }
        
        #decisionList {
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
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;구매확정 내역조회</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">

</div> <!-- /.content -->
	<div id="orderConfirmForm">
        <div id="info">
            <p style="margin-top : 15px; margin-left:15px;">
                ⦁ &nbsp;&nbsp;자동 구매확정 : 배송완료 후 7일 후 자동 구매확정됩니다. <br>
                ⦁ &nbsp;&nbsp;구매확정이 완료되면 K-Money로 지급되며, 관련자료는 [정산관리>정산내역조회] 에서 확인하실 수 있습니다. <br>
                ⦁ &nbsp;&nbsp;개인정보보호 목적으로 개인정보는 상당 기간 경과 후 블라인드 처리되며, A/S 목적으로 확인이 필요한 경우 고객센터로 문의바랍니다.
            </p>
        </div>
        <br><br>
       <div id="date">
            <div style="line-height: 70px; margin-left: 20px;">
                <span style="margin-right : 70px; font-size: 20px;">조회기간</span>
                <input type="date" style="height: 30px;"> ~ <input type="date" style="height: 30px;">
                <input type="button" class="btn btn-dark" value="검색" id="searchbtn"  >
            </div>
        </div>
       <br><br>
       
        <div id="decisionList">
        	 <input type="button" class="btn btn-outline-secondary" value="엑셀다운로드" style="float:right; margin-right: 30px; margin-top:20px; margin-bottom:20px;">
            <table class="table table-bordered" align="center" style="width:95%; ">
                <thead align="center">
                    <tr>
                        <th>주문번호</th>
                        <th>구매확정일</th>
                        <th>K-Money지급일</th>
                        <th>상품번호</th>
                        <th>상품명</th>
                        <th>주문금액</th>
                        <th>구매자ID</th>
                        <th>구매자명</th>
                    </tr>
                </thead>
                 <tbody style="background-color : white;">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
	
</div> <!-- /.content-wrapper -->
</body>
</html>