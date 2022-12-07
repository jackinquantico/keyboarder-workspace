<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
.content {
	border: 1px solid white;
	padding: 50px;
}

#mainSummary {
	height: 150px;
	margin: 50px;
	padding: 20px;
}
#mainSummary table {
	font-size: 20px;
	width: 100%;
	height: 80%;
	text-align: center;
	margin-top: 20px;
}
#mainSummary tbody td {
	font-size: 28px;
	vertical-align: bottom;
}

#mid-status {
	height: 250px;
	margin: 50px;
	padding: 20px;
}
#mid-status table {
	width: 100%;
	height: 100%;
}
#mid-status thead, #left-status thead, #right-status thead {
	height: 25%;
	font-size: 20px;
}
.align-right {
	text-align: right;
	padding-right: 50px;
}

#btm-status {
	height: 300px;
	width: 94%;
	margin: auto;
}
#left-status, #right-status {
	height: 100%;
	padding: 20px;
}
#left-status {
	width: 67%;
	float: left;
}
#right-status {
	width: 30%;
	float: right;
}
#left-status table, #right-status table {
	width: 100%;
	height: 100%;
}
#mainSummary, #mid-status, #left-status, #right-status {
	background-color: white;
}
.atag {
	font-size: 14px;
	color: blue;
	font-weight: normal;
	float: right;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="/WEB-INF/views/common/poheader.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
	
	<!-- 실제 콘텐츠 영역 -->
	<div class="content">
	
		<div id="mainSummary" class="card">
			<table>
				<thead>
					<tr>
						<th width="20%">신규주문</th>
						<th width="20%">배송중</th>
						<th width="20%">구매확정</th>
						<th width="20%">주문금</th>
						<th width="20%">정산금</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td>0</td>
						<td class="confirmSettlement"></td>
					</tr>
				</tbody>
			</table>
		</div> <!-- /.mainSummary -->
	
		<div id="mid-status" class="card">
			<table>
				<thead>
					<tr>
						<th colspan="2">
							정산현황
							<a href="" class="atag align-right">전체보기</a>
						</th>
						<th colspan="2">
							상품현황
							<a href="" class="atag align-right">전체보기</a>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="40%">정산예정</td>
						<td width="10%" class="align-right preSettlement">0</td>
						<td width="40%">판매중 상품</td>
						<td width="10%" class="align-right">0</td>
					</tr>
					<tr>
						<td>정산확정</td>
						<td class="align-right confirmSettlement">0</td>
						<td>판매가능 상품수</td>
						<td class="align-right">0</td>
					</tr>
					<tr>
						<td>출금가능</td>
						<td class="align-right ableBalance">0</td>
						<td></td>
						<td class="align-right"></td>
					</tr>
				</tbody>
			</table>
		</div> <!-- /.mid-status -->
		
		<div id="btm-status">
			<div id="left-status" class="card">
				<table>
				<thead>
					<tr>
						<th colspan="2" width="50%">
							판매현황
							<a href="" class="atag align-right">전체보기</a>
						</th>
						<th colspan="2" width="50%"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="35%">결제금액</td>
						<td width="15%" class="align-right">0</td>
						<td colspan="2" rowspan="3">
							<div style="width:100%; height: 100%;">
								<canvas id="sales-chart" height="100%" style="display: block; width: 100%;" class="chartjs-render-monitor"></canvas>
							</div>
						</td>
					</tr>
					<tr>
						<td>결제건</td>
						<td class="align-right">0</td>
					</tr>
					<tr>
						<td>결제취소내역</td>
						<td class="align-right">0</td>
					</tr>
				</tbody>
			</table>
			</div>
			
			<div id="right-status" class="card">
				<table>
					<thead>
						<tr>
							<th>공지사항</th>
							<td align="right">
								<a href="" class="atag">전체보기</a>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>공지사항111</td>
							<td align="right">2022-12-01</td>
						</tr>
						<tr>
							<td>공지사항222</td>
							<td align="right">2022-12-01</td>
						</tr>
						<tr>
							<td>공지사항333</td>
							<td align="right">2022-12-01</td>
						</tr>
						<tr>
							<td>공지사항444</td>
							<td align="right">2022-12-01</td>
						</tr>
						<tr>
							<td>공지사항555</td>
							<td align="right">2022-12-01</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div> <!-- /.btm-status -->
	
	</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->

<script>
function selectSettlement() {
	$.ajax({
		url: "mainSettlement.po",
		success: function(data) {
			$(".confirmSettlement").text(data.confirmSettlement);
			$(".preSettlement").text(data.preSettlement);
			$(".ableBalance").text(data.ableBalance);
		},
		error: function() {
			console.log("ajax 통신실패");
		}
	});
}

$(function() {
	selectSettlement();
});
setInterval(function() {
	selectSettlement();
}, 60000);
</script>

</body>
</html>