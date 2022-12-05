package com.kh.keyboarder.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.keyboarder.order.model.service.JKW_OrderService;

@Controller
public class JKW_FoOrderController {
	
	@Autowired
	private JKW_OrderService JKW_OrderService;

	
	
	@RequestMapping("foTotalView.order")
	public String foTotalView() {
		
		return "order/foOrderTotalView";
	}
	
	@RequestMapping("foDetailView.order")
	public String foDetailView() {
		
		return "order/foOrderDetailView";
	}
}
