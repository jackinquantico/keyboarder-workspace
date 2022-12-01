<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#btnarea {
	width: 97%;
}
#btnarea a {
	float: right;
	margin-right: 10px;
}
#contentarea {
	border: 1px solid lightgray;
	width: 95%;
	margin: auto;
	padding: 20px;
	padding-bottom: 40px;
}
#contentTable {
	width: 100%;
}
#contentTable td {
	height: 50px;
}

</style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입점업체 상세 조회</h1>
      </div><!-- /.col -->
	<div id="btnarea">
		<a href="" class="btn btn-secondary">삭제하기</a>
		<a href="" class="btn btn-secondary">수정하기</a>
	</div>
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>


<!-- 실제 콘텐츠 영역 -->
<div class="content" style="clear: both;">

<div id="contentarea">
	<table id="contentTable">
		<tr>
			<td colspan="2">사업자 정보</td>
		</tr>
		<tr>
			<td width="15%">상호명</td>
			<td colspan="2">레오폴드</td>
		</tr>
		<tr>
			<td>사업자 등록번호</td>
			<td colspan="2">111-11111-1111111</td>
		</tr>
		<tr>
			<td>대표자명(실명)</td>
			<td>
				<input type="text" class="form-control">
			</td>
			<td rowspan="7" width="30%" align="center">
				<div style="border: 1px solid black; height: 350px; width: 350px"></div>
			</td>
		</tr>
		<tr>
			<td>본사 소재지</td>
			<td>
				<input type="text" class="form-control">
			</td>
		</tr>
		<tr>
			<td>판매자 아이디</td>
			<td>sample</td>
		</tr>
		<tr>
			<td>업체 서류 인증일</td>
			<td>미인증</td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>
				<input type="text" class="form-control">
			</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td>
				<input type="text" class="form-control">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="email" class="form-control">
			</td>
		</tr>
	</table>
</div>

</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>