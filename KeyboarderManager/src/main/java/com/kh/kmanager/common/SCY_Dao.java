package com.kh.kmanager.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.common.model.vo.PGData;

@Repository
public class SCY_Dao {

	public int insertOrder(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertOrder", pgd);
	}

	public int insertPayment(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertPayment", pgd);
	}

	public int insertSettlement(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.insert("pgdMapper.insertSettlement", pgd);
	}

	public int selectRefundAmount(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.selectOne("pgdMapper.selectRefundAmount", pgd);
	}

	public int refundOrder(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.update("pgdMapper.refundOrder", pgd);
	}

	public int refundPayment(SqlSessionTemplate sqlSession, PGData pgd) {
		return sqlSession.update("pgdMapper.refundPayment", pgd);
	}

}
