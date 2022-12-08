package com.kh.kmanager.bo.settlement.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.settlement.model.service.CWS_SettlementService;
import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;

@Controller
public class CWS_SettlementController {

	@Autowired
	private CWS_SettlementService settlementService;
	
	@RequestMapping("commitionSales.bo")
	public String commitionSalesPage(HttpSession session) {
		
		ArrayList sellerList = settlementService.selectSeller();
		int sellers = sellerList.size();
		ArrayList <CWS_Settlement> list = settlementService.selectSellerCommition();		
		
		
		session.setAttribute("sellers", sellers);
		session.setAttribute("sellerList", sellerList);
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
}
