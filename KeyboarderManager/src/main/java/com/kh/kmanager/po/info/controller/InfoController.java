package com.kh.kmanager.po.info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.po.info.model.service.InfoService;

@Controller
public class InfoController {

	@Autowired
	private InfoService infoService;
	
	@RequestMapping("updateInfoPage.po")
	public String updateInfoPage(HttpSession session) {
		
		return "po/poInfo/poInfoUpdate";
		
	}
	
}
