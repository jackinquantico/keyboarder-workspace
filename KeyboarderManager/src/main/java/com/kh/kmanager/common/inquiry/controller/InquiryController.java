package com.kh.kmanager.common.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.kmanager.common.inquiry.model.service.InquiryService;
import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;
import com.kh.kmanager.common.template.Pagination;
import com.kh.kmanager.member.model.vo.Member;

@Controller
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
		return "inquiry/inquiryListView";
	}
	
	@RequestMapping("enrollForm.iq")
	public String enrollForm() {
		return "inquiry/inquiryEnrollForm";
	}
	
	@RequestMapping("insert.iq")
	public ModelAndView insertInquiry(Inquiry i , HttpSession session, ModelAndView mv) {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		i.setSellerNo(sellerNo);
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
		Inquiry i = inquiryService.selectInquiry(ino);
		mv.addObject("i", i).setViewName("inquiry/inquiryDetailView");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.iq", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int ino) {
		ArrayList<Inquiry> list = inquiryService.selectReplyList(ino);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="rinsert.iq", produces="text/html; charset=UTF-8")
	public String ajaxInsertReply(Inquiry r) {
		int result = inquiryService.insertReply(r);
		return (result>0) ?  "success" : "fail";
	}
	
}
