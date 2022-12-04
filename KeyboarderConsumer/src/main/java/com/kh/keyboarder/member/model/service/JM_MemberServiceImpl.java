package com.kh.keyboarder.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.keyboarder.member.model.dao.JM_MemberDao;
import com.kh.keyboarder.member.model.vo.Member;

@Service
public class JM_MemberServiceImpl  implements JM_MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JM_MemberDao memberDao;

	@Override
	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}

}
