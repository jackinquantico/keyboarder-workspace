<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#conTitle {
	display : inline-block;
}
.card {
	width: 95%;
	height: 800px;
	margin: auto;
	overflow: auto;
}
#listTable {
	text-align: center;
}
#listTable td {
	height: 50px;
}
#listTable thead th {
	height: 50px;
	background-color: gray;
	color: white;
	position: sticky;
	top: 0;
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
        <h1 class="m-0" id="conTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;K-MONEY 출금신청내역</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<div class="content">

	<div class=card>
		<table class="table-bordered" id="listTable">
			<thead>
				<tr>
					<th>업체명</th>
					<th>출금요청일</th>
					<th>출금요청금액</th>
					<th>출금계좌번호</th>
					<th>예금주</th>
					<th>처리결과</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>키보더마켓</td>
					<td>2022-12-12</td>
					<td>000000원</td>
					<td>123-123-123</td>
					<td>홍길동</td>
					<td>미처리</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>