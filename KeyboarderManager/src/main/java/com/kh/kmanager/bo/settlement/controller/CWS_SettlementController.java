package com.kh.kmanager.bo.settlement.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
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
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
		};		
		
		String[] sellerListValues = new String[sellerList.size()];

		
		session.setAttribute("sellerList", sellerList);
		
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@RequestMapping("searchSettlement.bo")
	public String searchBoSettlement(HttpSession session, String seller, String searchSettlementDate) {

		String searchDate = searchSettlementDate + "-01";
		
		CWS_Settlement searchCondition = new CWS_Settlement(seller, searchDate);
		
		ArrayList <CWS_Settlement> list = settlementService.searchSellerCommition(searchCondition);
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
		};
		
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
}
