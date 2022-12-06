package com.kh.kmanager.common.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.common.inquiry.model.service.InquiryService;
import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;
import com.kh.kmanager.common.template.Pagination;

public class InquiryController {
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping("list.iq")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int listCount = inquiryService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Inquiry> list = inquiryService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "inquiry/poinquiryEnroll";
	}
	
	@RequestMapping("insert.iq")
	public ModelAndView insertInquiry(Inquiry i , HttpSession session, ModelAndView mv) {
		int result = inquiryService.insertInquiry(i);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 문의사항이 등록되었습니다.");
			mv.setViewName("redirect:/list.iq");
		} else {
			mv.addObject("errorMsg", "문의사항 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("detail.iq")
	public ModelAndView selectInquiry(int ino, ModelAndView mv) {
		int result = inquiryService.increaseCount(ino);
		if(result>0) {
			Inquiry i = inquiryService.selectInquiry(ino);
			mv.addObject("i", i).setViewName("inquiry/poInquiryDetailView");
		} else {
			mv.addObject("errorMsg", "게시글 상세조회에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
}
