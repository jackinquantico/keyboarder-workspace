
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.content {
	
}

#productCount, #productSearch, #productList {
	width: 95%;
	margin: auto;
}

#productCount {
	padding-top: 30px;
	height: 1000px;
	border: 1px solid black;
}

#productCount table td {
	text-align: center;
}

#productSearch {
	height: 100px;
	border: 1px solid black;
	padding-top: 30px;
}

#productList {
	height: 300px;
	border: 1px solid black;
}

#title_sub {
	font-size: 13px;
	margin-left: 8px;
}

#product_img_list{
    border-collapse: collapse;
}
#description {
	width: 100%;
	height: 150px;
}
#buttonarea{
	width: 95%;
}
#buttonarea button{
	float: right;
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
		<button type="submit" class="btn-secondary">등록하기</button>
	</div>

	<div class="content" style="padding-left: 50px;">
							
            <form style="width:95%;">
                 <table id="product_img_list" style="width:100%; height:500px;">
                     
                 <tr>
                  <td rowspan="2" style="width:40%;">
                      <!-- Product image-->
                      <img class="card-img-top"
                          src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
                          alt="..." style="width: 800px; height:800px;" />
                 	</td>
                  <td colspan="6" style="height: 405px; width:60%">
                  		<div style="height: 30%; width: 1200px;">상품가격 : 000000  원</div>
                  		<div style="height: 70%; width: 1200px;">상품가격 : 000000  원</div>	
                  </td>
                 </tr>
				<tr id="subpic">
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top"
                           src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
                           alt="..." style="width: 400px; height: 400px;" />
                  </div> 
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top"
                           src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
                           alt="..." style="width: 400px; height: 400px;" />
                  </div>
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top"
                           src="https://dummyimage.com/400x400/dee2e6/6c757d.jpg"
                           alt="..." style="width: 400px; height: 400px;" />
                  </div>
                 </td>
                 <td colspan="3">
                 	<div style="width:750px;"></div>
                 </td>
             	</tr>
             </table>
		</form>
	</div>
</div>
</body>
</html>