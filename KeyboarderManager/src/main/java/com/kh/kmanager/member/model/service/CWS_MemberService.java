package com.kh.kmanager.member.model.service;

import com.kh.kmanager.member.model.vo.Member;

public interface CWS_MemberService {
	
	// 로그인
	Member loginMember(Member m);
	
	// 회원가입
	int insertMember(Member m);
	
	// 아이디 중복체크
	int idCheck(String checkId);
}
