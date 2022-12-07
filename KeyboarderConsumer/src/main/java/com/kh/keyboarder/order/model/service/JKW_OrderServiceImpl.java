package com.kh.keyboarder.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.keyboarder.order.model.dao.JKW_OrderDao;
import com.kh.keyboarder.order.model.vo.Order;

@Service
public class JKW_OrderServiceImpl implements JKW_OrderService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JKW_OrderDao JKW_OrderDao;

	@Override
	public ArrayList<Order> foTotalViewList(int conNo) {
		
		return JKW_OrderDao.foTotalViewList(sqlSession, conNo);
	}
	
	

	
}
