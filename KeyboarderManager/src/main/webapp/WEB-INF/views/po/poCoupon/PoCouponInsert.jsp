<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ���</title>
</head>
<style>
td{
padding-left:5px;
padding-top:20px;

}

#coupone_list{
    border-collapse: collapse;
}

</style>
<body class="hold-transition sidebar-mini">

	<jsp:include page="../../common/header.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />

		<div class="content-wrapper">

			<br>
			<!-- ������� -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>

			<div class="content">
			<h3>�������</h3>

	<form id="MainStcoupon" action="insertCoupon.po" method="post">
	<input type="hidden" name="sellerNo" value="${loginUser.sellerNo}">
	<input type="hidden" name="productNo" value="${p.productNo }">
	
	    <fieldset>
	        <table>
	    	<tr>
	    	<td>������*</td>
	    	<td ><input type="text" style="width:500px;" name="couponName"></td>
	    </tr>
	
	    	<tr>
	        <td>��������*</td>
	        <td><input type="radio" name="couponPrice" value="3000">&nbsp;3000�� &nbsp;
	        <input type="radio" name="couponPrice" value="5000">&nbsp;5000�� &nbsp;
	        <input type="radio" name="couponPrice" value="10000">10000�� &nbsp;</td>
	        
		</tr>
	<tr>
	    <td>���� ��ȿ�Ⱓ*&nbsp;</td>
	    <td><input type="date" name="createDate">~<input type="date" name="dueDate"></td>
		</tr>

		<tr>
		<td>���� �������*</td>
			<td>
			<select name ="productNo" required id="productNo">
				<option selected value="">��ǰ����</option>
				<c:forEach var="p" items="${list}">
					<option value="${p.productNo}">${p.productName}</option>
				</c:forEach>
			</select>
			</td>
		<td></td>
	</tr>
	   	 </table>
	   	 <button style="float:right;">���</button><br><br>
	    <hr style="clear:both">
	    <h6>* ���� ��� ����<br>
	        ��Ʈ�ʻ� �������� ���� �� 100% �δ����� ������ ����˴ϴ�. ���� ���������� ���� ������ ���ξ׿� ���ؼ��� KEYBOAR-DER �� �δ����� �ʽ��ϴ�.<br>
	    KEY-BORDER ���� ����, �����ݾ׸�ŭ �Ǹ��� �����ῡ�� �����˴ϴ�. (���� �Ŵ��� ����)<br><br>   
	    * ���� ��Ͻ� ���ǻ���<br>    
	        ���� ������ ��Ʈ�ʻ� ���������� ���¸��� ���� �ߺ� ������ �Ұ����ϸ� ���¸��� ��å�� ��� ��ǰ��ü�� ������ ����ǳ�, �� ��ǰ�� �ϳ��� ������ ��� �����մϴ�.<br>
	        ��ȿ�Ⱓ�� ���� ������ ���� ��Ͽ��� ��ȸ�����մϴ�.
	      </h6>
	    </fieldset>
	    </form> 
		
	</div>
</div>
<body>






</body>
</html>