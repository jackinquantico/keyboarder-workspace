
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#title_sub {
	font-size: 13px;
	margin-left: 8px;
}

#product_img_list{
    border-collapse: collapse;
    width: 100%;
    margin:auto;
}
#buttonarea{
	width: 95%;
}
#buttonarea button{
	float: right;
}
#contentarea {
	width: 95%;
	margin: auto;
	padding: 20px;
}
</style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/header.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />

	<div class="content-wrapper">

	<!-- 콘텐츠 영역 제목 -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품
                       상세 조회</h1>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	
	<div id="buttonarea">
		<button type="submit" class=" btn btn-secondary">수정하기</button>
		<button type="submit" class="btn btn-secondary">삭제하기</button>
	</div>

	<div class="content">
		<div id="contentarea" class="card">
            <form style="width:100%;" id="detailProduct" method="get" action="detail.pro?productNo=${p.productNo }">
            <!-- 판매자 정보 넘겨야 함 : 임시로  하드코딩 -->
    <input type="hidden" name="sellerNo" value="10000">
   
      
                 <table id="product_img_list" style="height:500px;">
                     
                 <tr>
                  <td rowspan="2" style="width:40%;">
                      <!-- Product image-->
                      <img class="card-img-top"
                          src="resources/uploadFiles/${ p.attachment1}"
                          alt="..." style="width: 500px; height:500px;"/>
                 	</td>
                  <td colspan="6" style="height: 250px; width:60%">
                  		<div style="height: 30%;">
                  			상품명 : <input type="text" style="width:700px; border:none;" value="${p.productName}"><br><Br>
                  			상품가격: <input type="text" style="width:400px; border:none;"value="${p.price}">
                  		</div>
                  		<div style="height: 70%;">상품설명
                  		<textarea style="resize: none; width: 100%; height: 170px; border:none;" value="${p.description}"></textarea></div>	
                  </td>
                 </tr>
				<tr id="subpic">
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top"
                           src="resources/uploadFiles/${ p.attachment2}"
                           alt="..." style="width: 250px; height: 250px;" />
                  </div> 
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top"
                           src="resources/uploadFiles/${ p.attachment3}"
                           alt="..." style="width: 250px; height: 250px;"/>
                  </div>
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top"
                           src="resources/uploadFiles/${ p.attachment4}"
                           alt="..." style="width: 250px; height: 250px;"/>
                  </div>
                 </td>
                 <td colspan="3">
                 </td>
             	</tr>
             </table>
		</form>
		
		</div> <!-- /#contentarea -->
	</div>
</div>
</body>
</html>