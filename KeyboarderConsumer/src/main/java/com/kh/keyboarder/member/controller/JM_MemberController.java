package com.kh.keyboarder.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.keyboarder.member.model.service.JM_MemberService;

@Controller
public class JM_MemberController {
	@Autowired
	private JM_MemberService memberService;

	@RequestMapping("termsForm.me")
	public String termsForm() {
		return "member/memberTermsForm";
	}
	
	@RequestMapping("enroll.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	//아이디중복체크
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return(count>0)? "NNNNN" : "NNNNY";
	}
}
