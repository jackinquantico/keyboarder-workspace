package com.kh.kmanager.po.settlement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SettlementController {

	/**
	 * K-Money 잔액관리 페이지 띄우는 용도 - 채영
	 * @return
	 */
	@RequestMapping("kmoney.po")
	public String kmoneyMain() {
		return "po/poSettlement/poKmoneyMain";
	}
	
	/**
	 * K-Money 출금신청내역 페이지 - 채영
	 * @return
	 */
	@RequestMapping("kmoneyWithdraw.po")
	public String kmoneyWithdraw() {
		
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
	
	
}
