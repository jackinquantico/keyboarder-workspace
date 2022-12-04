<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	
}

td {
	padding-left: 20px;
	padding-top: 30px;
}

#productCount, #productSearch, #productList {
	width: 95%;
	margin: auto;
}

#productCount {
	padding-top: 30px;
	height: 400px;
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
	height: 300px;
	border: 1px solid black;
}

#title_sub {
	font-size: 13px;
	margin-left: 8px;
}

#productPic {
	border: 1px solid black;
	width: 95%;
	margin: auto;
}

#product_detial {
	boarder: 1px solid black;
	width: 95%
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/header.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />


	<form id="insertEnrollForm" method="post" action="insert.pro"
		enctype="multipart/form-data">
		
		<!-- 판매자 정보 넘겨야 함 : 임시로  하드코딩 -->
		<input type="hidden" name="sellerNo" value="10000">
		<div class="content-wrapper">
		
			<br>
			<!-- 콘텐츠 영역 제목 -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품등록/수정</h1>
							<button type="submit" style="float: right;">등록하기</button>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>

			<div class="content">

				<div id="productPic">

					<br>
					<h4 style="margin-left: 20px;">
						상품이미지 *(600x600)<span id="title_sub">대표이미지 1장은 필수 등록 요건
							입니다.</span>
					</h4>

					<hr>
					<div class="col">

						<div class="container px-4 px-lg-1 mt-1"
							style="margin: 20px; padding-top: 20px;">
							<div
								class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-6 justify-content-left">


								<!-- 상품 한 개 단위 -->
								<div class="col mb-10">
									<div align="left">대표이미지</div>
									<div class="card h-20">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
											alt="..." />
											 <label for="attachNo">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										사진 선택하기 </label> 
										<input type="file" id="attachNo1" name="upfile"
										/>
									</div>
								</div>
								
								<!-- 상품 한 개 단위 -->
								<div class="col mb-10">
									<div align="left">추가이미지1</div>
									<div class="card h-20">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
											alt="..." />
											 <label for="attachNo">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										사진 선택하기 </label> 
										<input type="file" id="attachNo2" name="upfile"
										/>
									</div>
								</div>

								<!-- 상품 한 개 단위 -->
								<div class="col mb-10">
									<div align="left">추가이미지2</div>
									<div class="card h-20">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
											alt="..." /> 
											<label for="attachNo">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										사진 선택하기 </label> 
										<input type="file" id="attachNo3" name="upfile"
										/>
									</div>
								</div>

								<!-- 상품 한 개 단위 -->
								<div class="col mb-10">
									<div align="left">추가이미지3</div>
									<div class="card h-20">
										<!-- Product image-->
										<img class="card-img-top"
											src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
											alt="..." /> <label for="attachNo">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										사진 선택하기 </label> 
									<input type="file" id="attachNo4" name="upfile"
									/>
									</div>
								</div>

							</div>
						</div>
						<!-- /.container -->

					</div>
					<!-- /.col -->

				</div>

				<br>

				<div id="productList">
					<div id="productdetail">
					<table width="100%">
					
						<tr>
							<td>판매상품명</td>
							
							<td width="730px"><input type="text" style="width: 700px;"
								placeholder="상품명은 50자까지 등록 가능합니다." id="productName"
								name="productName" required></td>

							<td>판매가</td>
							<td><input type="text" style="width: 500px;" id="price"
								name="price" placeholder=" 원 단위로입력하세요."></td>
							
						</tr>
						<!-- 판매상품설명 작성란 -->
						<tr>
							<td>상품설명</td>
							<td colspan="5">
								<div id="product_detial">
									<textarea placeholder="상품설명을 이미지로 노출하는 경우에도 상세이미지에 대한 대체 텍스트를 입력해주세요."
									style="resize: none; width: 102%; height: 180px;" name="description"></textarea> 
								</div>
							</td>
						</tr>
						
					</table>
					</div>
				</div>
				<!-- /#productList -->
			</div>
			<!-- content -->
		</div>
	</form>
	<!-- content-wrapper -->
	
	<!-- 이미지 업로드 -->
	
	
	
</body>
</html>