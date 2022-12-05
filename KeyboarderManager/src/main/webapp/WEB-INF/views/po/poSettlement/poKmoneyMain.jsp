<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#conTitle, input[type=date] {
	display : inline-block;
}
#moneyTable, #listTable {
	width:100%; 
	margin:auto;
}
#moneyTable {
	text-align: center;
	height: 100px;
}
#moneyTable thead {
	height: 50px;
}
#listTable td {
	padding: 20px;
	line-height: 2.5em;
}
#intable {
	margin-bottom: 20px;
}
#withdrawMoney {
	display:inline;
	margin-left: 100px;
}
#withdrawAccount {
	margin-left: 100px;
	margin-right: 30px;
}
#accountOwner { margin-left: 10px; }
button {
	width: 8%;
}
#ableMoney {
	width: 50%;
	border: 1px solid lightgray;
	padding: 10px;
}
#ableMoney span {
	font-size: 16pt;
	font-weight: bold;
}
.card {
	width: 95%;
	margin: auto;
}
input[name=startDate] {
	margin-left: 115px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<div class="content-wrapper">

<br>

<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-m-6">
        <h1 class="m-0" id="conTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K-MONEY 잔액관리</h1>
        <span>* K-MONEY는 판매활동시 부가서비스를 이용할 수 있는 키보더 전용 사이버 화폐입니다.</span>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">
	<div class=card>
	<table class="table-bordered" id="moneyTable">
		<thead>
			<tr>
				<th>총 잔액</th>
				<th>정산확정금액</th>
				<th>정산예정금액</th>
				<th>송금예정잔액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${ s.allBalance }원</td>
				<td>${ s.confirmSettlement }원</td>
				<td>${ s.preSettlement }원</td>
				<td>${ s.remitBalance }원</td>
			</tr>
		</tbody>
	</table>
	</div>
</div>

<br>

<div class="content-header">
	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-m-6">
				<h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K-MONEY 출금 신청 / 내역</h1>
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div><!-- /.container-fluid -->
</div>

<div class="content">
	<div class=card>
	<table class="table-bordered" id="listTable">
		<tr>
			<td>
				<form action="withdraw.po" method="get">
					<div id="ableMoney">
						출금 가능 금액 <span style="float:right;"><span id="allMoney">${ s.ableBalance }</span>원</span>
					</div>
					출금신청 <br>
					ㄴ 출금요청금액 <input type="number" class="form-control col-lg-2" id="withdrawMoney" name="withdrawMoney" required>원 &nbsp;&nbsp;&nbsp; 
					<button type="button" class="btn btn-secondary" onclick="selectAllMoney();">전액출금</button> 
					<button type="button" class="btn btn-secondary" onclick="selectHundred();">100만원</button><br>
					ㄴ 출금계좌정보 <span id="withdrawAccount">계좌번호 : 0000-000-000000 </span> | <span id="accountOwner"> 예금주 : 키보더(주)</span> <button class="btn btn-secondary" style="float:right;">출금요청</button>
					<!-- 임시로 하드코딩 -->
					<input type="hidden" name="sellerNo" value="10000">
					<input type="hidden" name="accountNo" value="0000-000-000000">
					<input type="hidden" name="repName" value="홍길동">
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action="kmoneyWithdraw.po" method="get">
					출금신청내역 <br>
					ㄴ 출금요청일 <input type="date" class="form-control col-lg-2" name="startDate" required> ~ <input type="date" class="form-control col-lg-2" style="display:inline;" name="endDate" required> <br>
					<br>
					<div align="center" class="btn-area">
						<button type="submit" class="btn btn-secondary">검색</button>
						<button type="reset" class="btn btn-secondary">초기화</button>
					</div>
					<!-- 임시로 하드코딩 -->
					<input type="hidden" name="sellerNo" value="10000">
				</form>
			</td>
		</tr>
	</table>
	</div>
</div>

<script>

// 전액출금 버튼 클릭시 함수
function selectAllMoney() {
	var ableMoney = $("#allMoney").text();
	
	$("#withdrawMoney").val(ableMoney);
}

/* // 100만원씩 추가 함수
function selectHundred() {
	if ($("#allMoney").text() >= 1000000) {
		var money = $("#withdrawMoney").val();
		money += 1000000;
		$("#withdrawMoney").val(money);
	}
} */
</script>

</div>
</body>
</html>