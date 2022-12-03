package com.kh.keyboarder.member.model.service;

import com.kh.keyboarder.member.model.vo.JM_Member;

public interface JM_MemberService {
	// 로그인
	JM_Member loginMember(JM_Member m);
	
	// 회원가입
	int insertMember(JM_Member m);
	
	// 아이디 중복체크
	int idCheck(String ckeckId);
}
