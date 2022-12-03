<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
.content {
	border: 1px solid white;
	padding: 50px;
}
#top-content, #btm-content {
	padding: 20px;
	margin: 50px;
}
#top-content { height: 470px; }
#btm-content { 
	height: 350px; 
	padding-bottom: 20px;
}
#left-status, #right-status {
	height: 100%; 
	display:inline;
	margin: 0px;
	float: left;
	padding: 10px;
}
#right-status table {
	width: 100%;
	height: 100%;
}
#right-status td {
	padding-right: 15px;
	height: 100%;
}
.topTitle {
	vertical-align: top;
	text-align: right;
}
.card-header {
	font-size: 20px;
	font-weight: bold;
}
#right-status td img {
	width: 150px;
	height: 150px;
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

<jsp:include page="/WEB-INF/views/common/boheader.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
	
	<!-- 실제 콘텐츠 영역 -->
	<div class="content">
	
		<div id="top-content" class="card">
			<div class="card-header">
				전체 매출 통계
				<a href="" class="atag">전체보기</a>
			</div>
			<div class="card-body" style="width:100%; height: 90%;">
				<canvas id="sales-chart" height="100%" style="display: block; width: 100%;" class="chartjs-render-monitor"></canvas>
			</div>
		</div>
		
		<div id="btm-content" class="card">		
			<div class="card-header border-0">
				상품 통계
				<a href="" class="atag">전체보기</a>
			</div>
			<div class="card-body">
			
				<div id="left-status" style="width:35%;">
					<canvas id="visitors-chart" style="display: block; height: 100%; width: 100%;" class="chartjs-render-monitor"></canvas>
				</div>
				<div id="right-status" style="width:65%;">
					<table>
						<tr>
							<td class="topTitle" width="15%">TOP 1</td>
							<td align="center">
								<div>
									<img class="card-img-top" style="width: 150px; height: 150px"
									src="https://dummyimage.com/150x150/dee2e6/6c757d.jpg"
									alt="..." />
								</div>
								<div>상품명</div>
								<div>상품가격</div>
							</td>
							<td class="topTitle" width="15%">TOP 2</td>
							<td align="center">
								<div>
									<img class="card-img-top"
									src="https://dummyimage.com/150x150/dee2e6/6c757d.jpg"
									alt="..." />
								</div>
								<div>상품명</div>
								<div>상품가격</div>
							</td>
							<td class="topTitle" width="15%">TOP 3</td>
							<td align="center">
								<div>
									<img class="card-img-top"
									src="https://dummyimage.com/150x150/dee2e6/6c757d.jpg"
									alt="..." />
								</div>
								<div>상품명</div>
								<div>상품가격</div>
							</td>
						</tr>
					</table>
				</div>
			
			</div>
		</div>
	
	</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->

</body>
</html>