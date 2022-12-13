package com.kh.kmanager.bo.settlement.controller;

import java.util.ArrayList;

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

		System.out.println(list);
		
		session.setAttribute("sellerList", sellerList);
		
		session.setAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@RequestMapping("searchSettlement.bo")
	public String searchBoSettlement(HttpSession session, Model model, String seller, String searchSettlementDate) {

		String searchDate = searchSettlementDate + "-01";
		
		CWS_Settlement searchCondition = new CWS_Settlement(seller, searchDate);
		
		ArrayList <CWS_Settlement> list = settlementService.searchSellerCommition(searchCondition);
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setSettleDate(list.get(i).getSettleDate().substring(0, 10));
		};
		
		model.addAttribute("list", list);
		
		return "bo/boSettlement/commitionSales";
	}
	
	@ResponseBody
	@RequestMapping(value="sellerBillModal.bo")
	public CWS_Settlement sellerBillModal(HttpSession session, String modalOrderNo) {
		
		CWS_Settlement result = settlementService.sellerBillModal(modalOrderNo);
		
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
