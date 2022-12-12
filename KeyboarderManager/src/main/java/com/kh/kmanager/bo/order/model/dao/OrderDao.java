package com.kh.kmanager.bo.order.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.order.model.vo.Order;

@Repository
public class OrderDao {

	public int selectListCount(SqlSessionTemplate sqlSession, String nowMonth) {
		
		return sqlSession.selectOne("orderMapper.selectListCount_default", nowMonth);
	}
	
	public ArrayList<Order> selectAllOrderList(SqlSessionTemplate sqlSession) {
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		
		return (ArrayList)sqlSession.selectList("orderMapper.selectAllOrderList", nowMonth);
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession, HashMap<String, String> optionDate) {
		
		//System.out.println(optionDate.get("currentDate"));
		//System.out.println(optionDate.get("endDate"));
		
		return sqlSession.selectOne("orderMapper.selectListCount", optionDate);
	}
	
}
