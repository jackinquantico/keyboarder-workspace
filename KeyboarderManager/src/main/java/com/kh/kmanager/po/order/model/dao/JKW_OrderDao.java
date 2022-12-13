package com.kh.kmanager.po.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JKW_OrderDao {

	public int orderStatus1(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poOrderMapper.orderStatus1", selNo);
	}
	
	public int orderStatus2(SqlSessionTemplate sqlSession, int selNo) {
			
		return sqlSession.selectOne("poOrderMapper.orderStatus2", selNo);
	}
	
	public int orderStatus3(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poOrderMapper.orderStatus3", selNo);
	}
	
	public int orderStatus4(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poOrderMapper.orderStatus4", selNo);
	}
	
	public int orderCount(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poOrderMapper.orderCount", selNo);
	}
}































