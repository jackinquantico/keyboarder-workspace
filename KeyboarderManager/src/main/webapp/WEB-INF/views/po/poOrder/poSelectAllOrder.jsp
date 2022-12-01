<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/resources/css/poOrder.css" rel="stylesheet">
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
			<div>
				<table style="border:1px solid black;" width="100%">
					<tr>
						<th>조회기간</th>
						<td>
							<select>
								<option>전체</option>
								<option></option>
							</select>
						</td>
						<td><input type="date"></td>
						<td> ~ </td>
						<td><input type="date"></td>
						<td></td>
						<td></td>
					</tr>
					<tr>
						<th>검색어</th>
						<td>
							<select>
								<option>입점사코드</option>
								<option></option>
							</select>
						</td>
						<td colspan="4">
							<input type="text" placeholder="상품명 또는 모델명을 입력해주세요">
						</td>
						<td><button>검색</button></td>
					</tr>
				</table>
			</div>

			<br>

			<div>
				<div>
					주문건
					<button>엑셀 다운로드</button>
				</div>
				<table border="1" width="100%" height="500px">
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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
							<td></td>
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