package com.kh.kmanager.po.product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class NSJ_ProductController {

	//po��ǰ ����ȭ�� ����ֱ�
	@RequestMapping("show.pro") 
	public String showProduct() {
		
		//WEB-INF/views/po/poProduct/
		
	return "po/poProduct/poProductManageMain";
	
	
	}
	//po��ǰ ���,����
	@RequestMapping("update.pro")
	public String updateProduct() {
		return "po/poProduct/poProductUpdate";
	}
}
