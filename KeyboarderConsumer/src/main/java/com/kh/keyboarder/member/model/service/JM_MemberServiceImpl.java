package com.kh.keyboarder.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.keyboarder.member.model.dao.JM_MemberDao;
import com.kh.keyboarder.member.model.vo.JM_Member;

@Service
public class JM_MemberServiceImpl  implements JM_MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JM_MemberDao memberDao;

	@Override
	public JM_Member loginMember(JM_Member m) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMember(JM_Member m) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int idCheck(String ckeckId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
