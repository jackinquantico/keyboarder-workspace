package com.kh.keyboarder.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.keyboarder.member.model.service.JM_MemberService;

@Controller
public class JM_MemberController {
	@Autowired
	private JM_MemberService memberService;

	@RequestMapping("termsForm.me")
	public String termsForm() {
		return "member/memberTermsForm";
	}
}
