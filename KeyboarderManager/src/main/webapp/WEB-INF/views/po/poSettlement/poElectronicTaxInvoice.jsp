<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자세금계산서</title>

    <style>
        div{
            border: 1px solid red;
            box-sizing: border-box;
            margin: auto;
        }

		#electronic-list>thead>tr{
			height: 50px;
			text-align: center;
		}
		
		#electronic-list>tbody>tr{
			height: 30px;
			text-align: center;
		}
        
    </style>
</head>
<body class="hold-transition sidebar-mini">

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<jsp:include page="/WEB-INF/views/common/posidebar.jsp" />

	<div class="content-wrapper">

		<div class="content">

			<div class="electronic-view-all">
		        <div class="electronic-header">
		            <h1 style="padding: 20px 50px; margin: 0px;">전자세금계산서 관리</h1>
		        </div>
		
		        <div class="electronic-date-tracking">
		            <br>
		            <form action="" method="">
		                <div id="electronic-lookup">
		                    <div style="display: inline-block; padding: 20px 50px; margin: 0px; font-size: 20px; width: 20%;">
		                       	 조회기간
		                    </div>
		                    <input type="date" style="margin-left: 4%;">
		                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp~
		                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		                    <input type="date">
		                </div>
		                <hr style="background-color: orange; width: 92%;">
		                <div id="electronic-period">
		                    <div style="display: inline-block; margin-left: 4%; font-size: 20px; padding: 20px 50px; margin: 0px; width: 20%;">계산서 종류</div>
		                    <select style="margin-left: 5%;">
		                        <option>계산서종류는</option>
		                        <option>뭐가있을까?</option>
		                    </select>
		                </div>
		                <div id="electronic-button" align="center">
		                    <button type="button" class="btn btn-outline-success" style="margin-top: 17px; width: 20%; font-size: 17px;">
		                        	검색하기
		                    </button>
		                </div>
		            </form>        
		        </div>
		
		        <br><br>
		
		        <div>
		            <div>
		                <h3 style="padding: 20px 50px; margin: 0px;">전자세금계산서 조회</h3>
		            </div>
		            <hr style="height: 3px; background-color: green; width: 92%;">
		            <div class="electronic-information-notice">
		                <form>
		                    <table border="1" width="92%" id="electronic-list" align="center">
		                        <thead>
		                            <tr>
		                                <th width="15%">정산기간</th>
		                                <th width="13%">계산서 종류</th>
		                                <th width="16%">합계</th>
		                                <th width="18%">공급가액</th>
		                                <th width="18%">새액</th>
		                                <th width="15%">세금계산서</th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                            <tr>
		                                <td>2022-11-01 ~ 2022-12-01</td>
		                                <td>계산서 종류 무엇?</td>
		                                <td>3000000</td>
		                                <td>5000000</td>
		                                <td>1000000</td>
		                                <td><a href="#">세금계산서 확인</a></td>
		                            </tr>
		                        </tbody>
		                    </table>
		                </form> 
		            </div>
		            <br>
		            <div>
		            	<p style="padding: 20px 50px; margin: 0px; font-size: 13px;">
		            		 전자세금계산서 발급은 익월 2일(영업일 기준) 이후 가능합니다.<br>
       						인감 날인은 전자서명으로 대체하며, 전자세금계산서 뷰어가 자동으로 설치되지 않는 경우에는 직접 다운로드하시어 설치 가능합니다.<br>
       						부가세법 따라 개인판매자에게도 주민등록번호로 전자세금계산서가 자동 발급됩니다.

							<br><br>
							
							전자세금계산서 종류<br>
      						OM수수료매출 : 전월 1일~말일까지 OM수수료 매출에 대하여 발행되는 계산서입니다.<br>
   						    K-Money사용 :  전월 1일~말일까지 현금성 K-Money사용분에 대하여 월단위 합산액을 기준으로 발행되는 계산서입니다.<br>
		            	</p>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</body>
</html>