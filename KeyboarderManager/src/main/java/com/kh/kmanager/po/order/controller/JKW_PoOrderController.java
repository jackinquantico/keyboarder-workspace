package com.kh.kmanager.po.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.order.model.service.JKW_OrderService;
import com.kh.kmanager.po.order.model.vo.Order;

@Controller
public class JKW_PoOrderController {

	@Autowired
	private JKW_OrderService JKW_OrderService;
	
	@RequestMapping("delivery.poOrder")
	public String deliveryMain(Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int selNo = m.getSellerNo();
		
		int status1 = JKW_OrderService.orderStatus1(selNo);
		
		int status2 = JKW_OrderService.orderStatus2(selNo);
		
		int status3 = JKW_OrderService.orderStatus3(selNo);
		
		int status4 = JKW_OrderService.orderStatus4(selNo);
		
		int orderCount = JKW_OrderService.orderCount(selNo);
		
		// ArrayList<Order> ordList = JKW_OrderService.orderList(selNo);
		
		model.addAttribute("status1", status1);
		model.addAttribute("status2", status2);
		model.addAttribute("status3", status3);
		model.addAttribute("status4", status4);
		model.addAttribute("orderCount", orderCount);
		
		return "po/poOrder/poOrderDeliveryMain";
	}
	
	@RequestMapping("electronicTaxInvoice.poOrder")
	public String electronicTaxInvoice() {
		
		return "po/poSettlement/poElectronicTaxInvoice";
	}
	
}
