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
}
