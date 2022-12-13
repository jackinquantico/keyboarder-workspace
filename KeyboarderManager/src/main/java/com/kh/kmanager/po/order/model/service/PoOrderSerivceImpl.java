package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.order.model.dao.PoOrderDao;
import com.kh.kmanager.po.order.model.vo.PoOrder;


@Service
public class PoOrderSerivceImpl implements PoOrderService{

	@Autowired
	public PoOrderDao orderDao;
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	/**
	 * 구매확정조회-장미
	 */
	@Override
	public ArrayList<PoOrder> selectDecisionOrder() {
		return orderDao.selectDecisionOrder(sqlSession);
	}

}