package com.kh.kmanager.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.member.model.dao.CWS_MemberDao;
import com.kh.kmanager.member.model.vo.Member;

@Service
public class CWS_MemberServiceImpl implements CWS_MemberService  {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CWS_MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {
		Member loginUser = memberDao.loginMember(sqlSession, m);
		return loginUser;
	}

	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String checkId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String findId(String corpNo) {
		String sellerId = memberDao.findId(sqlSession, corpNo);
		return sellerId;
	}

	@Override
	public Member initializePwdForm(Member user) {
		Member seller = memberDao.initializePwdForm(sqlSession, user);
		return seller;
	}

	@Override
	public int initializePwd(Member user) {
		int result = memberDao.initializePwd(sqlSession, user);
		return result;
	}

	
	
}
