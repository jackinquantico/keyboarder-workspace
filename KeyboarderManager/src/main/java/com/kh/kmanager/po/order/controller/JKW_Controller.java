package com.kh.kmanager.po.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JKW_Controller {

	@RequestMapping("delivery.poOrder")
	public String deliveryMain() {
		
		return "po/poOrder/poOrderDeliveryMain";
	}
	
}
