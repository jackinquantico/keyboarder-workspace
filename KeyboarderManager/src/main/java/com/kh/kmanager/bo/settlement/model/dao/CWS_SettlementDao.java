package com.kh.kmanager.bo.settlement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;

@Repository
public class CWS_SettlementDao {
	
	public ArrayList<Member> selectSeller(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boSettlement-mapper.selectSeller");
	}
	
	public ArrayList<CWS_Settlement> selectSellerCommition(SqlSessionTemplate sqlSession) {
		
				
		ArrayList<CWS_Settlement> list = (ArrayList)sqlSession.selectList("boSettlement-mapper.selectSellerCommition");
		
		for(int i = 0; i < list.size(); i++) {
			
			list.get(i).setRealPayPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
			list.get(i).setBillPublishAmount(list.get(i).getSupplyValue() - list.get(i).getTaxAmount());
			list.get(i).setSales((int)(list.get(i).getBillPublishAmount()/1.1));
			
		}
		
		return list;
	}
	
	public ArrayList<CWS_Settlement> searchSellerCommition(SqlSessionTemplate sqlSession, CWS_Settlement searchCondition) {
		
		 ArrayList<CWS_Settlement> list = (ArrayList)sqlSession.selectList("boSettlement-mapper.searchSellerCommition", searchCondition);
		
		for(int i = 0; i < list.size(); i++) {
			
			list.get(i).setRealPayPrice(list.get(i).getOrderPrice() - list.get(i).getScouponPrice() - list.get(i).getKcouponPrice());
			list.get(i).setBillPublishAmount(list.get(i).getSupplyValue() - list.get(i).getTaxAmount());
			list.get(i).setSales((int)(list.get(i).getBillPublishAmount()/1.1));
			
		}	
		
		return list;
		
	}
	
	public CWS_Settlement sellerBillModal(SqlSessionTemplate sqlSession, CWS_Settlement modalRequest) {
		
		CWS_Settlement result = sqlSession.selectOne("boSettlement-mapper.sellerBillModal", modalRequest);
		
		result.setBillPublishAmount(result.getSupplyValue() - result.getTaxAmount());
		result.setSales((int)(result.getBillPublishAmount()/1.1));
		
		return result;
	}
	
	public ArrayList<CWS_Settlement> selectStoreSettlement(SqlSessionTemplate sqlSession) {
		
		 ArrayList<CWS_Settlement> list = (ArrayList)sqlSession.selectList("boSettlement-mapper.selectStoreSettlement");
		 
		 return list;
	}
	
	public ArrayList<CWS_Settlement> searchStoreSettlement(SqlSessionTemplate sqlSession, CWS_Settlement searchCondition) {
		
		 ArrayList<CWS_Settlement> list = (ArrayList)sqlSession.selectList("boSettlement-mapper.searchStoreSettlement", searchCondition);
		 
		 return list;
	}
	
}
