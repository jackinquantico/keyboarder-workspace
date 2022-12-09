package com.kh.kmanager.bo.order.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.order.model.vo.Order;

@Repository
public class OrderDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		
		return sqlSession.selectOne("orderMapper.selectListCount", nowMonth);
	}
	
	public ArrayList<Order> selectAllOrderList(SqlSessionTemplate sqlSession) {
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAllOrderList", nowMonth);
	}
	
}
