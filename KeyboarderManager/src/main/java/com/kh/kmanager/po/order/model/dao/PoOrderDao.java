package com.kh.kmanager.po.order.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.order.model.vo.PoOrder;



@Repository
public class PoOrderDao {
	
	// 구매확정 전체 조회
	public ArrayList<PoOrder> selectDecisionOrder(SqlSessionTemplate sqlSession, int sellerNo) {
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		PoOrder poOrder = new PoOrder();
		poOrder.setNowMonth(nowMonth);
		poOrder.setSellerNo(sellerNo);
//		nowMonth = "2022-09"; // 9월 더미밖에 없어서 일단 9월달로만 해놓음
//		System.out.println(nowMonth);
//		System.out.println("오니?");
		return (ArrayList)sqlSession.selectList("poorderMapper.selectDecisionOrder", poOrder);
	}
	
	// 구매확정 기간별 조회
	public ArrayList<PoOrder>  searchPoOrderDecision(SqlSessionTemplate sqlSession, PoOrder poOrder) {

		return (ArrayList)sqlSession.selectList("poorderMapper.searchPoOrderDecision", poOrder);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> optionDefault) {

		return sqlSession.selectOne("poorderMapper.selectListCount_default", optionDefault);
	}
	
	public ArrayList<PoOrder> selectAllOrderList(SqlSessionTemplate sqlSession, HashMap<String, String> optionDefault) {
		
		return (ArrayList)sqlSession.selectList("poorderMapper.selectAllOrderList", optionDefault);
	}
	
	// 구매확정내역 엑셀다운로드
	public ArrayList<PoOrder> orderDecisionList(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("poorderMapper.orderDecisionList", sellerNo);
	}
	
	
}
