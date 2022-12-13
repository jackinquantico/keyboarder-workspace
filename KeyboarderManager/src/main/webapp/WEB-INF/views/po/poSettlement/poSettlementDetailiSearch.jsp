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
        
 td{
  padding-left:15px;
  }
 #coupone_list{
 border-collapse: collapse;
	}
#coupone_view{
 border-collapse: collapse;
}
 </style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
	<form id="selectSettleView" action="searchSettle.po" method="post">   
			<div class="content-wrapper">
			
			<!-- 콘텐츠 영역 제목 -->
			<div class="content-header">
			  <div class="container-fluid">
			    <div class="row mb-2">
			      <div class="col-sm-6">
			        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;정산 상세내역</h1>
			      </div><!-- /.col -->
			    </div><!-- /.row -->
			  </div><!-- /.container-fluid -->
			</div>
			
			<!-- 실제 콘텐츠 영역 -->
			
			<div class="content">
			 <fieldset>
		
			     <table>
			    <tr>
			    <th>조회기간</th>
			        <td>
			            <input type="date">~<input type="date"></td>
			            </tr>
			            <tr>
			                <td colspan="2">
			                    
			                </td> 
			                </tr>
			   </table>
			
			    <div align="center">
			        <button>검색</button>  
			        <button>초기화</button>
			    </div>
			      
			    </fieldset>
			
			  <br> <br>  <br>
			   
			     
		<table border="1" width="100%" id="coupone_list">
		       <thead>
		        <tr>
		           <th rowspan="2">판매량</th>
		           <th rowspan="2">실 상품 판매금액</th>
		           <th rowspan="2">배송비</th>
		           <th colspan="2">할인금액</th>
		           <th colspan="3">수수료정보</th>
		           <th rowspan="2">정산확정금액</th>
		        </tr>
		
		        <tr>
		           <th>KEYBOAR-DER 쿠폰</th>
		           <th>업체쿠폰</th>
		           <th>판매수수료</th>
		           <th>수수료할인</th>
		           <th>최종수수료</th>
		    </tr>
		    <tbody>
		        <tr>
		            <td>100</td>
		            <td>130000</td>
		            <td>0</td>
		            <td>10000</td>
		            <td>3000</td>
            		<td>19500</td>
		            <td>10000</td>
		            <td>9500</td>
		            <td>97500</td>
		    

		      </tr>
		    </tbody>
		</table>
		       
		
	<br> <br>  <br>
		
		
	<table border="1" width="100%" id="coupone_view">
				   
				<tr>
				   <th rowspan="2">구분</th>
				   <th rowspan="2">취소여부</th>
				   <th rowspan="2">매출일</th>
				   <th colspan="4" >주문상품정보</th>
				   <th colspan="3">주문결제정보</th>
				   
				</tr>
				
				<tr>
				    <th>주문번호</th>
				    <th>주문자</th>
				    <th>상품번호</th>
				    <th>상품명</th>
				    <th>판매단가</th>
				    <th>할인쿠폰</th>
				    <th>수수료</th>
				</tr>
				<tbody>
			<c:forEach var="o" items="${list}">
				<tr>
				    <td>${o.orderStatus}</td>
				    <td>${o.orderStatus }</td>
				    <td>${o.orderDate}</td>
				    <td>${o.orderNo}</td>
				    <td>${o.conName}</td>
				    <td>${o.productNo}</td>
				    <td>>${o.productName}</td>
				    <td>${o.price }</td>
				    <td>${o.couponPrice}</td>
				    <td>${o.commition}></td>
					</tr>
					 </c:forEach>
					
					</tbody>
					
					</table>
				
					</div>
					</div>
					</form>
					</body>
					</html>