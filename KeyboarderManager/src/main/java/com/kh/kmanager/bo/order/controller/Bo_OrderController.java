package com.kh.kmanager.bo.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Bo_OrderController {

	/**
	 * BO 전체 주문내역 조회 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("ViewAllOrder.bo")
	public String selectAllOrder() {
		
		return "bo/boOrder/boSelectAllOrder";
	}
}
