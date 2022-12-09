package com.kh.keyboarder.order.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.keyboarder.member.model.vo.Member;
import com.kh.keyboarder.order.model.service.JKW_OrderService;
import com.kh.keyboarder.order.model.vo.Order;

@Controller
public class JKW_FoOrderController {
	
	@Autowired
	private JKW_OrderService JKW_OrderService;
	
	@RequestMapping("foTotalView.order")
	public String foTotalView(Model model, HttpSession session) {
		
		/*
		Member m = (Member)session.getAttribute("loginUser");
		
		int conNo = m.getConNo();
		
		ArrayList<Order> orderList = JKW_OrderService.foTotalViewList(conNo);
		
		model.addAttribute("orderList", orderList);	
		*/	
		
		return "order/foOrderTotalView";
	}
	
	@RequestMapping("foDetailView.order")
	public String foDetailView(Model model, String ordNo) {
		
		/*
		Order orderDetailList = JKW_OrderService.foDetailViewList(ordNo);
		
		model.addAttribute("orderDetailList", orderDetailList);
		*/		
		
		return "order/foOrderDetailView";
	}
}
































