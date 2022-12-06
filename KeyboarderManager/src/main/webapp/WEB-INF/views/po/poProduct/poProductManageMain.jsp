<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  div { box-sizing: border-box;}

    #productCount, #productSearch {
        width: 95%;
        margin: auto;
    }
    #productCount {
        padding-top: 30px;
        height: 100px;
    }
    #productCount table td {
        text-align: center;
    }
    #productSearch {
        height: 100px;
        padding-top: 30px;
    }
    #productList {
		width: 100%;
        height: 450px;
        overflow-y: scroll;
        overflow-x:hidden; 
        overflow-y:auto;
    }

    #productList_1 { width: 100%; }

    #productone { width: 100%; height: auto; }

    #pro { width: 300px; height: 400px; float: left; }

    #pro p { margin: 0px; padding: 15px; font-size: 15px; }

	#productList {
		width: 95%;
		margin: auto;
	}

</style>
</head>
<body class="hold-transition sidebar-mini">

    <jsp:include page="../../common/header.jsp" />
 
    <jsp:include page="../../common/posidebar.jsp" />
    
  <div class="content-wrapper">
    <form id="showProduct" method="post" action="show.pro">
    <!-- 판매자 정보 넘겨야 함 : 임시로  하드코딩 -->
    <input type="hidden" name="sellerNo" value="10000">
      
 
          <br>
 
          <!-- 콘텐츠 영역 제목 -->
          <div class="content-header">
             <div class="container-fluid">
                <div class="row mb-2">
                   <div class="col-sm-6">
                      <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 전체 조회</h1>
                   </div>
                   <div style="width:97%;">
                   		<button type="button" class="btn btn-secondary" style="float: right;" onclick="location.href='insertEnroll.pro'">등록하기</button>
                   </div>
                </div> <!-- /.row -->
             </div> <!-- /.container-fluid -->
          </div> <!-- /.content-header -->
 
          <div class="content">
 
            <div id="productCount" class="card">
                <table width="100%">
                   <tr>
                      <td>아이콘</td>
                      <td>전체</td>
                      <td>1,234</td>
                      <td>아이콘</td>
                      <td>판매중</td>
                      <td>1,234</td>
                      <td>아이콘</td>
                      <td>품절</td>
                      <td>1,234</td>
                      <td>아이콘</td>
                      <td>판매중지</td>
                      <td>1,234</td>
                   </tr>
                </table>
            </div>
 
            <br>
 
            <div id="productSearch"  class="card">
                <table width="100%">
                   <tr>
                      <td width="5%" align="right">검색어</td>
                      <td width="85%"><input type="text" class="form-control">
                      </td>
                      <td width="10%">
                         <button class="btn btn-secondary" style="width: 80%;">검색</button>
                      </td>
                   </tr>
                </table>
            </div>
            
            <br>
          
            <div id="productList" class="card">
             
                <div id="productList_1" class=" px-2 px-lg-1 mt-5" style="margin: 0px 20px;">
                    <div id="productone">
						<c:forEach var="p" items="${ list }">
                        <div id="pro" align="center">
                            <div style="height: 250px" >
                            <img class="card-img-top"
                            src="resources/uploadFiles/${ p.attachment1}"
                            alt="..." onclick="location.href='detail.pro?productNo=${p.productNo}'" style="width: 250px; height: 250px;"/>
                            </div>
                            <div><p>${p.productName }</p></div>
                            <div><p>${p.price}</p></div>
                        </div>
					 </c:forEach>
                    </div>
                </div>   
          </div>
       </div>
       
       <!-- content -->
    </form>
    </div>
    <!-- content-wrapper -->
 </body>
</html>