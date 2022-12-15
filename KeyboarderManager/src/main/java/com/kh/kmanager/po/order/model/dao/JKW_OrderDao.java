package com.kh.kmanager.po.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.order.model.vo.PoOrder;

@Repository
public class JKW_OrderDao {

	public int orderStatus1(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderStatus1", selNo);
	}
	
	public int orderStatus2(SqlSessionTemplate sqlSession, int selNo) {
			
		return sqlSession.selectOne("poorderMapper.orderStatus2", selNo);
	}
	
	public int orderStatus3(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderStatus3", selNo);
	}
	
	public int orderStatus4(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderStatus4", selNo);
	}
	
	public int orderCount(SqlSessionTemplate sqlSession, int selNo) {
		
		return sqlSession.selectOne("poorderMapper.orderCount", selNo);
	}
	
	public ArrayList<PoOrder> orderList(SqlSessionTemplate sqlSession, int selNo){
		
		return (ArrayList)sqlSession.selectList("poorderMapper.orderList", selNo);
	}

	public ArrayList<PoOrder> deliverySearchDate(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return (ArrayList)sqlSession.selectList("poorderMapper.deliverySearchDate", poOrder);
	}

	public int dateOrderStatus1(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus1", poOrder);
	}

	public int dateOrderStatus2(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus2", poOrder);
	}

	public int dateOrderStatus3(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus3", poOrder);
	}

	public int dateOrderStatus4(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderStatus4", poOrder);
	}

	public int dateOrderCount(SqlSessionTemplate sqlSession, PoOrder poOrder) {
		
		return sqlSession.selectOne("poorderMapper.dateOrderCount", poOrder);
	}
	
	
}































