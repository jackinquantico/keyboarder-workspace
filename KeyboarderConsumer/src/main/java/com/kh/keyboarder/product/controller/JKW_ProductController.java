package com.kh.keyboarder.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.common.template.Pagination;
import com.kh.keyboarder.product.model.service.JKW_ProductService;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

@Controller
public class JKW_ProductController {
	
	@Autowired
	private JKW_ProductService JKW_ProductService;

	@RequestMapping("foProductNotice.pro")
	public String foProductNotice(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = JKW_ProductService.selectListCount();
		
		int pageLimit = 8;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Product> proList = JKW_ProductService.selectList(pi);
					
		// PO 판매자 쿠폰 전체 조회
		// ArrayList<JKW_Coupon> stoCouList = JKW_ProductService.stoCouponList();
		
		// BO 관리자 쿠폰 전체 조회
		ArrayList<JKW_Coupon> keyCouList = JKW_ProductService.keyCouponList();
		
		// System.out.println("sto : " + stoCouList);
		System.out.println("key : " + keyCouList);
		System.out.println("pi : " + pi);
		System.out.println("proList : " + proList);

		model.addAttribute("pi", pi);
		model.addAttribute("proList", proList);
		// model.addAttribute("stoCouList", stoCouList);
		model.addAttribute("keyCouList", keyCouList);
		
		return "product/foProductNotice";
	}
}




































