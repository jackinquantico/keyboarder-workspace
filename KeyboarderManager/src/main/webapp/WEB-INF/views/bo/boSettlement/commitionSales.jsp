<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		
		.content {
			margin-top : 30px;
			margin-left : 100px;
		}
		
		hr {
			position : relative;
			width : 1300px;
			left : -250px;
			border : 1px solid darkgray;
	 	}
		
		#searchConditions>div {
			float : left;
			font-size : 20px;
			font-weight : 600;
		}
		
		#searchCondition1 {
			margin-left : 100px;
		}
		
		#searchCondition2 {
			margin-left : 50px;
		}
		
		#searchCondition2 select {
			width : 170px;
		}
		
		#searchCondition3 {
			margin-left : 100px;
		}
		
		#searchCondition4 {
			margin-left : 100px;
		}
		
		#searchCondition4 input {
			position : relative;
			top : -1px;
			font-size : 17px;
		}
		
		.v-line {
		  border-left : 3px solid darkgray;
		  height : 50px;
		  position : relative;
		  top : -10px;
		  left : 25px;
		}
				
		#v-line2 {
			left : 50px;
		}
		
		#v-line3 {
			left : 50px;
		}
		
		
		#line1 {
			position : relative;
			top : 50px;
		}
		
		#buttons {
			position : relative;
			top : 50px;
			left : -480px;
		}
						
		#searchButton {
			background-Color : #9496CA;
			color : white;
			font-size : 20px;
			padding : 5px 25px 5px 25px;
			border : none;
			border-radius : 5px;
		}
		
		#resetButton {
			background-Color : darkGray;
			color : white;
			font-size : 20px;
			padding : 5px 20px 5px 20px;
			border : none;
			border-radius : 5px;
			margin-left : 30px;		
		}
		
		#result_div {
			height : 60px;
		}
		 
		
		#result_div>div {
			float : left;
		}
		
		#result_btn {
			margin-left : 743px;
		}
		
		#result_co
		#table_div {
			text-align : center;
		} 
		
		#result_count, #result_count_content {
			display : inline;
		}
				
	</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/boheader.jsp" />

	<jsp:include page="../../common/bosidebar.jsp" />
	
	<!-- 콘텐츠 영역 전체 래퍼 -->
	<div class="content-wrapper">
	
		<!-- 콘텐츠 영역 제목 -->
		<div class="content-header">
		  <div class="container-fluid">
		    <div class="row mb-2">
		      <div class="col-sm-6">
		        <h1 class="m-0">&nbsp;수수료 매출내역 조회</h1>
		      </div><!-- /.col -->
		    </div><!-- /.row -->
		  </div><!-- /.container-fluid -->
		</div>
		
		<!-- 실제 콘텐츠 영역 -->
		<div class="content">
		
			<form id="searchSettlementForm" action="searchSettlement.bo">
				<hr>
					<div id="searchConditions">
						<div id="searchCondition1">입점사</div>
						<input type="hidden" id="searchSellerName" name="searchSellerName" value="${ list.get(0).getSellerName() }">
						<div class='v-line'></div>
						<div id="searchCondition2">
							<select id="sellerList" name="seller">
								<c:forEach var="sl" items="${ sellerList }">
									<option value="${ sl.sellerName }">${ sl.sellerName }</option> 
								</c:forEach>
							</select>							
						</div>
						<div class='v-line' id="v-line2"></div>
						<div id="searchCondition3">정산년월</div>
						<input type="hidden" id="searchSettleDate" name="searchSettleDate" value="${ list.get(0).getSettleDate() }">
						<div class='v-line' id="v-line3"></div>
						<div id="searchCondition4">
							<input type="month" id="settleDate" name="searchSettlementDate">
						</div>
					</div>
					<hr id="line1">					
				<div id="buttons">
					<input type="submit" id="searchButton" value="조회">
					<input type="button" id="resetButton" value="초기화">		
				</div>
			</form>
		

			<br><br><br>
			
			<hr>
			<div id="allOrder_result">
				<div id="result_div">
					<div style="font-size : 18px;">지불내역&nbsp;&nbsp;</div>
					<div id="result_count" style="font-size : 18px;">총<div id="result_count_content" style="color:red;"> <c:out value="${ list.size() }"/></div> 건</div>
					<div id="result_btn">
						<button>엑셀 다운로드</button>
					</div>
				</div>
				<div id="table_div" style="overflow:scroll; width:1050px; height:500px; text-align:center;">
					<table id="result_table" border="1" width="1000px;">
						<thead style="background-color:darkgray; font-weight:bold;">
							<td width="%">협력사번호</td>
							<td width="%">협력사명</td>
							<td width="%">정산일</td>
							<td width="%">
							실결제금액<br>
							(주문금액 - 입점사 쿠폰금액)
							</td>
							<td width="%">
							KEYBOAR-DER<br>
							할인액	
							</td>
							<td width="%">계산서발행액</td>
							<td width="%">매출액</td>
						</thead>
						<tbody>
							<c:forEach var="sl1" items="${ list }" varStatus="status" >
								<tr id="settlement${status.index}">
									<td>${ sl1.sellerNo }</td>
									<td>${ sl1.sellerName }</td>
									<td>${ sl1.settleDate }</td>
									<td>${ sl1.orderPrice }</td>
									<td>쿠폰필요</td>
									<td>
										<a data-toggle="modal" data-target="#modal${status.index}" style="cursor:pointer;">
										${ sl1.billPublishAmount }
										</a>
									</td>
									<td>${ sl1.sales }</td>
								</tr>
								<!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
							    <div class="modal fade" id="modal${status.index}">
							        <div class="modal-dialog modal-sm">
							            <div class="modal-content">
							                <!-- Modal Header -->
							                <div class="modal-header">
							                    <h4 class="modal-title">KEYBOAR-DER</h4>
							                    <button type="button" class="close" data-dismiss="modal">&times;</button>
							                </div>
							        
							                <form action="login.me" method="post">
							                    <!-- Modal body -->
							                    <div class="modal-body">

							                    </div>
							                    <!-- Modal footer -->
							                    <div class="modal-footer" id="infofind" style="font-size :13px;">

							                    </div>
							                </form>
							            </div>
							            </div>
							        </div>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	</div> <!-- /.content-wrapper -->

<script>
	$(function() {
		
		
		
		var date = new Date();
		
		String(date);
		
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		
		document.getElementById("settleDate").value = year + "-" + month;

		// 검색 결과 입점사명, 조회 기간 기본값으로 설정
		/*
		var searchSellerName = document.getElementById("searchSellerName").value;
		
		for(var i = 0; i < sellerNameOption.length; i++) {
			if(searchSellerName $(".nameOption:")) {
				sellerNameOption[i].selected = true;
			};
			
		};
		*/
		
		/* 나중에 검색기능을 모달로 구현하려할때 작성할 부분ㄴ
		$("#searchButton").click(function() {
			
			var seller = $("#sellerList").val();		
			var searchSettlementDate = $("#settleDate").val();
			
			$.ajax({
				url : "searchSettlement.bo",
				data : {seller : seller, searchSettlementDate : searchSettlementDate},
				success : function(result) {
					
				}
				
			});
			
		});
		*/
		
		// 초기화버튼
		$("#resetButton").click(function() {
			
			location.href="commitionSales.bo";
		});
	});

</script>

</body>
</html>