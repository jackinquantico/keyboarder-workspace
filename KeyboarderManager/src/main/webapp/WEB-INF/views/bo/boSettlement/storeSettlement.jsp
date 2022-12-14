<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
	@charset "UTF-8";

.content {
    width : 80%;
    height : 800px;
}

#selectOption{
    border : 1px solid black;
    margin : 0px 10px 10px 10px;
    padding : 10px 30px 10px 30px;
    height : 120px;
}

#option_table {
    width : 100%;
    height : 100%;
}

#option_table th, #option_table td{
    padding-right : 30px;
}

#submitButton {
	background-color : #323232;
	color : white;
	width : 100px;
}

#resetButton {
	background-color : white;
	width : 100px;
}

#option_table select {
    width : 150px;
    height : 60%;
}

#option_table input {
    width : 180px;
    height : 60%;
}

#search_btn {
    width : 100px;
    background-color: #323232;
    color : white;
    border : none;
    text-align : center;
}


#allOrder_result{
    border : 1px solid black;
    height : 600px;
    margin : 0px 10px 10px 10px;
    padding : 10px 10px 10px 10px;
}

#result_div {
    height : 40px;
    position : relative;
}

#result_count {
    padding : 0px 10px 0px 10px;
    width : 50%;
    height : 100%;
    position : absolute;
    font-size : 23px;
    padding : 5px 20px 5px 20px;
}

#result_btn {
    width : 50%;
    text-align: right;
    float : right;
    padding : 5px 20px 5px 20px;
}

#result_btn>button {
	background-color : white;
    width : 200px;
    cursor : pointer;
}

#table_div {
    padding : 10px 20px 10px 20px;
}

#result_table{
    border : 1px solid black;
    text-align : center;
    width:100%;
}

#result_table>thead {
    background-color: lightgray;
}

th {
	height : 45px;
}

	</style>
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- "excel download" -->
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
		        <h1 class="m-0">&nbsp;입점업체 정산관리</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<div id="selectOption">
				<form action="searchStoreSettlement.bo">
					<table id="option_table">
						<tr>
							<th style="padding-left: 20px;">입점업체</th>
							<td>
								<select id="sellerList" name="seller">
									<c:forEach var="sl" items="${ sellerList }">
										<option value="${ sl.sellerName }">${ sl.sellerName }</option> 
									</c:forEach>
								</select>	
							</td>
							<td></td>
							<td></td>
							<td><button type="submit" id="submitButton">검색</button></td>
						</tr>
						<tr>
							<th width="10%" style="padding-left: 20px;">조회기간</th>
							<td width="10%">
								<input type="date" id="settleDate1" name="searchSettlementDate1" onchange="handler1(event);">
							</td>
							<td width="3px" style="text-align:center">~</td>
							<td width="10%">
								<input type="date" id="settleDate2" name="searchSettlementDate2" onchange="handler2(event);">
							</td>
							<td><a href="storeSettlement.bo"><button type="button" id="resetButton">초기화 </button></a></td>
						</tr>					
					</table>								
				</form>

			</div>

			<br>

			<div id="allOrder_result">
				<div id="result_div">
					<div id="result_count">입점업체 정산 목록 (전체 <c:out value="${ list.size() }"/>건)</div>
					<div id="result_btn">
	                    <a href="excelSettlement.bo">
		                    <button type="button" class="btn btn-outline-secondary">
		                    	엑셀다운로드
		                    </button>
	                    </a>						
					</div>
				</div>
				<br>
				<div id="table_div" style="overflow:scroll; height:530px;">
					<table id="result_table" border="1">
						<thead>
							<tr>
								<th width="6%;" rowspan="2">정산일</th>
								<th width="15%;" colspan="2">업체정보</th>
								<th width="6%;" rowspan="2">주문금액<br>(a)</th>
								<th width="25%;" colspan="3">쿠폰할인금액</th>
								<th width="7%;" rowspan="2">총주문금액<br>(a-(b+c))</th>
								<th width="7%;" rowspan="2">판매수수료<br>(d)</th>
								<th width="7%;" rowspan="2">수수료 할인액<br>(e)</th>
								<th width="8%;" rowspan="2">총 공제액<br>((b+c)-d+e)</th>
								<th width="9%;" rowspan="2">정산액<br>(K-money 전환액)<br>(a-d+e)</th>				
							</tr>
							<tr>
								<th width="9%;">업체코드</th>
								<th width="6%;">업체명</th>
								<th width="7%;">입점사 부담액<br>(b)</th>
								<th width="12%;">Keyboar-der 부담액<br>(c)</th>
								<th width="6%;">합계<br>(b+c)</th>							
							</tr>
						</thead>
						<tbody>
							<c:forEach var="sl1" items="${ list }" varStatus="status" >
								<tr>
									<td>${ sl1.settleDate }</td>
									<td>${ sl1.sellerNo }</td>
									<td>${ sl1.sellerName }</td>
									<td>${ sl1.orderPrice }</td>
									<td>${ sl1.scouponPrice }</td>
									<td>${ sl1.kcouponPrice }</td>
									<td>${ sl1.totalCouponPrice }</td>
									<td>${ sl1.totalOrderPrice }</td>
									<td>${ sl1.commition }</td>
									<td>${ sl1.kcouponPrice }</td>
									<td>${ sl1.totalDeductible }</td>
									<td>${ sl1.settleDept }</td>
								</tr>							
							</c:forEach>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</div> <!-- /.content-wrapper -->

<script>
	$(function() {
		
		// 지정한 날짜를 알맞은 형식으로 보내도록
		var date = new Date();
		
		String(date);
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var month2 = date.getMonth();
		var day = date.getDate();		
		
		document.getElementById("settleDate2").value = year + "-" + month + "-" + day;
		document.getElementById("settleDate1").value = year + "-" + month2 + "-" + day;
											
	});
	
	function handler1(e){ // 첫번째 날짜와 두번째 날짜의 시간 비교
		
		// 지정한 날짜를 알맞은 형식으로 보내도록
		var date = new Date();
		
		String(date);
		
		var year = date.getFullYear();
		var month2 = date.getMonth();
		var day = date.getDate();
		
		var date1 = $("#settleDate1").val();
		var date2 = $("#settleDate2").val();

		if(date1 > date2) {
			alert("첫번째 날짜는 두번째 날짜보다 미래일 수 없습니다.");
			$("#settleDate1").val(year + "-" + month2 + "-" + day);
		}
		
	}
	
	function handler2(e){ // 첫번째 날짜와 두번째 날짜의 시간 비교
		
		// 지정한 날짜를 알맞은 형식으로 보내도록
		var date = new Date();
		
		String(date);
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		
		var date1 = $("#settleDate1").val();
		var date2 = $("#settleDate2").val();

		if(date1 > date2) {
			alert("첫번째 날짜는 두번째 날짜보다 미래일 수 없습니다.");
			$("#settleDate2").val(year + "-" + month + "-" + day);
		}
		
	}
	
</script>

</body>
</html>