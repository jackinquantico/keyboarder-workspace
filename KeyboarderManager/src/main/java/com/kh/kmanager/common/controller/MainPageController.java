package com.kh.kmanager.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageController {

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
}
