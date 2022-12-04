package com.kh.kmanager.bo.settlement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Repository
public class SettlementDao {

	public int insertWithdraw(SqlSessionTemplate sqlSession, Withdraw w) {
		return sqlSession.insert("settlementMapper.insertWithdraw", w);
	}

	public ArrayList<Withdraw> selectWithdrawRequestList(SqlSessionTemplate sqlSession, Withdraw w) {
		return (ArrayList)sqlSession.selectList("settlementMapper.selectWithdrawRequestList", w);
	}

}
