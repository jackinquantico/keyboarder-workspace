package com.kh.kmanager.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.common.model.vo.Notice;

@Repository
public class NoticeDao {

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	
}
