package com.kh.kmanager.bo.settlement.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.kmanager.bo.settlement.model.service.CWS_SettlementService;
import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;

@Controller
public class CWS_SettlementController {

	private LocalDate now;
	private DateTimeFormatter formatter;
	private String formatedNow;
	
	@Autowired
	private CWS_SettlementService settlementService;
	
	@RequestMapping("commitionSales.bo")
	public String commitionSalesPage(HttpSession session) {
		
		ArrayList <Member> sellerList = settlementService.selectSeller();
		ArrayList <CWS_Settlement> list = settlementService.selectSellerCommition();							
		
        // 현재 날짜 구하기
        now = LocalDate.now();
 
        // 포맷 정의	
        formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        formatedNow = now.format(formatter);     
        
        // 결과값 필터링
        for(int i = 0; i < list.size(); i++) {
        	
        	int day2 = Integer.parseInt(formatedNow.substring(8)); // 오늘이 몇일인지
        	
        	int month1 = Integer.parseInt(list.get(i).getSettleDate().substring(5, 7)); // 정산월
        	int month2 = Integer.parseInt(formatedNow.substring(5, 7)); // 오늘이 몇달인지
        	
        	int year1 = Integer.parseInt(list.get(i).getSettleDate().substring(0, 4)); // 정산연도
        	int year2 = Integer.parseInt(formatedNow.substring(0, 4)); // 오늘이 몇년도인지
        	
        	if(month1 == month2 && year1 == year2) { // 정산일이 오늘 기준 월과 연도가 같으면(아직 이번달이 끝나지 않은 경우)
        		list.remove(list.get(i)); // 해당 행 제거
        		--i;
        	} else if(month1 == 12 // 정산일이 12월일때,
        			&& month2 == 1 // 이번달이 1월이면서
        			&& year1 == (year2 - 1) // 정산연도가 오늘 연도 기준 작년이며
        			&& day2 < 10) {   // 오늘이 10일보다 전일때
        		list.remove(list.get(i));
        		--i;
        	} else if(year1 == year2 && month1 == (month2 - 1) && day2 < 10) { // 정산월이 12월이 아니고, 오늘 기준 저번달이고, 오늘이 아직 10일이 안됐을 때   
        		list.remove(list.get(i));
        		--i;
        	}
        }
		
        /*
		// 결과 테이블의 정산일을 정산 발생일의 다음달 10일로 맞춰주기
		for(int i = 0; i < list.size(); i++) {
			
			String year;
			String month;					
			int month2;
			
			if(list.get(i).getSettleDate().substring(5, 7).equals("12")) {
				// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
				year = list.get(i).getSettleDate().substring(0, 4); // 2022
				month = "01";
				
				list.get(i).setSettleDate(year + "-" + month + "-10");
			} else {
				// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
				year = list.get(i).getSettleDate().substring(0, 4); // 2022
				month2 = Integer.parseInt(list.get(i).getSettleDate().substring(5, 7)) + 1;
				
				list.get(i).setSettleDate(year + "-" + month2 + "-10");
			}
		}
        */
        
        for(int i = 0; i < list.size(); i++) {
        	
    		// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
    		String endSettleDate = list.get(i).getSettleDate();
    		
    		int settleDateYear = Integer.parseInt((endSettleDate.substring(0, 4)));
    		int settleDateMonth = Integer.parseInt((endSettleDate.substring(5, 7)));       
            
            // 해당 월의 마지막 일수 구하기
            Calendar cal = Calendar.getInstance();

            cal.set(settleDateYear, settleDateMonth, 1);

            endSettleDate = list.get(i).getSettleDate() + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            
            list.get(i).setSettleDate(endSettleDate);
        }

		
        
		session.setAttribute("sellerList", sellerList);
		
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@RequestMapping("searchSettlement.bo")
	public String searchBoSettlement(HttpSession session, Model model, String seller, String searchSettlementDate) {
		
		String searchDate = searchSettlementDate + "-01";
		
		CWS_Settlement searchCondition = new CWS_Settlement(seller, searchDate);
		
		ArrayList <CWS_Settlement> list = settlementService.searchSellerCommition(searchCondition);
		
        // 현재 날짜 구하기
        now = LocalDate.now();
 
        // 포맷 정의	
        formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
 
        // 포맷 적용
        formatedNow = now.format(formatter);     
        
        // 결과값 중 이번달 건 빼기(이번달이 안끝난 경우)
        for(int i = 0; i < list.size(); i++) {
        	
        	if(list.get(i).getSettleDate().equals(formatedNow.substring(0, 7))) { // 결과값이 이번달과 같으면
        		list.remove(list.get(i)); // 해당 행 제거
        		--i;
        	}
        }
		
        /*
		// 결과 테이블의 정산일을 정산 발생일의 다음달 10일로 맞춰주기
		for(int i = 0; i < list.size(); i++) {
			
			String year;
			String month3;					
			int month4;
			
			if(list.get(i).getSettleDate().substring(5, 7).equals("12")) {
				// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
				year = list.get(i).getSettleDate().substring(0, 4); // 2022
				month3 = "01";
				
				list.get(i).setSettleDate(year + "-" + month3 + "-10");
			} else {
				// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
				year = list.get(i).getSettleDate().substring(0, 4); // 2022
				month4 = Integer.parseInt(list.get(i).getSettleDate().substring(5, 7)) + 1;
				
				list.get(i).setSettleDate(year + "-" + month4 + "-10");
			}
		}
		*/
        
        for(int i = 0; i < list.size(); i++) {
        	
    		// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
    		String endSettleDate = list.get(i).getSettleDate();
    		
    		int settleDateYear = Integer.parseInt((endSettleDate.substring(0, 4)));
    		int settleDateMonth = Integer.parseInt((endSettleDate.substring(5, 7)));       
            
            // 해당 월의 마지막 일수 구하기
            Calendar cal = Calendar.getInstance();

            cal.set(settleDateYear, settleDateMonth, 1);

            endSettleDate = list.get(i).getSettleDate() + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            
            list.get(i).setSettleDate(endSettleDate);
        }

        
		model.addAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@ResponseBody
	@RequestMapping(value="sellerBillModal.bo")
	public CWS_Settlement sellerBillModal(HttpSession session, String sellerName, String settleDate, int commition) {
		
		/* 테이블의 정산일을 해당 달의 말일로 수정했으므로 필요없음
		String month1;
		int month2;
		String settleDate2;
		
		String requestDate = settleDate.substring(5, 7); // 정산월만 (01~12)
		
		if (requestDate.equals("01")) {
			month1 = "12";
			settleDate2 = settleDate.substring(0, 5) + month1;
		} else if(requestDate.equals("12") || requestDate.equals("11")){
			month2 = Integer.parseInt(settleDate.substring(5, 7)) - 1;
			settleDate2 = settleDate.substring(0, 5) + month2;
		} else {
			month2 = Integer.parseInt(settleDate.substring(5, 7)) - 1;
			settleDate2 = settleDate.substring(0, 5) + "0" + month2;
		}
		*/ 
		
		String requestDate = settleDate.substring(0, 7); // 'yyyy-mm'
		
		CWS_Settlement modalRequest = new CWS_Settlement(sellerName, requestDate);
		
		CWS_Settlement result = settlementService.sellerBillModal(modalRequest);
		
		/* 해당 테이블의 정산일을 그대로 가져가므로 필요없음
		// 날짜 양식 맞춰주기 (월을 뽑아오므로 1일 붙여주기)
		String modalSettleDate = result.getSettleDate() + "-01";
		
		int settleDateYear = Integer.parseInt((modalSettleDate.substring(0, 4)));
		int settleDateMonth = Integer.parseInt((modalSettleDate.substring(5, 7)));
		int settleDateDay = Integer.parseInt(modalSettleDate.substring(8));        
		
		String modalWriteDate;
		
		if(settleDateMonth == 12) {
			// 작성일용 변수
			modalWriteDate = settleDateYear + "-" + "01" + "-" + "10";
		} else {
			modalWriteDate = settleDateYear + "-" + (settleDateMonth + 1) + "-" + "10";			
		}
		*/
		
		/* 테이블에 말일이 구해져있으므로 필요없음
              해당 월의 마지막 일수 구하기
        Calendar cal = Calendar.getInstance();

        cal.set(settleDateYear, settleDateMonth, settleDateDay);

        modalSettleDate = result.getSettleDate() + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		*/
		
        result.setSettleDate(settleDate); // 테이블의 값(해당 달의 말일)을 그대로 넣어주기
        result.setModalWriteDate(settleDate);
        result.setCommition(commition);
        result.setSupplyValue((int)(commition/1.1));
        result.setTaxAmount(commition - (int)(commition/1.1));
        
        
		return result;		
	}
	
	@RequestMapping("storeSettlement.bo")
	public String storeSettlementPage(HttpSession session) {
		
		ArrayList <Member> sellerList = settlementService.selectSeller();
		ArrayList <CWS_Settlement> list = settlementService.selectStoreSettlement();
		
		for(int i = 0; i < list.size(); i ++) {
			list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
			list.get(i).setTotalOrderPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
			list.get(i).setTotalDeductible(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice() - list.get(i).getCommition() + list.get(i).getKcouponPrice());
			list.get(i).setTotalCouponPrice(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice());
		};
		
		session.setAttribute("sellerList", sellerList);
		session.setAttribute("list", list);
		
		return "bo/boSettlement/storeSettlement";
	}
	
	@RequestMapping("searchStoreSettlement.bo")
	public String searchStoreSettlement(HttpSession session, String seller, String searchSettlementDate1, String searchSettlementDate2) {
		
		CWS_Settlement searchCondition = new CWS_Settlement(1, seller, searchSettlementDate1, searchSettlementDate2);
		
		ArrayList <CWS_Settlement> list = settlementService.searchStoreSettlement(searchCondition);
		
		for(int i = 0; i < list.size(); i ++) {
			list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
			list.get(i).setTotalOrderPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
			list.get(i).setTotalDeductible(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice() - list.get(i).getCommition() + list.get(i).getKcouponPrice());
			list.get(i).setTotalCouponPrice(list.get(i).getScouponPrice() + list.get(i).getKcouponPrice());
		};

		
		session.setAttribute("list", list);
		
		return "bo/boSettlement/storeSettlement";
	}
	
}
