
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
	margin:5px;
	margin-bottom:20px;
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
	<br>
	<!-- 콘텐츠 영역 제목 -->
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0" style="float: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품
                       수정하기</h1>
				</div>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</div>
	
	<div class="content">
	<div id="contentarea" class="card">
	<form id="updateForm" method="post" action="update.pro" enctype="multipart/form-data">
	<input type="hidden" name="sellerNo" value="10000">
    <input type="hidden" name="productNo" value="${p.productNo}">
	<div id="buttonarea">
		<button type="submit" class="btn btn-secondary">수정하기</button>
		<button type="button" class="btn btn-secondary">삭제하기</button>
	</div>
                 <table id="product_img_list" style="height:500px;">
                     
                 <tr>
                  <td rowspan="2" style="width:40%;">
                      <!-- Product image-->
                      <img class="card-img-top" id="img1"
                          src="resources/uploadFiles/${ p.attachment1}"
                          alt="..." style="width: 500px; height:500px;"/>
                          <label for="attachNo">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							사진 선택하기 </label> 
							<c:if test="${not empty p.attachment1}">
							<input type="file" id="file1" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="attachment1" value="${p.attachment1 }">
						</c:if>		
                 	</td>
                  <td colspan="6" style="height: 250px; width:60%">
                  		<div style="height: 30%;">
                  			상품명 : <input type="text" style="width:700px; border:none;" name="productName" value="${p.productName}"><br><Br>
                  			상품가격: <input type="text" style="width:400px; border:none;" name="price" value="${p.price}">
                  		</div>
                  		<div style="height: 70%;">상품설명
                  		<textarea style="resize: none; width: 100%; height: 170px; border:none;" name="description" >${p.description}</textarea></div>	
                  </td>
                 </tr>
				<tr id="subpic">
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top" id="img2"
                           src="resources/uploadFiles/${p.attachment2}"
                           alt="..." style="width: 250px; height: 250px;" />
                           <label for="attachNo">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							사진 선택하기 </label> 
							<c:if test="${not empty p.attachment2}">
							<input type="file" id="file2" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="attachment2" value="${p.attachment2 }">
						</c:if>		
                  </div> 
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top" id="img3"
                           src="resources/uploadFiles/${ p.attachment3}"
                           alt="..." style="width: 250px; height: 250px;"/> 
                           <label for="attachNo">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							사진 선택하기 </label> 
							<c:if test="${not empty p.attachment3}">
							<input type="file" id="file3" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="attachment3" value="${p.attachment3 }">
                           </c:if>		
                  </div>
                 </td>
                 <td>
                  <div id="sub_items">
                       <!-- Product image-->
                       <img class="card-img-top" id="img4"
                           src="resources/uploadFiles/${ p.attachment4}"
                           alt="..." style="width: 250px; height: 250px;"/>
                           <label for="attachNo">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							사진 선택하기 </label> 
							<c:if test="${not empty p.attachment4}">
							<input type="file" id="file4" name="reupfile" onchange="addImg();"/>
							<input type="hidden" name="attachment4" value="${p.attachment4 }">
                           </c:if>	
                  </div>
                 </td>
                 <td colspan="3">
                 </td>
             	</tr>
             </table>
             <script>
  
             
         	$('#file1').change(function(){
    		    setImageFromFile(this,'#img1');
    		});
    		$('#file2').change(function(){
    		    setImageFromFile(this,'#img2');
    		});
    		$('#file3').change(function(){
    		    setImageFromFile(this,'#img3');
    		});
    		$('#file4').change(function(){
    		    setImageFromFile(this,'#img4');
    		});

    		function setImageFromFile(input, expression) {
    		    if (input.files && input.files[0]) {
    		        var reader = new FileReader();
    		        reader.onload = function (e) {
    		            $(expression).attr('src', e.target.result);
    		        }
    		        reader.readAsDataURL(input.files[0]);
    		    }
    		}
          
             </script>
		</form>
		
		</div> <!-- /#contentarea -->
	</div>
</div>
</body>
</html>