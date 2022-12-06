package com.kh.kmanager.common.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.member.model.service.CWS_MemberService;
import com.kh.kmanager.member.model.vo.Member;

@Controller
public class CWS_MemberController {

	@Autowired
	private CWS_MemberService memberService;
	
	@RequestMapping("loginPage.me")
	public String loginPage() {
		
		return "../../login";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, 
								    ModelAndView mv, 
								    HttpSession session, 
								    String saveId, 
								    HttpServletResponse response) {
		
		// 아이디 저장 기능용 쿠키
		if(saveId != null && saveId.equals("y")) {
			// 요청 시 전달값 중에 saveId 가 y 라면 saveId 라는 키값으로 현재 아이디값을 쿠키 생성
			Cookie cookie = new Cookie("saveId", m.getSellerId());
			cookie.setMaxAge(24 * 60 * 60 * 1); // 유효기간 1일
			response.addCookie(cookie);
		} else {
			// 요청 시 전달값 중에 saveId 가 y	가 아니라면 쿠키 삭제(동일한 이름의 쿠키 생성)
			Cookie cookie = new Cookie("saveId",  m.getSellerId());
			cookie.setMaxAge(0); // 쿠키가 삭제되는 효과
			response.addCookie(cookie);
		}		
		
		Member loginUser = memberService.loginMember(m);
		if(loginUser == null) {
			
			mv.addObject("alertMsg", "로그인 실패");
			
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
		
		// 세션 무효화
		session.invalidate();
		
		// 다시 로그인페이지로
		return "../../login";
	}
	
	@RequestMapping("forgotId.me")
	public String forgotId(HttpSession session) {
		
		return "common/forgotId";
	}
	
	@ResponseBody
	@RequestMapping(value="findId.me")
	public String findId(String corpNo) {
		
		String sellerId = memberService.findId(corpNo);
		
		return sellerId;
	}
	
	@RequestMapping("forgotPwd.me")
	public String forgotPwd(HttpSession session) {
		
		return "common/forgotPwd";
	}
	
	@RequestMapping("initializePwdForm.me")
	public String initializePwdForm(HttpSession session, String corpNo, String sellerId) {
		
		Member user = new Member(sellerId, corpNo, "");
		
		Member seller = memberService.initializePwdForm(user);
		
		if(seller != null) {
			
			session.setAttribute("seller", seller.getSellerId());
			
			return "common/initializePwdForm";
		} else {
			return "common/initializePwdError";
		}
	}

	@RequestMapping("initializePwd.me")
	public String initializePwd(HttpSession session, Model model, String sellerId, String newPwd) {
		
		Member user = new Member(sellerId, "", newPwd);
		
		int result = memberService.initializePwd(user);
		
		if(result > 0) { // 비밀번호 변경 성공
			
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다. 변경된 비밀번호로 로그인하여 주십시오.");
			
			return "redirect:/loginPage.me";
			
		} else { // 비밀번호 변경 실패
			
			model.addAttribute("errorMsg", "회원정보 변경 실패");
			
			return "common/errorPage";
			
		}
		
		
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
