package com.kh.kmanager.bo.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.order.model.dao.OrderDao;
import com.kh.kmanager.bo.order.model.vo.Order;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	public OrderDao orderDao;
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	
	@Override
	public int selectListCount() {
		return orderDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Order> selectAllOrderList() {
		return orderDao.selectAllOrderList(sqlSession);
	}

}
