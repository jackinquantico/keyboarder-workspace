<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#btnarea {
	width: 97%;
}
#btnarea a {
	float: right;
	margin-right: 10px;
}
#contentarea {
	border: 1px solid lightgray;
	width: 95%;
	margin: auto;
	padding: 20px;
	padding-bottom: 40px;
}
#contentTable {
	width: 100%;
}
#contentTable td {
	height: 50px;
}

</style>
</head>
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<jsp:include page="/WEB-INF/views/common/bosidebar.jsp" />

<!-- 콘텐츠 영역 전체 래퍼 -->
<div class="content-wrapper">
<br>
<!-- 콘텐츠 영역 제목 -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입점업체 상세 조회</h1>
      </div><!-- /.col -->
	<div id="btnarea">
		<a onclick="storeUpdate(2);" class="btn btn-secondary">탈퇴처리</a>
		<a onclick="storeUpdate(1);" class="btn btn-secondary">수정하기</a>
	</div>
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>


<!-- 실제 콘텐츠 영역 -->
<div class="content" style="clear: both;">

<div id="contentarea">
	<form action="" method="post" id="storeInfo">
	<table id="contentTable">
		<tr>
			<td colspan="2">사업자 정보
				<input type="hidden" name="sellerNo" value="${ s.sellerNo }">
			</td>
		</tr>
		<tr>
			<td width="15%">상호명</td>
			<td colspan="2">${ s.sellerName }</td>
		</tr>
		<tr>
			<td>사업자 등록번호</td>
			<td colspan="2">${ s.corpNo }</td>
		</tr>
		<tr>
			<td>대표자명(실명)</td>
			<td>
				<input type="text" class="form-control" name="repName" value="${ s.repName }">
			</td>
			<td rowspan="7" width="30%" align="center">
				<div style="height: 350px; width: 350px">
					<c:choose>
						<c:when test="${ empty s.logoAttachment }">
							<img width="95%" height="95%" 
							src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPsAAADJCAMAAADSHrQyAAAAY1BMVEX///+VlZWPj4/j4+O0tLT7+/ucnJyfn5/b29uSkpKkpKSrq6uurq7m5uZmZmaWlpbz8/OIiIjs7Ox5eXlkZGRsbGzNzc2BgYF0dHTU1NRvb2+7u7ve3t7w8PDCwsKKiopcXFxuhZvhAAAELklEQVR4nO3b25KiOhQG4HBIICgHUQgg6rz/U85Kgt3OlNDs6mrdrPm/Kwtzwc9KApIoBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAU3LBu8/tR8k23i2IW77xcxXqRaGq332OPyRSOviCVjwrX5dfRg+CsH33af6Eqerhc/fLouN3n+cPqF10rdvombzVfLNHrsNrlT//ulZ8s+e+6uVM9Ivi2+f9NDcbfaq65pjdT3PzHX4aD2fNL/uUTc91+MR3+HEM2WX301yQzDyyTVcmyEXKLns+DeY2f353m2bBUYieW/aPpzk981TjZzmKzq7u9dfP8KSMbFtu2Xdrogepa8ssexU+Sfr35QhH35hZ9shnV3N89sg35ph94Xep+wkT+i7PMnu50KBknj1ZaJDpz+zM7u/IvtCAeXb9D2dfXfd/ea5D9pec1ysg+0IDZPefMc+/5LxeAdkXGjxmb3m9o/4vz3W5vU7Msq+su1/AYLQGvT77/TU9n70Hq7N/sU67RWuz31fnGUVfmX2sta86q51Gq7Lra+KjRy87r1dYlT3wVQ9YVX1t9oDbNOeszs5rmnP8usxCg/JedWYdXny9LtP7suuS1zTn+LprtX9OhVN0flX/XIed2Tt87/AMqy4e5vF5DKc5776JaiE6u5vbh3r30b21fYjRbgB8bEDQesdxrN9d8iWckwMAAAAAAAAA/A/FqqyEONtliTExJptez1S7sxBXpXr6nCfKbTDJy+lvg73yDa/u7ySbfYsng6GhfOpE0bpuv+tM5Y5XByVF3DQZfW6bQdtj16Zxixd9YeJsuFX0vUo2nF2Ux+NOiISyx4P9y+Pg12Z89uFg6HPSGbdaVQadvRSyPF7oQpxSERfVG8/8+8qbogra7MqWPD/6/VNT9uxIXdvog627NLE2969ESn0gLi5vPffvKsNrEz1m37vDU5+/dqkQp7PLHnXpeaCwl8N9vXbz2W91Ec9mT81VpMVobPb2mPd2bnjMHlWXarsbrsqbMLe57EUdKnE1tcu+M1XenX32KI7jiMbEsevMdl/clzdJPTmbyV7tjcxK6bLfSn/UZu/DQ0HjvWn7vt9y3eU49LPZWyp9LGx2WVDNE2rj+rzsCwZz3U1Wh11STNnrP7NfquLc9S572jSnU9Pk03hPeWQXmQkKW1MauWP3eI8rLtIc6CZus8cDdXCa+UV1CyWX7BU9uJnCPrZdhcjsTC4+s4tk6IQb7+pAiauCap4N1KZ12Wmev2x2vMuQerpsml+USzfD0CQ+SmVKKfa/anp+S4Q8hjQY3J2tM1LUxjakobAvGhoI291QHdn/84+p3SFd9efzOFVRjhEN/lSKKrUjIRIydfeyiA6JCzXsc7oIqbXt51oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+K7fw2lApeR5FTgAAAAASUVORK5CYII=" />
						</c:when>
						<c:otherwise>
							<img width="95%" height="95%"  src="${ s.logoAttachment }" />
						</c:otherwise>
					</c:choose>
				</div>
			</td>
		</tr>
		<tr>
			<td>본사 소재지</td>
			<td>
				<input type="text" class="form-control" name="location" value="${ s.location }">
			</td>
		</tr>
		<tr>
			<td>판매자 아이디</td>
			<td>${ s.sellerId }</td>
		</tr>
		<tr>
			<td>가입일 / 인증여부</td>
			<td>
				${ s.joinDate } / 
				<c:choose>
					<c:when test="${ s.identifyStatus eq 'N' }">
						미인증
					</c:when>
					<c:otherwise>
						인증
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td>
				<input type="text" class="form-control" name="accountNo" value="${ s.accountNo }">
			</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td>
				<input type="text" class="form-control" name="sellerPhone" value="${ s.sellerPhone }">
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="email" class="form-control" name="sellerEmail" value="${ s.sellerEmail }">
			</td>
		</tr>
	</table>
	</form>
</div>

<script>
	function storeUpdate(num) {
		
		if (num == 1) {
			$("#storeInfo").attr("action", "updateStore.bo");
			$("#storeInfo").submit();
		} else if (num == 2) {
			$("#storeInfo").attr("action", "deleteStore.bo");
			$("#storeInfo").submit();
		}
	}
		
</script>

</div> <!-- /.content -->

</div> <!-- /.content-wrapper -->
</body>
</html>