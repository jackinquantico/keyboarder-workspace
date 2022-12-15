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

import com.google.gson.Gson;
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
		
		ArrayList<Order> list = orderService.selectAllOrderList(nowMonth);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "bo/boOrder/boSelectAllOrder";
	}
	
	/**
	 * BO 전체 주문내역 조회 페이지의 검색옵션으로 검색해주는 메소드 - 백성현
	 * @return : ajax 데이터
	 */
	@ResponseBody
	@RequestMapping(value="option_date.bo", produces="application/json; charset=UTF-8")
	public String selectOrder_Option(String currentDate, String endDate, String search_orderNo, Model model) {
		
		HashMap<String, String> option = new HashMap<String, String>();
		option.put("currentDate", currentDate);
		option.put("endDate", endDate);
		option.put("orderNo", search_orderNo);
		
		int listCount = orderService.selectListCount(option);
		
		ArrayList<Order> list = orderService.selectOrderList(option);
		
		model.addAttribute("listCount", listCount);
		return new Gson().toJson(list);
	}
}
