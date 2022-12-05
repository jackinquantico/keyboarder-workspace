package com.kh.kmanager.po.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JKW_PoOrderController {

	@RequestMapping("delivery.poOrder")
	public String deliveryMain() {
		
		return "po/poOrder/poOrderDeliveryMain";
	}
	
	@RequestMapping("electronicTaxInvoice.poOrder")
	public String electronicTaxInvoice() {
		
		return "po/poSettlement/poElectronicTaxInvoice";
	}
	
}
