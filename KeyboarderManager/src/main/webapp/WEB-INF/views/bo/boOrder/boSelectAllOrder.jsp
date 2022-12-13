<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/boOrder.css" rel="stylesheet">
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
		        <h1 class="m-0">&nbsp;전체 주문내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<div id="selectOption">
				<table id="option_table">
					<tr>
						<th width="10%" style="padding-left: 20px;">조회기간 *</th>
						<td width="10%">
							<select>
								<option>전체</option>
								<option onclick="optionDate(1);">1주일</option>
								<option onclick="optionDate(2);">1개월</option>
							</select>
						</td>
						<td width="10%">
							<input type="date" id="currentDate" name="currentDate">
						</td>
						<td width="3px" style="text-align:center">~</td>
						<td>
							<input type="date" id="endDate" name="endDate">
						</td>
						<td width="10%"></td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">주문번호</th>
						<td colspan="4">
							<input type="text" style="width:100%" placeholder="주문번호를 입력해주세요">
						</td>
						<td>
							<button id="search_btn" onclick="searchFormSubmit(1);">검색</button>
						</td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">검색어</th>
						<td>
							<select>
								<option>입점사코드</option>
								<option>상품명</option>
							</select>
						</td>
						<td colspan="3">
							<input type="text" style="width:100%" placeholder="상품명 또는 모델명을 입력해주세요">
						</td>
						<td>
							<button id="search_btn">검색</button>
						</td>
					</tr>
				</table>
			</div>

			<br>

			<div id="allOrder_result">
				<div id="result_div">
					<div id="result_count">주문건&nbsp;&nbsp;${ listCount }</div>
					<div id="result_btn">
						<button>엑셀 다운로드</button>
					</div>
				</div>
				<div id="table_div" style="overflow-x:scroll;">
					<table id="result_table" border="1">
						<thead>
							<td><input type="checkbox"></td>
							<td>구매확정일시</td>
							<td>주문일시</td>
							<td>주문번호</td>
							<td>상품명</td>
							<td>입점업체명</td>
							<td>주문자명</td>
							<td>주문금액</td>
							<td>할인금액</td>
							<td>키보더할인액</td>
							<td>결제금액</td>
							<td>판매수수료</td>
							<td>결제수단</td>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${ not empty list }">
									<c:forEach var="o" items="${ list }">
										<tr>
											<td><input type="checkbox"></td>
											<td>${ o.buyConfirmDate }</td>
											<td>${ o.orderDate }</td>
											<td>${ o.orderNo }</td>
											<td>${ o.productName }</td>
											<td>${ o.sellerName }</td>
											<td>${ o.conName }</td>
											<td>${ o.orderPrice }</td>
											<td>${ o.poCouponPrice }</td>
											<td>${ o.boCouponPrice }</td>
											<td>${ o.paymentBill }</td>
											<td>${ o.commission }</td>
											<td>카드</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<script>
			function optionDate(num) {
				
				if(num == 1) {
					
					// $("#currentDate").val(new Date());
				}
			}
		</script>
		
		<script>
			function searchFormSubmit() {
				//console.log($("#currentDate").val());
				//console.log($("#endDate").val());
				
				$.ajax({
					url : "option_date.bo",
					data : {currentDate:$("#currentDate").val(),
							endDate:$("#endDate").val()},
					success : function(result) {
						
						var resultStr = "";
						
						for(var i = 0; i < result.length; i++) {
							
							resultStr += "<tr>"
											+ "<td><input type='checkbox'></td>"
											+ "<td>" + result[i].buyConfirmDate + "</td>"
											+ "<td>" + result[i].orderDate + "</td>"
											+ "<td>" + result[i].orderNo + "</td>"
											+ "<td>" + result[i].productName + "</td>"
											+ "<td>" + result[i].sellerName + "</td>"
											+ "<td>" + result[i].conName + "</td>"
											+ "<td>" + result[i].orderPrice + "</td>"
											+ "<td>" + result[i].poCouponPrice + "</td>"
											+ "<td>" + result[i].boCouponPrice + "</td>"
											+ "<td>" + result[i].paymentBill + "</td>"
											+ "<td>" + result[i].commission + "</td>"
											+ "<td>카드</td>"
										+ "</tr>"
						}
						
						$("#result_table>tbody").html(resultStr);
						$("#result_count").html("주문건&nbsp;&nbsp;" + result.length);
					},
					error : function() {
						console.log("에러");
					}
				});
			}
		</script>
	
	</div> <!-- /.content-wrapper -->


</body>
</html>