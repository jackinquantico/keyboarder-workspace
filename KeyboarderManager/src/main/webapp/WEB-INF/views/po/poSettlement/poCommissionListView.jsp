<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/poCommissionList.css" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/poheader.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;수수료 내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<div id="selectOption">
				<table id="option_table">
					<tr>
						<th width="10%" style="padding-left: 20px;">조회기간</th>
						<td width="10%">
							<input type="date">
						</td>
						<td width="10px" style="text-align:center">&nbsp;~&nbsp;</td>
						<td width="10%">
							<input type="date">
						</td>
						<td></td>
					</tr>
					<tr>
						<td id="hr_td" colspan="5"><hr></td>
					</tr>
					<tr>
						<td id="option_btns" colspan="5" style="text-align:center;">
							<input type="button" id="search_btn" value="검색">&nbsp;&nbsp;&nbsp;
							<input type="reset" id="reset_btn" onclick="resetOption();">
						</td>
					</tr>
				</table>
			</div>

			<br><br>

			<div id="allCommission_result">
				<div id="result_div">
					 <h4>총 합계</h4>
				</div>
				<hr><br>
				<div id="table_div">
					<table id="result_table" border="1">
						<thead>
							<th width="25%">기간</th>
							<th width="25%">수수료 합계 (a+b)</td>
							<th width="25%">판매 수수료 (a)</th>
							<th width="25%">수수료 할인액 (b)</th>
						</thead>
						<tbody>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div> <!-- /.content-wrapper -->

	<script>
		function resetOption() {

			$("#option_table input[type=date]").val("");
		}
	</script>

</body>
</html>