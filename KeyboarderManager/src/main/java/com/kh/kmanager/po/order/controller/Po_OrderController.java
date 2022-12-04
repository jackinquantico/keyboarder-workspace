package com.kh.kmanager.po.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Po_OrderController {
	
	/**
	 * PO 전체 주문내역 조회 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : PO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("viewAllOrder.po")
	public String selectAllOrder() {
		
		return "po/poOrder/poSelectAllOrder";
	}
	
}
