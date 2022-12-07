package com.kh.kmanager.po.settlement.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.settlement.model.service.SettlementService;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Controller
public class SettlementController {

	@Autowired
	private SettlementService settlementService;
	
	/**
	 * K-Money 잔액관리 페이지 띄우는 용도 - 채영
	 * @return
	 */
	@RequestMapping("kmoney.po")
	public String kmoneyMain(Model model, HttpSession session) {
		
		// 총 잔액, 정산확정금액, 정산예정금액, 송금예정잔액, 출금가능금액 필요
		// SELLER_NO 필요함 => session에서 뽑아온 값으로 변경
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		Settlement s = settlementService.selectKmoneySettlement(sellerNo);
		
		model.addAttribute("s", s);
		
		return "po/poSettlement/poKmoneyMain";
	}
	
	/**
	 * K-Money 출금신청내역 페이지 - 채영
	 * @return
	 */
	@RequestMapping("kmoneylist.po")
	public String kmoneyWithdraw(Withdraw w, Model model, HttpSession session) {
		
		// 기간별 검색 : startDate, endDate
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		w.setSellerNo(sellerNo);
		
		// 업체명, 출금요청일, 출금요청금액, 출금계좌번호, 예금주, 처리결과 필요
		ArrayList<Withdraw> list = settlementService.selectWithdrawRequestList(w);
		
		model.addAttribute("list", list);
		
		return "po/poSettlement/poKmoneyList";
	}
	
	
	/**
	 * PO 수수료 내역 조회 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : PO 수수료 내역 조회 페이지 이동
	 */
	@RequestMapping("commissionList.po")
	public String selectCommissionList() {
		
		return "po/poSettlement/poCommissionListView";
	}
	
	/**
	 * PO K-money 출금신청 요청 - 채영
	 * @return
	 */
	@RequestMapping("withdraw.po")
	public String withdrawRequest(HttpSession session, Withdraw w) {
		
		// 판매자식별키, 출금요청금액, 출금계좌번호, 예금주	
		// w 에 로그인세션으로부터 얻어온 값 담아둠
		int result = settlementService.insertWithdraw(w);
		
		if (result > 0) {			
		
			// 출금가능금액에서 출금요청금액을 뺀 나머지 출력해야함 - 완료
			// 송금예정잔액에 출금요청금액 더한 값 출력해야함 - 완료
			
			session.setAttribute("alertMsg", "K-MONEY는 현금성 으로 사용하실 수 있으며 고객님의 은행 계좌로 현금 출금을 신청 후 송금될 예정입니다. 현금 지급은 요청일 기준 익일 지급됩니다. (영업일 기준)");
		
		} else {
			session.setAttribute("alertMsg", "K-MONEY 출금 요청에 실패했습니다.");
		}
		
		return "redirect:/kmoney.po";
	}
	
	/**
	 * Po 메인페이지의 정산현황 조회용 - 채영
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="mainSettlement.po", produces="application/json; charset=UTF-8")
	public String mainSettlement(HttpSession session) {
		
		// 해당 로그인 유저의 정산 내역 조회
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		Settlement s = settlementService.selectKmoneySettlement(sellerNo);
		
		return new Gson().toJson(s);
	}
}
