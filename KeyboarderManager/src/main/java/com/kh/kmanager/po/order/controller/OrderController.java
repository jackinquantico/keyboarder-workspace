package com.kh.kmanager.po.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("ViewAllOrder.po")
	public String selectAllOrder() {
		
		return "po/poOrder/poSelectAllOrder";
	}

}
