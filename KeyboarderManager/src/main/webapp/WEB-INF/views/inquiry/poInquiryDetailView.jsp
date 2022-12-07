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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	#inquiryDetail { 
		width:90%;
		margin: auto;
	}
	
	 #inquiryDetailContent_1 {
            width : 100%;
            height: 100%;
            margin: auto;
            margin-top: 30px;
        }

        #inquiryDetailContent_2 {
            width : 100%;
            height: 90%;
            border: 2px solid black;
            border-radius: 10px;
            background-color : white;
        }
        #inquiryDetailContent_3 {
            width: 95%;
            margin: auto;
            margin-bottom: 60px;
            margin-top: 60px;
        }
        #replyContent{
            border : none;
            width : 100%;
            background-color: white;
        }
	
</style>
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
        <h1 class="m-0" style="margin-left:20px;">&nbsp;&nbsp;1:1 문의내역</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<!-- 실제 콘텐츠 영역 -->
<div class="content">
	<div id="inquiryDetail">
    <div id="inquiryDetailContent_1">
    <br><br>
    <input type="button" class="btn btn-dark" value="목록" onclick="location.href='list.iq'" style="background-color:black; float: right; margin-left: 5px;">
    <br><br><br>
    <div id="inquiryDetailContent_2">
      <div id="inquiryDetailContent_3">
          <table id="datatable-scroller"
              class="table table-bordered tbl_Form">
              <caption></caption>
              <colgroup>
                  <col width="250px" />
                  <col />
              </colgroup>
              <tbody>
                  <tr>
                      <th width="15%" class="active">판매자</th>
                      <td width="20%">${i.sellerName}</td>
                      <th width="15%">답변현황</th>
                      <td width="20%">
                      	 <c:choose>
	                            <c:when test="${ i.inquiryReply eq '답변대기'}">
	                              답변대기
	                            </c:when>
                            	<c:otherwise>
                              답변완료
                           		 </c:otherwise>
                           		 </c:choose>
                      </td>
                  </tr>
                  <tr>
                      <th class="active">제목</th>
                      <td colspan="3">${i.inquiryName}</td>
                  </tr>
                  <tr>
                      <th style=" height:200px;"class="active" >내용</th>
                      <td colspan="3">${ i.inquiryContent}</td>
                  </tr>
              </tbody>
          </table>
          
          <h4>답변내용</h4>
          <div id="inquiryReplyContent" style="margin-top:20px;">
              <table id="replyArea"
                  class="table table-bordered tbl_Form">
                  <caption></caption>
                  <colgroup>
                      <col width="250px" />
                      <col />
                  </colgroup>
                  <tbody>
                  	<tr>
                  		<c:choose>
	                  		<c:when test="${empty rList }">
	                  			<td><textarea id="replyContent" style="resize:none;" disabled readonly>아직 답변이 작성되지 않았습니다. 조금만 기다려주세요.</textarea></td>
	                  		</c:when>
	                  		<c:otherwise>
	                  			 <td><textarea id="replyContent" style="resize:none;" disabled readonly></textarea></td>    
	                  		</c:otherwise>
                  		</c:choose>
                      </tr>
                  </tbody>
              </table>
          </div>
          <script>
          	$(function() {
          		selectReplyList();
          	});
          	function selectReplyList() {
          		$.ajax({
          			url:"rlist.iq",
          			data : {ino:${ i.inquiryNo}},
          			success : function(result) {
          				var resultStr = "";
          				for(var i=0; i<result.length;, i++) {}
          				reulstStr += "<tr>"
          									+ "<td>" + result[i].replyContent + "</td>"
          									+"</tr>";
          				$("replyArea>tbody>textarea").html(resultStr);		
          			},
          			error : function() {
          				console.log("댓글리스트 조회용 ajax통신실패!");
          			}
          		});
          	}
          </script>
      </div>
    </div>
    </div>
  </div>
</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>