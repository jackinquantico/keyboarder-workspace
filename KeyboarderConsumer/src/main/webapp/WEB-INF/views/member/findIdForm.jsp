<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<form name="idfindscreen" method = "POST">
		<div class = "search-title">
			<h3>아이디 찾기</h3>
			<p>회원가입 시 인증한 이메일주소로 아이디 찾기가 가능합니다.</p>
		</div>
		<section class = "form-search">
			<div class = "find-name">
				<label>이름</label>
				<input type="text" name="member_name" class="form-control" placeholder = "회원가입 시 등록한 이름을 입력해주세요.">
			<br>
			</div>
			<div class = "find-email">
				<label>이메일</label>
				<input type="text" onKeyup = "addHypen(this);" name="member_phone" class="form-control" placeholder = "ex) email@gmail.com">
			</div>
			<br>
		</section>
		<div class ="btnSearch">
			<input type="button" name="enter" class="btn btn-dark btn-block" style="background-color : black;" value="찾기"  onClick="id_search()">
			<input type="button" name="cancle" class="btn btn-warning btn-block" value="취소" onClick="history.back()">
		</div>
	</form>
	
	<script>
		function id_search() {
			var frm = document.idfindscreen;
			if(frm.member_name.value.length<1) {
				alert("이름을 입력해주세요.");
				return;
			} 
			if(frm.member_email.value.length < 10) {
				alert("이메일주소를 정확하게 입력해주세요.");
				return;
			}
			frm.method = "post";
			frm.action = "findIdResult.jsp"; //아이디 찾고 넘어간 화면
			frm.submit();
		}
	</script>
</body>
</html>