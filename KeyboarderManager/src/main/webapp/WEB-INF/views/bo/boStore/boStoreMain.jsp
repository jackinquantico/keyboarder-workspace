<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#listarea {
	width: 95%;
	height: 800px;
	margin: auto;
	overflow: auto;
}
#listTable {
	width: 100%;
	border-collapse: collapse;
}
#listTable td {
	text-align: center;
	height: 50px;
}
#listTable thead td {
	background-color: gray;
	color: white;
	position: sticky;
	top: 0;
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
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입점업체 관리</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">

<div id="listarea">
	<table id="listTable" class="table-bordered">
		<thead>
			<tr>
				<td width="20%">상호명</td>
				<td width="15%">판매자 ID</td>
				<td width="20%">사업자 등록번호</td>
				<td width="10%">계정 상태</td>
				<td width="10%">가입일</td>
				<td>판매자 정보</td>
				<td>인증 정보</td>
				<td>송금 정보</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>상호명</td>
				<td>판매자 ID</td>
				<td>사업자 등록번호</td>
				<td>정상</td>
				<td>가입일</td>
				<td>
					<a class="btn btn-secondary" href="storeDetail.bo">상세보기</a>
				</td>
				<td>
					<!-- 인증 완료 시에는 인증 확인 / 아닐 때는 미인증 -->
					<a class="btn btn-warning" data-toggle="modal" data-target="#identifyModal">미인증</a>
				</td>
				<td>
					<a class="btn btn-secondary" data-toggle="modal" data-target="#accountModal">계좌변경</a>
				</td>
			</tr>
		</tbody>
	</table>

</div>

<!-- 인증 정보 모달 -->
<div class="modal" id="identifyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">입점 업체 인증 정보</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        	해당 업체 입점을 승인하시겠습니까?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-secondary" onclick="">인증</button>
      </div>

    </div>
  </div>
</div> <!-- /.modal -->

<!-- 계좌 변경 모달 -->
<div class="modal" id="accountModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">입점업체 송금 계좌 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	변경할 계좌번호를 입력하세요. <br><br>
      	<input type="text" class="form-control">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal" data-toggle="modal" data-target="#accountSubmitModal">변경</button>
      </div>

    </div>
  </div>
</div> <!-- /.modal -->

<!-- 계좌 변경 재확인 모달 -->
<div class="modal" id="accountSubmitModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">입점업체 송금 계좌 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	입력하신 계좌번호는 <span>1112312012</span> 입니다. <br><br>
      	변경하시겠습니까?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-secondary">변경</button>
      </div>

    </div>
  </div>
</div> <!-- /.modal -->


</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>