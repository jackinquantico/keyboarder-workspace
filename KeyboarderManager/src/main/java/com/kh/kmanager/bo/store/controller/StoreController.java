package com.kh.kmanager.bo.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	/**
	 * 입점업체관리 메인 페이지 띄우는 용도 - 채영
	 * @return
	 */
	@RequestMapping("store.bo")
	public String storeMain() {
		
		return "bo/boStore/boStoreMain";
	}
	
	/**
	 * 입점업체 상세 페이지 띄우는 용도 - 채영
	 * @return
	 */
	@RequestMapping("storeDetail.bo")
	public String storeDetail() {
		
		return "bo/boStore/boStoreDetail";
	}
	
}
