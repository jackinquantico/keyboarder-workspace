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
#btnarea button {
	float: right;
	margin-right: 10px;
}
#contentarea {
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
		<button onclick="storeUpdate(2);" class="btn btn-secondary">탈퇴처리</button>
		<button onclick="storeUpdate(1);" class="btn btn-secondary" id="updateBtn">수정하기</button>
	</div>
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>


<!-- 실제 콘텐츠 영역 -->
<div class="content" style="clear: both;">

<div id="contentarea" class="card">
	<form action="" method="post" id="storeInfo">
	<table id="contentTable">
		<tr>
			<td colspan="2">사업자 정보
				<input type="hidden" name="sellerNo" value="${ s.sellerNo }">
			</td>
		</tr>
		<tr>
			<td width="15%">상호명</td>
			<td colspan="2">${ s.sellerName }</td>
		</tr>
		<tr>
			<td>사업자 등록번호</td>
			<td colspan="2">${ s.corpNo }</td>
		</tr>
		<tr>
			<td>대표자명(실명)</td>
			<td>
				<input type="text" class="form-control" name="repName" value="${ s.repName }" maxlength="6" required>
			</td>
			<td rowspan="7" width="30%" align="center">
				<div style="height: 350px; width: 350px">
					<c:choose>
						<c:when test="${ empty s.logoAttachment }">
							<img width="95%" height="95%" 
							src="http://tourbiz.spectory.net/src/images/noImg.gif" />
						</c:when>
						<c:otherwise>
							<img width="95%" height="95%"  src="${ s.logoAttachment }" />
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td>본사 소재지</td>
			<td>
				<input type="text" class="form-control" name="location" value="${ s.location }" maxlength="33" required>
			</td>
		</tr>
		<tr>
			<td>판매자 아이디</td>
			<td>${ s.sellerId }</td>
		</tr>
		<tr>
			<td>가입일 / 인증여부</td>
			<td>
				${ s.joinDate } / 
				<c:choose>
					<c:when test="${ s.identifyStatus eq 'N' }">
						미인증
					</c:when>
					<c:otherwise>
						인증
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>
				<input type="text" class="form-control" name="accountNo" value="${ s.accountNo }" maxlength="20" required>
			</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td>
				<input type="text" class="form-control" name="sellerPhone" value="${ s.sellerPhone }" maxlength="13" required>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="email" class="form-control" name="sellerEmail" value="${ s.sellerEmail }" maxlength="50" required>
			</td>
		</tr>
	</table>
	</form>
</div>

<!-- 인증 정보 모달 -->
<!-- data-toggle="modal" data-target="#identifyModal" -->
<div class="modal" id="resignModal">
  <div class="modal-dialog">
    <div class="modal-content">
		
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">입점 업체 인증 정보</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        	해당 업체를 탈퇴처리하시겠습니까?
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-secondary" onclick="resign();">탈퇴처리</button>
	      </div>
	      
    </div>
  </div>
</div> <!-- /.modal -->

<script>
	function storeUpdate(num) {
		
		if (num == 1) {
			
			// 입력한 계좌번호가 10자 미만일 경우에는 경고 alert();
			var regex = /^(\d|\-){10,20}$/;
			
			if (!regex.test($("input[name=accountNo]").val())) {
				alert("숫자와 - 만 입력할 수 있습니다. 정확한 계좌번호를 입력해주세요.");
				$("input[name=accountNo]").focus();
				return;
			}
			
			if (!regex.test($("input[name=sellerPhone]").val())) {
				alert("숫자와 - 만 입력할 수 있습니다. 정확한 휴대폰 번호를 입력해주세요.");
				$("input[name=sellerPhone]").focus();
				return;
			}
			
			$("#storeInfo").attr("action", "updateStore.bo");
			$("#storeInfo").submit();
			
		} else if (num == 2) {
			$("#resignModal").modal("show");
		}
	}
	
	function resign() {

		$("#storeInfo").attr("action", "deleteStore.bo");
		$("#storeInfo").submit();
	}

	$(function() {
		
		var repName = $("input[name=repName]").val();
		var location = $("input[name=location]").val();
		var accountNo = $("input[name=accountNo]").val();
		var sellerPhone = $("input[name=sellerPhone]").val();
		var sellerEmail = $("input[name=sellerEmail]").val();
		
		if (repName.length == 0 
				|| location.length == 0
				|| accountNo.length == 0
				|| sellerPhone.length == 0
				|| sellerEmail.length == 0) {
			$("#updateBtn").attr("disabled", true);
		}
	});
	
	$("input").keyup(function() {
		var repName = $("input[name=repName]").val();
		var location = $("input[name=location]").val();
		var accountNo = $("input[name=accountNo]").val();
		var sellerPhone = $("input[name=sellerPhone]").val();
		var sellerEmail = $("input[name=sellerEmail]").val();
		
		if (repName.length < 2 
				|| location.length < 10
				|| accountNo.length == 0
				|| sellerPhone.length == 0
				|| sellerEmail.length == 0) {
			$("#updateBtn").attr("disabled", true);
		}
		
		if (repName.length > 0
				&& location.length > 0
				&& accountNo.length > 0
				&& sellerPhone.length > 0
				&& sellerEmail.length > 0) {
			$("#updateBtn").attr("disabled", false);
		}
		
	});
	

</script>

</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>