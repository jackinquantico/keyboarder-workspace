package com.kh.kmanager.po.settlement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.order.model.vo.Order;
import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Repository
public class PoSettlementDao {


	public int insertWithdraw(SqlSessionTemplate sqlSession, Withdraw w) {
		return sqlSession.insert("settlementMapper.insertWithdraw", w);
	}

	public ArrayList<Withdraw> selectWithdrawRequestList(SqlSessionTemplate sqlSession, Withdraw w) {
		return (ArrayList)sqlSession.selectList("settlementMapper.selectWithdrawRequestList", w);
	}

	public Settlement selectKmoneySettlement(SqlSessionTemplate sqlSession, int sellerNo) {
		return sqlSession.selectOne("settlementMapper.selectKmoneySettlement", sellerNo);
	}

	public ArrayList<Settlement>selectSettleDetailList(SqlSessionTemplate sqlSession, PoOrder o) {
		return (ArrayList)sqlSession.selectList("poorderMapper.selectSettleDetailList", o);
	}

	public ArrayList<Settlement>selectSettleSumList(SqlSessionTemplate sqlSession,PoOrder o) {
		return (ArrayList)sqlSession.selectList("poorderMapper.selectSettleSumList", o);
	}
	
	public ArrayList<Settlement> selectSettleTotalList(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("settlementMapper.selectSettleTotalList", sellerNo);
	}

}
