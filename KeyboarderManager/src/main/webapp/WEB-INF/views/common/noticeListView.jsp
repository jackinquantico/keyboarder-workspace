<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/boNotice.css" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">

	<!-- bo/po 공통으로 사용하는 jsp파일이라 추후 로그인세션의 계정 검사해서 헤더와 사이드바 로그인한 계정에 맞는걸로 if문 설정해야함 -->
	<jsp:include page="boheader.jsp" />

	<jsp:include page="bosidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;공지사항</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<!-- bo/po 공통으로 사용하는 jsp파일이라 추후 로그인세션의 계정 검사해서 관리자일 경우에만 글쓰기 보이게끔 if문 설정해야함 -->
			<div id="writeNotice">
				<a href="noticeEnrollForm.bo"><button id="writeNotice_btn">글쓰기</button></a>
			</div>

			<br>

			<div id="noticeList">
				<table id="noticeList_table" border="1">
					<thead>
						<tr>
							<th width="10%">번호</th>
							<th width="65%">제목</th>
							<th width="10%">조회수</th>
							<th width="15%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>24</td>
							<td>공지사항1</td>
							<td>1</td>
							<td></td>
						</tr>
						<tr>
							<td>23</td>
							<td>공지사항2</td>
							<td>23</td>
							<td></td>
						</tr>
						<tr>
							<td>22</td>
							<td>공지사항3</td>
							<td>45</td>
							<td></td>
						</tr>
						<tr>
							<td>21</td>
							<td>공지사항4</td>
							<td>27</td>
							<td></td>
						</tr>
						<tr>
							<td>20</td>
							<td>공지사항5</td>
							<td>8</td>
							<td></td>
						</tr>
						<tr>
							<td>19</td>
							<td>공지사항6</td>
							<td>49</td>
							<td></td>
						</tr>
						<tr>
							<td>18</td>
							<td>공지사항7</td>
							<td>3</td>
							<td></td>
						</tr>
						<tr>
							<td>17</td>
							<td>공지사항8</td>
							<td>345</td>
							<td></td>
						</tr>
						<tr>
							<td>16</td>
							<td>공지사항9</td>
							<td>27</td>
							<td></td>
						</tr>
						<tr>
							<td>15</td>
							<td>공지사항10</td>
							<td>34</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>

			<br>

			<div id="pagingArea">
				<button>&lt;</button>&nbsp;
				<button>1</button>&nbsp;
				<button>2</button>&nbsp;
				<button>3</button>&nbsp;
				<button>&gt;</button>
			</div>

		</div>
	
	</div> <!-- /.content-wrapper -->

	<script>
		$(function() {
			$("#noticeList_table>tbody>tr").click(function() {

				// bo/po 공통으로 사용하는 jsp파일이라 추후 로그인세션의 계정 검사해서 로그인한 계정에 맞는걸로 if문(url주소 bo or po) 설정해야함
				location.href = "noticeDetail.bo";
			});
		});
	</script>

</body>
</html>