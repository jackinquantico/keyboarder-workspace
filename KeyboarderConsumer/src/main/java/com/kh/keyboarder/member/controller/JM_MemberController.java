package com.kh.keyboarder.member.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.keyboarder.member.model.service.JM_MemberService;
import com.kh.keyboarder.member.model.vo.Member;

@Controller
public class JM_MemberController {
	@Autowired
	private JM_MemberService memberService;

	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session, String saveId, HttpServletResponse response) {
		Member loginUser = memberService.loginMember(m);
		if(loginUser == null) {
			mv.addObject("errorMsg", "로그인에 실패하였습니다.");
		} else {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("termsForm.me")
	public String termsForm() {
		return "member/memberTermsForm";
	}
	
	@RequestMapping("enroll.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m , Model model, HttpSession session) {
		//System.out.println(m.getAddress());
		//System.out.println(m.getConEmail());
		int result = memberService.insertMember(m);
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입에 성공하였습니다. 이메일 인증 후 로그인 해주세요.");
			
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg", "회원가입에 실패했습니다.");
			return "redirect:/";
		}
	}
	
	//아이디중복체크
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		return(count>0)? "NNNNN" : "NNNNY";
	}
}
