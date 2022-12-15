package com.kh.kmanager.po.settlement.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
	
	public ArrayList<Settlement> selectElectronicList(SqlSessionTemplate sqlSession, int selNo) {
		
		return (ArrayList)sqlSession.selectList("settlementMapper.selectElectronicList", selNo);
	}
	
	// 정산내역 전체조회(해당월) -장미
	public ArrayList<Settlement> selectSettleTotalList(SqlSessionTemplate sqlSession, Settlement set) {
		return (ArrayList)sqlSession.selectList("settlementMapper.selectSettleTotalList", set);
	}
	
	// 정산내역 기간조회 -장미
	public ArrayList<Settlement> searchSettleList(SqlSessionTemplate sqlSession, Settlement set) {
		return (ArrayList)sqlSession.selectList("settlementMapper.searchSettleList", set);
	}

}
