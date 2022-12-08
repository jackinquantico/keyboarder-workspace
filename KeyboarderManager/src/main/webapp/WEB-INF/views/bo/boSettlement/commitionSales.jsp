<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		
		.content {
			margin-top : 30px;
			margin-left : 100px;
		}
		
		hr {
			position : relative;
			width : 1300px;
			left : -250px;
			border : 1px solid darkgray;
	 	}
		
		#searchConditions>div {
			float : left;
			font-size : 20px;
			font-weight : 600;
		}
		
		#searchCondition1 {
			margin-left : 100px;
		}
		
		#searchCondition2 {
			margin-left : 50px;
		}
		
		#searchCondition2 select {
			width : 170px;
		}
		
		#searchCondition3 {
			margin-left : 100px;
		}
		
		#searchCondition4 {
			margin-left : 100px;
		}
		
		#searchCondition4 input {
			position : relative;
			top : -1px;
			font-size : 17px;
		}
		
		.v-line {
		  border-left : 3px solid darkgray;
		  height : 50px;
		  position : relative;
		  top : -10px;
		  left : 25px;
		}
				
		#v-line2 {
			left : 50px;
		}
		
		#v-line3 {
			left : 50px;
		}
		
		
		#line1 {
			position : relative;
			top : 50px;
		}
		
		#buttons {
			position : relative;
			top : 50px;
			left : -480px;
		}
						
		#searchButton {
			background-Color : #9496CA;
			color : white;
			font-size : 20px;
			padding : 5px 25px 5px 25px;
			border : none;
			border-radius : 5px;
		}
		
		#resetButton {
			background-Color : darkGray;
			color : white;
			font-size : 20px;
			padding : 5px 20px 5px 20px;
			border : none;
			border-radius : 5px;
			margin-left : 30px;		
		}
	</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/boheader.jsp" />

	<jsp:include page="../../common/bosidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;수수료 매출내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
		
			<form id="searchSettlementForm">
				<hr>
					<div id="searchConditions">
						<div id="searchCondition1">입점사</div>
						<div class='v-line'></div>
						<div id="searchCondition2">
							<select name="seller">
								<c:forEach var="sl" items="${ sellerList }">
									<option value="sellerName">${ sl.sellerName }</option> 
								</c:forEach>
							</select>							
						</div>
						<div class='v-line' id="v-line2"></div>
						<div id="searchCondition3">정산년월</div>
						<div class='v-line' id="v-line3"></div>
						<div id="searchCondition4">
							<input type="month" name="monthIn">
						</div>
					</div>
					<hr id="line1">					
				<div id="buttons">
					<input type="submit" id="searchButton" value="조회">
					<input type="button" id="resetButton" value="초기화">		
				</div>
			</form>
		

			<br><br><br>
			
			<hr>
			<div id="allOrder_result">
				<div id="result_div">
					<div id="result_count">주문건&nbsp;&nbsp;</div>
					<div id="result_btn">
						<button>엑셀 다운로드</button>
					</div>
				</div>
				<div id="table_div">
					<table id="result_table" border="1">
						<thead>
							<td width="%">협력사번호</td>
							<td width="%">협력사명</td>
							<td width="%">정산일</td>
							<td width="%">
							실결제금액<br>
							(주문금액 - 입점사 쿠폰금액)
							</td>
							<td width="%">
							KEYBOAR-DER<br>
							할인액	
							</td>
							<td width="%">계산서발행액</td>
							<td width="%">매출액</td>
						</thead>
						<tbody>
							<c:forEach var="sl1" items="${ sellerList }" >
								<tr>
									<td>${ sl1.sellerNo }</td>
									<td>${ sl1.sellerName }</td>
									<td>${ sl1.settleDate }</td>
									<td>${ sl1.orderPrice }</td>
									<td>쿠폰필요</td>
									<td>${ sl1.billPublishAmount }</td>
									<td>(${ sl1.sales }</td>
								</tr>							
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</div> <!-- /.content-wrapper -->



</body>
</html>