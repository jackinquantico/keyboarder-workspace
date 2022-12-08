package com.kh.kmanager.bo.settlement.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.settlement.model.vo.Settlement;

@Repository
public class CWS_SettlementDao {
	
	public ArrayList<Member> selectSeller(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boSettlement-mapper.selectSeller");
	}
	
	public ArrayList<CWS_Settlement> selectSellerCommition(SqlSessionTemplate sqlSession) {
		
				
		ArrayList<CWS_Settlement> list = (ArrayList)sqlSession.selectList("boSettlement-mapper.selectSellerCommition");
		
		for(int i = 0; i < list.size(); i++) {
			
			list.get(i).setBillPublishAmount(list.get(i).getSupplyValue() - list.get(i).getTaxAmount());
			list.get(i).setSales((int)(list.get(i).getBillPublishAmount()/1.1));
			
		}
		
		return list;
	}
	
}
