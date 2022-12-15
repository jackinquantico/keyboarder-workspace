package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.order.model.dao.JKW_OrderDao;
import com.kh.kmanager.po.order.model.vo.PoOrder;

@Service
public class JKW_OrderServiceImpl implements JKW_OrderService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private JKW_OrderDao JKW_OrderDao;
	
	@Override
	public int orderStatus1(int selNo) {
		
		return JKW_OrderDao.orderStatus1(sqlSession, selNo);
	}

	@Override
	public int orderStatus2(int selNo) {
		
		return JKW_OrderDao.orderStatus2(sqlSession, selNo);
	}

	@Override
	public int orderStatus3(int selNo) {
		
		return JKW_OrderDao.orderStatus3(sqlSession, selNo);
	}

	@Override
	public int orderStatus4(int selNo) {
		
		return JKW_OrderDao.orderStatus4(sqlSession, selNo);
	}

	@Override
	public int orderCount(int selNo) {
		
		return JKW_OrderDao.orderCount(sqlSession, selNo);
	}

	@Override
	public ArrayList<PoOrder> orderList(int selNo) {
		
		return JKW_OrderDao.orderList(sqlSession, selNo);
	}

	@Override
	public ArrayList<PoOrder> deliverySearchDate(PoOrder poOrder) {
		
		return JKW_OrderDao.deliverySearchDate(sqlSession, poOrder);
	}

	@Override
	public int dateOrderStatus1(PoOrder poOrder) {
		
		return JKW_OrderDao.dateOrderStatus1(sqlSession, poOrder);
	}

	@Override
	public int dateOrderStatus2(PoOrder poOrder) {
		
		return JKW_OrderDao.dateOrderStatus2(sqlSession, poOrder);
	}

	@Override
	public int dateOrderStatus3(PoOrder poOrder) {
		
		return JKW_OrderDao.dateOrderStatus3(sqlSession, poOrder);
	}

	@Override
	public int dateOrderStatus4(PoOrder poOrder) {
		
		return JKW_OrderDao.dateOrderStatus4(sqlSession, poOrder);
	}

	@Override
	public int dateOrderCount(PoOrder poOrder) {
		
		return JKW_OrderDao.dateOrderCount(sqlSession, poOrder);
	}

}
