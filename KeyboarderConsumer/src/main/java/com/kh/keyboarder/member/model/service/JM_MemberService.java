package com.kh.keyboarder.member.model.service;

import com.kh.keyboarder.member.model.vo.Member;

public interface JM_MemberService {
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입
	int insertMember(Member m);
	
	// 아이디 중복체크
	int idCheck(String ckeckId);
}
