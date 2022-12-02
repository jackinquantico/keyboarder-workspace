<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/poOrder.css" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/header.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />
	
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
				<table id="option_table" style="border:1px solid black;">
					<tr>
						<th>조회기간</th>
						<td style="text-align:center">
							<select style="width:70%;">
								<option>전체</option>
								<option></option>
							</select>
						</td>
						<td width="200px"><input type="date" width="200px"></td>
						<td width="50px" style="text-align:center">~</td>
						<td width="200px"><input type="date"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<th>검색어</th>
						<td style="text-align:center">
							<select style="width:70%;">
								<option>입점사코드</option>
								<option></option>
							</select>
						</td>
						<td colspan="4">
							<input type="text" style="width:700px;" placeholder="상품명 또는 모델명을 입력해주세요">
						</td>
						<td><button id="search_btn">검색</button></td>
					</tr>
				</table>
			</div>

			<br>

			<div id="allOrder_result">
				<div id="result_div">
					<div id="result_count">주문건 XX</div>
					<div id="result_btn">
						<button>엑셀 다운로드</button>
					</div>
				</div>
				<div id="table_div">
					<table id="result_table" border="1">
						<thead>
							<td>√</td>
							<td>상태</td>
							<td>입점사코드</td>
							<td>주문번호</td>
							<td>상품명</td>
							<td>수량</td>
							<td>주문금액</td>
							<td>구매자ID</td>
							<td>구매자명</td>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td data-toggle="modal" data-target="#orderInfoDetailModal">주문번호test1234</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
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
		</div>
	
	</div> <!-- /.content-wrapper -->


	<!-- 주문번호 누르면 나오는 모달창 -->
	<!-- The Modal -->
	<div class="modal" id="orderInfoDetailModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">주문정보 : 1건</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div id="orderDetail">
						<table border="1">
							<tr>
								<td>주문번호</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>주문상태</td>
								<td></td>
								<td>구매확정일자</td>
								<td></td>
							</tr>
							<tr>
								<td>상품번호</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>상품명</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>수량</td>
								<td></td>
								<td>판매단가</td>
								<td></td>
							</tr>
							<tr>
								<td>할인쿠폰종류</td>
								<td></td>
								<td>할인금액</td>
								<td></td>
							</tr>
							<tr>
								<td>주문금액</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>실상품판매금액</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>

					<div id="expectedSettlement">
						<br>
						<h4>정산예정금액확인</h4>
						<table border="1">
							<tr>
								<td>정산기준금액</td>
								<td></td>
							</tr>
							<tr>
								<td>수수료율</td>
								<td></td>
							</tr>
							<tr>
								<td>판매수수료(예상)</td>
								<td></td>
							</tr>
							<tr>
								<td>정산예정금액</td>
								<td></td>
							</tr>
						</table>
					</div>
					<br>
					<p>전체주문내역에서 조회하시는 정산예정금액은 주문상품별 예상되는 금액으로, <br>
					   정확한 정산금액은 ‘정산관리’ 메뉴에서 확인해주세요.</p>
				</div>

			</div>
		</div>
	</div>



</body>
</html>