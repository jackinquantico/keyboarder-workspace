package com.kh.kmanager.po.settlement.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	// 정산내역 전체조회(당월) -장미
	public ArrayList<Settlement> selectSettleTotalList(SqlSessionTemplate sqlSession, Settlement set) {
		return (ArrayList)sqlSession.selectList("settlementMapper.selectSettleTotalList", set);
	}
	
	// 정산내역 기간조회 -장미
	public ArrayList<Settlement> searchSettleList(SqlSessionTemplate sqlSession, Settlement set) {
		return (ArrayList)sqlSession.selectList("settlementMapper.searchSettleList", set);
	}
	
	// 정산내역 전체(당월)조회 엑셀다운로드 -장미
	public ArrayList<Settlement> settleExcelTotalList(SqlSessionTemplate sqlSession, Settlement set) {
		return (ArrayList)sqlSession.selectList("settlementMapper.settleExcelTotalList", set);
	}
	
	// 정산내역 기간조회 엑셀다운로드 -장미
	public ArrayList<Settlement> searchSettleExcelList(SqlSessionTemplate sqlSession, Settlement set) {
		return (ArrayList)sqlSession.selectList("settlementMapper.searchSettleExcelList", set);
	}
	
	public Settlement selectCommissionList(SqlSessionTemplate sqlSession, HashMap<String, String> optionDefault) {
		return sqlSession.selectOne("settlementMapper.selectCommissionList", optionDefault);
	}
	
	public ArrayList<Settlement> selectCommissionList_Option(SqlSessionTemplate sqlSession, HashMap<String, String> option) {
		return (ArrayList)sqlSession.selectList("settlementMapper.selectCommissionList_Option", option);
	}
	
	public ArrayList<Settlement> selectElectronicList(SqlSessionTemplate sqlSession, int selNo) {
		
		return (ArrayList)sqlSession.selectList("settlementMapper.selectElectronicList", selNo);
	}
	
	public Settlement sellerBillModal(SqlSessionTemplate sqlSession, Settlement modalRequest) {
		
		Settlement result = sqlSession.selectOne("settlementMapper.sellerBillModal", modalRequest);

		return result;
	}

	public ArrayList<PoOrder> excelDownloadSettlementDetail(SqlSessionTemplate sqlSession, PoOrder o) {
		return (ArrayList)sqlSession.selectList("poorderMapper.excelDownloadSettlementDetail", o);
	}

}
