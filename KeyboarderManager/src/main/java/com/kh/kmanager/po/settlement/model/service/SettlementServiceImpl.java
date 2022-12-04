package com.kh.kmanager.po.settlement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.settlement.model.dao.SettlementDao;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Service
public class SettlementServiceImpl implements SettlementService {

	@Autowired
	private SettlementDao settlementDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 출금신청내역 insert 용 메소드 - 채영
	 */
	@Override
	public int insertWithdraw(Withdraw w) {
		return settlementDao.insertWithdraw(sqlSession, w);
	}

	/**
	 * 출금신청내역 전체 리스트 조회용 - 채영
	 */
	@Override
	public ArrayList<Withdraw> selectWithdrawRequestList(Withdraw w) {
		return settlementDao.selectWithdrawRequestList(sqlSession, w);
	}

}
