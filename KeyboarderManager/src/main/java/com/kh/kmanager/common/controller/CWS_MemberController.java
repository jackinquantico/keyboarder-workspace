package com.kh.kmanager.common.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.member.model.service.CWS_MemberService;
import com.kh.kmanager.member.model.vo.Member;

@Controller
public class CWS_MemberController {

	@Autowired
	private CWS_MemberService memberService;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, 
								    ModelAndView mv, 
								    HttpSession session, 
								    String saveId, 
								    HttpServletResponse response) {
		Member loginUser = memberService.loginMember(m);
		if(loginUser == null) {
			
			// 도대체 에러메세지 왜 안뜨는지 모르겠네..일단 패스
			mv.addObject("errorMsg", "로그인 실패");
			
			mv.setViewName("common/loginError");
			
		} else {
			
			mv.addObject("alertMsg", "로그인 성공");
			
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getSellerId().equals("admin")) {
				mv.setViewName("common/bomain");
			} else {
				mv.setViewName("common/pomain");
			}
			
		}
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("enroll.me")
	public String enrollForm() {
		return "member/memberEnrollForm1";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m , Model model, HttpSession session) {
	
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
