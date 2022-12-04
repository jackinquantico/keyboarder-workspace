<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#productCount, #productSearch, #productList {
	width: 95%;
	margin: auto;
}
#productCount {
	padding-top: 30px;
	height: 100px;
	border: 1px solid black;
}
#productCount table td {
	text-align: center;
}
#productSearch {
	height: 100px;
	border: 1px solid black;
	padding-top: 30px;
}
#productList {
	height: 600px;
	overflow-y: scroll;
	border: 1px solid black;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/header.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />

	<form id="showProduct" method="post" action="show.pro">
		<div class="content-wrapper">

			<br>

			<!-- 콘텐츠 영역 제목 -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 전체 조회</h1>
								
						</div>
						<div style="margin-left:1670px;"><button type="button" class="btn-secondary" onclick="location.href='insertEnroll.pro'">등록하기</button></div>
						
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>

			<div class="content">

				<div id="productCount">
					<table width="100%">
						<tr>
							<td>아이콘</td>
							<td>전체</td>
							<td>1,234</td>
							<td>아이콘</td>
							<td>판매중</td>
							<td>1,234</td>
							<td>아이콘</td>
							<td>품절</td>
							<td>1,234</td>
							<td>아이콘</td>
							<td>판매중지</td>
							<td>1,234</td>
						</tr>
					</table>
				</div>

				<br>

				<div id="productSearch">
					<table width="100%">
						<tr>
							<td width="5%" align="right">검색어</td>
							<td width="85%"><input type="text" class="form-control">
							</td>
							<td width="10%">
								<button class="btn btn-secondary" style="width: 80%;">검색</button>
							</td>
						</tr>
					</table>
				</div>
				<div id="productList">
						<div class="container px-2 px-lg-1 mt-5" style="margin-left :50px;">
							<div id="productone">
								<!-- 상품 한 개 단위 -->
								<!-- Product image-->
								<table>
									<tr>
										<td><img class="card-img-top"
											src="https://dummyimage.com/500x500/dee2e6/6c757d.jpg"
											alt="..." onclick="location.href='detail.pro'" style="width: 300px; height: 300px;"/>
										</td>
									</tr>
									<tr>
										<td align="center">상품명</td>
									</tr>
									<tr>
										<td align="center">상품가격</td>
									</tr>
								</table>
							</div>
						</div>
				</div>	
			</div>
		</div>
		<!-- content -->
	</form>
	<!-- content-wrapper -->
</body>
</html>