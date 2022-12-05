<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<c:forEach var="n" items="${ list }">
							<tr>
								<td>${ n.noticeNo }</td>
								<td>${ n.noticeTitle }</td>
								<td>${ n.viewCount }</td>
								<td>${ n.writeDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<br>

			<div id="pagingArea">
				<c:choose>
					<c:when test="${ pi.currentPage eq 1 }">
						<button disabled>&lt;</button>&nbsp;
					</c:when>
					<c:otherwise>
						<button>&lt;</button>&nbsp;
					</c:otherwise>
				</c:choose>
				
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<button>${ p }</button>&nbsp;
				</c:forEach>
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<button disabled>&gt;</button>
					</c:when>
					<c:otherwise>
						<button>&gt;</button>
					</c:otherwise>
				</c:choose>
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