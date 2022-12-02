package com.kh.kmanager.bo.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.store.model.service.StoreService;
import com.kh.kmanager.bo.store.model.vo.Store;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;
	
	/**
	 * 입점업체관리 메인 페이지 띄우는 용도 - 채영
	 * @return : 입점업체 관리 페이지
	 */
	@RequestMapping("store.bo")
	public String storeMain(Model model) {
		
		ArrayList<Store> list = storeService.selectStoreList();
		
		model.addAttribute("list", list);
		
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
	
	@RequestMapping("identify.bo")
	public String idenfityStore(Store s, HttpSession session) {
		
		int result = storeService.identifyStore(s);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "승인 성공");
		} else {
			session.setAttribute("alertMsg", "승인 실패");
		}
		
		return "redirect:/store.bo";
	}
}
