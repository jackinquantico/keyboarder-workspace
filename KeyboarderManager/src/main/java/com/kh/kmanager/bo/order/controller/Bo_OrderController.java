package com.kh.kmanager.bo.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.order.model.service.OrderServiceImpl;

@Controller
public class Bo_OrderController {
	
	@Autowired
	public OrderServiceImpl orderService;

	/**
	 * BO 전체 주문내역 조회 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("allOrderList.bo")
	public String selectAllOrder(Model model) {
		
		int listCount = orderService.selectListCount();
		
		model.addAttribute("listCount", listCount);
		
		return "bo/boOrder/boSelectAllOrder";
	}
}
