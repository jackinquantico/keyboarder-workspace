package com.kh.keyboarder.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.keyboarder.member.model.vo.Member;

@Repository
public class JM_MemberDao {
	
	// 로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	// 회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	// 아이디 중복체크
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	// 회원가입시 이메일인증 
	public int updateMailKey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMailKey", m);
	}
	public  int updateMailAuth(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMailAuth", m);
	}
	public  int emailAuthFail(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.emailAuthFail", id);
	}
	
}
