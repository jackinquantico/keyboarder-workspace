<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">

<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;1:1 문의게시판</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
	<div class="inquiry">
        <div class="inquiryList">
        <button type="button" class="btn btn-dark" id="erollbtn">글작성</button>        
        <table id="iqList" class="table table-bordered" style="text-align: center;">
            <thead>
                <tr>
                    <th width="10%">글번호</th>
                    <th width="20%">답변상태</th>
                    <th width="50%">글제목</th>
                    <th width="20%">작성일</th>
                </tr>
                </thead>
                <tbody>
                	<c:forEach var="i" items="${ list }">
                		<tr>
		                        <td></td>
		                        <td></td>
		                        <td></td>
		                        <td></td>
                    	</tr>
                	</c:forEach>
                </tbody>
            </table>
            
             <script>
            	$(function() {
            		$("#iqList>tbody>tr").click(function() {
            			location.href = "detail.iq?ino=" + $(this).children().eq(0).text();
            		});
            	});
            </script>

        </div>
    </div>
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>