package com.kh.kmanager.bo.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.order.model.service.OrderService;
import com.kh.kmanager.bo.order.model.vo.Order;

@Controller
public class Bo_OrderController {
	
	@Autowired
	public OrderService orderService;

	/**
	 * BO 전체 주문내역 조회 페이지 이동 처리 및 현재 월의 전체 주문내역 조회를 해주는 메소드 - 백성현
	 * @return : BO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("allOrderList.bo")
	public String selectAllOrder(Model model) {
		
		int listCount = orderService.selectListCount();
		
		ArrayList<Order> list = orderService.selectAllOrderList();
		
		System.out.println(list);
		
		
		
		
		model.addAttribute("listCount", listCount);
		
		return "bo/boOrder/boSelectAllOrder";
	}
}
