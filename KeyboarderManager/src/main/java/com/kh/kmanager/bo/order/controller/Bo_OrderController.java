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
	@RequestMapping(value="optionSearch.bo", produces="application/json; charset=UTF-8")
	public String selectOrder_Option(String currentDate, String endDate, String search_orderNo, String search_keyword, String keywordType) {
		
		HashMap<String, String> option = new HashMap<String, String>();
		option.put("currentDate", currentDate);
		option.put("endDate", endDate);
		option.put("orderNo", search_orderNo);
		option.put("keyword", search_keyword);
		option.put("keywordType", keywordType);
		
		ArrayList<Order> list = orderService.selectOrderList(option);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * BO 전체 주문내역 조회 페이지의 주문내역들 중 선택한 내역들 엑셀다운로드 메소드 - 백성현
	 * @param orderList
	 */
	@RequestMapping("excelDownload_OrderList.bo")
	public void excelDown_OrderList(Object orderList) {
		
		System.out.println(orderList);
	}
}
