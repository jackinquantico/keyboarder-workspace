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
							<select id="selectbox_date">
								<option selected></option>
								<option value="1week">1주일</option>
								<option value="1month">1개월</option>
								<option value="3month">3개월</option>
							</select>
						</td>
						<td width="10%">
							<input type="date" id="currentDate" name="currentDate" value="">
						</td>
						<td width="3px" style="text-align:center">~</td>
						<td>
							<input type="date" id="endDate" name="endDate" value="">
						</td>
						<td width="10%"></td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">주문번호</th>
						<td colspan="4">
							<input type="text" style="width:100%" placeholder="주문번호를 입력해주세요" id="search_orderNo">
						</td>
						<td>
							<button id="search_btn" onclick="searchFormSubmit();">검색</button>
						</td>
					</tr>
					<tr>
						<th style="padding-left: 20px;">검색어</th>
						<td>
							<select id="selectbox_keyword">
								<option value="keyword_sellerName">입점업체명</option>
								<option value="keyword_productName">상품명</option>
								<option value="keyword_conName">주문자명</option>
							</select>
						</td>
						<td colspan="3">
							<input type="text" style="width:100%" id="search_keyword" placeholder="업체명을 입력해주세요">
						</td>
						<td>
							<button id="search_btn" onclick="searchFormSubmit();">검색</button>
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
						<tr>
							<td width="2%"><input type="checkbox" onclick="checkAll();"></td>
							<td width="6%">구매확정일시</td>
							<td width="6%">주문일시</td>
							<td width="8%">주문번호</td>
							<td>상품명</td>
							<td width="7%">입점업체명</td>
							<td width="5%">주문자명</td>
							<td width="5%">주문금액</td>
							<td width="6%">업체할인금액</td>
							<td width="6%">키보더할인액</td>
							<td width="5%">결제금액</td>
							<td width="5%">판매수수료</td>
							<td width="5%">결제수단</td>
						</tr>
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
			function checkAll() {
				
				if("#result_table>tbody input[type=checkbox]".checked != true) {
					
					$("#result_table>tbody input[type=checkbox]").attr("checked", true);
					
				} else if("#result_table>tbody input[type=checkbox]".checked == true) {
					
					$("#result_table>tbody input[type=checkbox]").attr("checked", false);
				}
				
								
			}
		</script>
		
		<script>
			var today = new Date();
			var today_str = today.getFullYear() + "-" + ("0"+(today.getMonth() + 1)).slice(-2) + "-" + ("0"+today.getDate()).slice(-2);
			
			$("#selectbox_date").change(function() {
				
				if($(this).val() == "1week") {
					var week = new Date(today_str);
					week.setDate(week.getDate() - 7);
					var week_str = week.getFullYear() + "-" + ("0"+(week.getMonth() + 1)).slice(-2) + "-" + ("0"+week.getDate()).slice(-2);
					
					$("#currentDate").val(week_str);
					$("#endDate").val(today_str);
					
				} else if($(this).val() == "1month") {
					var month = new Date(today_str);
					month.setMonth(month.getMonth() - 1);
					var month_str = month.getFullYear() + "-" + ("0"+(month.getMonth() + 1)).slice(-2) + "-" + ("0"+month.getDate()).slice(-2);
					
					$("#currentDate").val(month_str);
					$("#endDate").val(today_str);
					
				} else if($(this).val() == "3month") {
					var month3 = new Date(today_str);
					month3.setMonth(month3.getMonth() - 3);
					var month3_str = month3.getFullYear() + "-" + ("0"+(month3.getMonth() + 1)).slice(-2) + "-" + ("0"+month3.getDate()).slice(-2);
					
					$("#currentDate").val(month3_str);
					$("#endDate").val(today_str);
					
				} else {
					$("#currentDate").val("");
					$("#endDate").val("");
					
				}
			});
			
			
			$("#selectbox_keyword").change(function() {
				
				if($(this).val() == "keyword_sellerName") {
					$("#search_keyword").attr("placeholder", "업체명을 입력해주세요");
					
				} else if($(this).val() == "keyword_productName") {
					$("#search_keyword").attr("placeholder", "상품명을 입력해주세요");
					
				} else {
					$("#search_keyword").attr("placeholder", "주문자명을 입력해주세요");
					
				}
			});
		</script>
		
		<script>
			function searchFormSubmit() {
					
					if($("#currentDate").val() != "" && $("#endDate").val() != "") {
						
						$.ajax({
							url : "optionSearch.bo",
							data : {currentDate:$("#currentDate").val(),
									endDate:$("#endDate").val(),
									search_orderNo:$("#search_orderNo").val(),
									search_keyword:$("#search_keyword").val(),
									keywordType:$("#selectbox_keyword").val()
									},
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
					else {
						alert("조회기간을 입력해주세요");
					}
			}
		</script>
	
	</div> <!-- /.content-wrapper -->


</body>
</html>