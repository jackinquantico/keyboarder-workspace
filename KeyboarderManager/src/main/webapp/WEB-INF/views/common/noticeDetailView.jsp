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
			
			<hr>
			<div id="noticeTitle">
				<input type="text" id="title" value="XX번째 공지사항입니다." readonly style="width:85%;">
				<input type="text" id="writer" value="관리자">
				<input type="text" id="writeDate" value="2022.11.28">
			</div>
			<hr>
			<div id="noticeContent">
				<textarea id="content" rows="10" style="resize:none;" readonly>XX번째 공지사항입니다.
요거슨
공지사항 내용영역</textarea>
			</div>
			<hr>
			<!-- bo/po 공통으로 사용하는 jsp파일이라 추후 로그인세션의 계정 검사해서 관리자일 경우에만 수정,삭제 버튼 보이게끔 if문 설정해야함 -->
			<div id="noticeBtns">
				<button id="update_btn" onclick="noticeFormSubmit(1);">수정하기</button>&nbsp;&nbsp;&nbsp;
				<button id="delete_btn" onclick="noticeFormSubmit(2);">삭제하기</button>
			</div>
			<hr>

			<form id="noticeForm" action="" method="post">
				<input type="hidden" nmae="nno" value="">
			</form>

		</div>
	</div> <!-- /.content-wrapper -->

	<script>
		function noticeFormSubmit(num) {

			if(num == 1) {
				$("#noticeForm").attr("action", "noticeUpdateForm.bo").submit();
			} else {
				$("#noticeForm").attr("action", "noticeDelete.bo").submit();
			}
		}
	</script>

</body>
</html>