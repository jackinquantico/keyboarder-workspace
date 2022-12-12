package com.kh.kmanager.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.common.model.service.PoMainPageService;
import com.kh.kmanager.common.model.vo.PoMainData;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.settlement.model.vo.Settlement;

@Controller
public class MainPageController {

	@Autowired
	private PoMainPageService mainPageService;
	
	/**
	 * po 메인으로 이동
	 */
	@RequestMapping("pomain")
	public String poMain() {
		
		return "common/pomain";
	}
	
	/**
	 * bo 메인으로 이동
	 */
	@RequestMapping("bomain")
	public String boMain() {
		
		return "common/bomain";
	}
	
	/**
	 * 로그인 페이지로 이동
	 */
	@RequestMapping("loginForm")
	public String loginForm() {
		
		return "/common/login";
	}
	
	@ResponseBody
	@RequestMapping(value="mainOrder.po", produces="application/json; charset=UTF-8")
	public String mainOrderSummary(HttpSession session) {
		
		// 해당 로그인 유저의 정산 내역 조회
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		PoMainData pmd = mainPageService.mainOrderSummary(sellerNo);
		
		return new Gson().toJson(pmd);		
	}
	
	@ResponseBody
	@RequestMapping(value="mainPayment.po", produces="application/json; charset=UTF-8")
	public String mainPaymentSummary(HttpSession session) {
		
		// 해당 로그인 유저의 정산 내역 조회
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		PoMainData pmd = mainPageService.mainPaymentSummary(sellerNo);
		
		return new Gson().toJson(pmd);		
	}
	
}
