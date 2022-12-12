package com.kh.keyboarder.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.keyboarder.order.model.vo.Order;

@Repository
public class JKW_OrderDao {

	public ArrayList<Order> foTotalViewList(SqlSessionTemplate sqlSession, int conNo){
		
		return (ArrayList)sqlSession.selectList("orderMapper.foTotalViewList", conNo);
	}
	
	public ArrayList<Order> foSearchDate(SqlSessionTemplate sqlSession, Order order){
		
		return (ArrayList)sqlSession.selectList("orderMapper.foSearchDate", order);
	}
	
	public Order foDetailViewList(SqlSessionTemplate sqlSession, String ordNo) {
		
		return sqlSession.selectOne("orderMapper.foDetailViewList", ordNo);
	}
}
