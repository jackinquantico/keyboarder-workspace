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

	<jsp:include page="boheader.jsp" />

	<jsp:include page="bosidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;공지사항 작성</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
			<form id="noticeEnrollForm" method="post" action="">
			
				<hr>
				<div id="noticeTitle">
					<input type="text" id="title" placeholder="제목을 입력해주세요" required>
				</div>
				<hr>
				<div id="noticeContent">
					<textarea id="content" rows="10" style="resize:none;" placeholder="내용을 입력해주세요 " required></textarea>
				</div>
				<hr>
				<div id="noticeBtns">
					<button type="submit" id="write_btn">작성하기</button>&nbsp;&nbsp;&nbsp;
					<a href="noticeList.bo"><input type="button" id="cancle_btn" value="취소"></input></a>
				</div>
				<hr>

			</form>
		</div>
	</div> <!-- /.content-wrapper -->



</body>
</html>