package com.kh.kmanager.common.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;

@Repository
public class InquiryDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) { 
		return sqlSession.selectOne("inquiryMapper.selectListCount");
	}
	
	public ArrayList<Inquiry> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectList", null, rowBounds);
	}
	
	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) { 
		return sqlSession.insert("inquiryMapper.insertInquiry", i);
	}

	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, int inquiryNo) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", inquiryNo);
	}
	
	public ArrayList<Inquiry> selectReplyList(SqlSessionTemplate sqlSession, int inquiryNo) {
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectReplyList", inquiryNo);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Inquiry r) {
		return sqlSession.insert("inquiryMapper.insertReply", r);
	}
}
