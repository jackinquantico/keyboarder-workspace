package com.kh.kmanager.bo.order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		int listCount = orderService.selectListCount(nowMonth);
		
		ArrayList<Order> list = orderService.selectAllOrderList();
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "bo/boOrder/boSelectAllOrder";
	}
	
	@ResponseBody
	@RequestMapping(value="option_date.bo")
	public void selectOrder_Option(String currentDate, String endDate) {
		
		HashMap<String, String> optionDate = new HashMap<String, String>();
		optionDate.put("currentDate", currentDate);
		optionDate.put("endDate", endDate);
		
		int listCount = orderService.selectListCount(optionDate);
		
		System.out.println(listCount);
	}
}
