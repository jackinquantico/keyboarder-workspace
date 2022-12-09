package com.kh.kmanager.bo.settlement.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.settlement.model.service.CWS_SettlementService;
import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;

@Controller
public class CWS_SettlementController {

	@Autowired
	private CWS_SettlementService settlementService;
	
	@RequestMapping("commitionSales.bo")
	public String commitionSalesPage(HttpSession session) {
		
		ArrayList <Member> sellerList = settlementService.selectSeller();
		ArrayList <CWS_Settlement> list = settlementService.selectSellerCommition();		
		

		session.setAttribute("sellerList", sellerList);
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@RequestMapping("searchSettlement.bo")
	public String searchBoSettlement(HttpSession session, String seller, String searchSettlementDate) {
		
		
		
		// CWS_Settlement searchCondition = new CWS_Settlement(seller, searchSettlementDate);
		
		//ArrayList <CWS_Settlement> list = settlementService.searchSellerCommition(seller, searchSettlementDate);
		
		//session.setAttribute("list", list);
		
		return "redirect:/";
	}
}
