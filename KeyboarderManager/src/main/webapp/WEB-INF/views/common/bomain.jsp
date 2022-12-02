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
#btm-content { height: 350px; }
#left-status, #right-status {
	height: 100%; 
	display:inline; 
	border: 1px solid black; 
	float: right;
	margin: 0px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
	
	<!-- 실제 콘텐츠 영역 -->
	<div class="content">
	
		<div id="top-content" class="card">
			<div class="card-header">
				전체 매출 통계
			</div>
			<div class="card-body" style="width:100%; height: 90%;">
				<canvas id="sales-chart" height="100%" style="display: block; width: 100%;" class="chartjs-render-monitor"></canvas>
			</div>
		</div>
		
		<div id="btm-content" class="card">
			<div id="left-status" style="width:40%;">
				<div class="card-header">
					상품 통계
				</div>
				<div class="card-body">
					<canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block;" class="chartjs-render-monitor"></canvas>
				</div>
			</div>
			<div id="right-status" style="width:60%;">
				<div class="card-body">
					<table >
						<tr>
							<td>TOP 1</td>
							<td align="center">
								<div style="border: 1px solid black;"><img class="card-img-top"
									src="https://dummyimage.com/200x200/dee2e6/6c757d.jpg"
									alt="..." /></div>
								<div>상품명</div>
								<div>상품가격</div>
							</td>
						</tr>
					</table>
				</div>
				<div class="card-body">
				</div>
				<div class="card-body">
				</div>
			</div>
		</div>
	
	</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->

</body>
</html>