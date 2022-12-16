package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<PoOrder> selectDecisionOrder(PoOrder poOrder) {
		return orderDao.selectDecisionOrder(sqlSession, poOrder);
	}

	/**
	 * 구매확정내역 기간별 조회 - 장미
	 */
	@Override
	public ArrayList<PoOrder> searchPoOrderDecision(PoOrder poOrder) {
		return orderDao. searchPoOrderDecision(sqlSession, poOrder);
	}
	
	@Override
	public int selectListCount(HashMap<String, String> optionDefault) {
		return orderDao.selectListCount(sqlSession, optionDefault);
	}

	@Override
	public ArrayList<PoOrder> selectAllOrderList(HashMap<String, String> optionDefault) {
		return orderDao.selectAllOrderList(sqlSession, optionDefault);
	}

	// 구매확정내역 해당월 엑셀다운로드 - 장미
	@Override
	public ArrayList<PoOrder> orderDecisionList(PoOrder poOrder) {
		return orderDao.orderDecisionList(sqlSession, poOrder);
	}

	
	// 구매확정내역 기간별조회 엑셀다운로드 - 장미
	@Override
	public ArrayList<PoOrder> searchExcelDecisionList(PoOrder poOrder) {
		return orderDao.searchExcelDecisionList(sqlSession, poOrder);
	}
	

}
