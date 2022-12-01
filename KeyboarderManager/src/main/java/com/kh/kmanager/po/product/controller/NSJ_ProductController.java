package com.kh.kmanager.po.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class NSJ_ProductController {

	//po상품 메인화면 띄워주기
	@RequestMapping("show.pro") 
	public String showProduct() {
		
		//WEB-INF/views/po/poProduct/
		
	return "po/poProduct/poProductManageMain";
	
	
	}
	//po상품 등록,수정
	@RequestMapping("update.pro")
	public String updateProduct() {
		return "po/poProduct/poProductUpdate";
	}
}
