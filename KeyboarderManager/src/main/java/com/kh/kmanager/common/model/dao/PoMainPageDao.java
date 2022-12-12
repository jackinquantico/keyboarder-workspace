package com.kh.kmanager.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.common.model.vo.PoMainData;

@Repository
public class PoMainPageDao {

	public PoMainData mainOrderSummary(SqlSessionTemplate sqlSession, int sellerNo) {
		return sqlSession.selectOne("mainPageMapper.mainOrderSummary", sellerNo);
	}

	public PoMainData mainPaymentSummary(SqlSessionTemplate sqlSession, int sellerNo) {
		return sqlSession.selectOne("mainPageMapper.mainPaymentSummary", sellerNo);
	}

}
