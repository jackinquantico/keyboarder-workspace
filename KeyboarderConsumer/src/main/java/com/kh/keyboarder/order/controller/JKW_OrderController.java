package com.kh.keyboarder.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JKW_OrderController {

	@RequestMapping("foTotalView.order")
	public String foTotalView() {
		
		return "order/foOrderTotalView";
	}
	
	@RequestMapping("foDetailView.order")
	public String foDetailView() {
		
		return "order/foOrderDetailView";
	}
}
