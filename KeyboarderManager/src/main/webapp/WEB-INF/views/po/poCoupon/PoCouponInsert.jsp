<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쿠폰 등록</title>
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
			<!-- 쿠폰등록 -->
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
			<h3>쿠폰등록</h3>

	<form id="insertStcoupone" action="insert.sco" method="post">
	    <fieldset>
	        <table>
	    	<tr>
	    	<td>쿠폰명*</td>
	    	<td ><input type="text" style="width:500px;"></td>
	    </tr>
	
	    	<tr>
	        <td>쿠폰종류*</td>
	        <td><input type="radio" name="coupon">&nbsp;3000원 &nbsp;
	        <input type="radio" name="5000">&nbsp;5000원 &nbsp;
	        <input type="radio" name="10000">10000원 &nbsp;</td>
	        
		</tr>
	<tr>
	    <td>쿠폰 발행기간*&nbsp;</td>
	    <td><input type="date">~<input type="date"></td>
		</tr>
	<tr>
	    <td>쿠폰 유효기간*</td>
	    <td><input type="radio">기간설정
	        <input type="radio"> 발급일기준 설정</td>
		</tr>
	<tr>
	    <th></th>    
	    <td><input type="date">~<input type="date"></td>    
		</tr>
		<tr>
		<td>쿠폰 발행범위*</td>
		<td><input type="radio">스토어 상품 전체</td>
		<td></td>
	</tr>
	   	 </table>
	   	 <button style="float:right;">등록</button><br><br>
	    <hr style="clear:both">
	    <h6>* 쿠폰 등록 설정<br>
	        파트너사 할인쿠폰 설정 시 100% 부담으로 할인이 적용됩니다. 현재 페이지에서 직접 설정한 할인액에 대해서는 KEYBOAR-DER 가 부담하지 않습니다.<br>
	    KEY-BORDER 쿠폰 사용시, 쿠폰금액만큼 판매자 수수료에서 차감됩니다. (정산 매뉴얼 참고)<br><br>   
	    * 쿠폰 등록시 주의사항<br>    
	        쿠폰 종류는 파트너사 할인쿠폰과 오픈마켓 쿠폰 중복 적용이 불가능하며 오픈마켓 정책상 모든 상품전체에 쿠폰이 적용되나, 한 상품당 하나의 쿠폰만 사용 가능합니다.<br>
	        유효기간이 지난 쿠폰도 쿠폰 목록에서 조회가능합니다.
	        </h6>
	    </fieldset>
	    </form> 
		
	</div>
</div>
<body>






</body>
</html>