package com.kh.kmanager.po.settlement.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.order.model.vo.Order;
import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.dao.PoSettlementDao;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Service
public class SettlementServiceImpl implements SettlementService {

	@Autowired
	private PoSettlementDao settlementDao;
	
	
	
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

	/**
	 * K-money 잔액관리 메인페이지용 금액 조회용 - 채영
	 * @return : 총 잔액, 정산확정금액, 정산예정금액, 송금예정잔액, 출금가능금액
	 */
	@Override
	public Settlement selectKmoneySettlement(int sellerNo) {
		return settlementDao.selectKmoneySettlement(sqlSession, sellerNo);
	}

	@Override
	public ArrayList<Settlement> selectSettleDetailList(PoOrder o) {
		return settlementDao.selectSettleDetailList(sqlSession, o);
	}

	@Override
	public ArrayList<Settlement>selectSettleSumList(PoOrder o) {
	
		return settlementDao.selectSettleSumList(sqlSession, o);
		}

	/**
	 * 정산내역전체조회 - 장미
	 */
	@Override
	public ArrayList<Settlement> selectSettleTotalList(int sellerNo) {
		return settlementDao.selectSettleTotalList(sqlSession, sellerNo);
	}

	
	}

