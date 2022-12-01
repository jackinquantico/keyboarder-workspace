package com.kh.kmanager.po.settlement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SCY_SettlementController {
	
	@RequestMapping("kmoney.po")
	public String kmoneyMain() {
		return "po/poSettlement/poKmoneyMain";
	}
}
