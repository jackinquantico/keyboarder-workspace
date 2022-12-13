package com.kh.kmanager.po.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.order.model.service.PoOrderService;
import com.kh.kmanager.po.order.model.vo.PoOrder;

@Controller
public class PoOrderController {
	@Autowired
	public PoOrderService orderService;
	
	/**
	 * PO 전체 주문내역 조회 페이지 이동 처리 및 현재 월의 전체 주문내역 조회를 해주는 메소드 - 백성현
	 * @return : PO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("allOrderList.po")
	public String selectAllOrder(HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String sellerNo = Integer.toString(m.getSellerNo());
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		
		HashMap<String, String> optionDefault = new HashMap<String, String>();
		optionDefault.put("sellerNo", sellerNo);
		optionDefault.put("nowMonth", nowMonth);
		
		int listCount = orderService.selectListCount(optionDefault);
		System.out.println(listCount);
		ArrayList<PoOrder> list = orderService.selectAllOrderList(optionDefault);
		/*
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		*/
		return "po/poOrder/poSelectAllOrder";
	}
	
	/**
	 * PO주문확정내역조회페이지 - 장미
	 * @return
	 */
	@RequestMapping("decision.po")
	public String selectDecisionOrder(HttpSession session, Model model) {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		ArrayList<PoOrder> list = orderService.selectDecisionOrder(sellerNo);
		model.addAttribute("list", list);
		//System.out.println(list);
		return "po/poOrder/poOrderDecisionListView";
	}
	
	/**
	 * PO구매확정내역 기간조회 - 장미
	 */
	 @RequestMapping("searchDecision.po")
	 public String searchPoOrderDecision(HttpSession session, Model model, String searchDecisionDate) {
		 int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		 String searchDate =  searchDecisionDate+"-01";
		 PoOrder poOrder = new PoOrder();
		 poOrder.setSellerNo(sellerNo);
		 poOrder.setSearchDate(searchDate);
		 
		 ArrayList<PoOrder> list = orderService.searchPoOrderDecision(poOrder);
		 model.addAttribute("list", list);
		 return "po/poOrder/poOrderDecisionListView";
	 }
}
