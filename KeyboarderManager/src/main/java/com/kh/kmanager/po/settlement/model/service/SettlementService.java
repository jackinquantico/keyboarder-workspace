package com.kh.kmanager.po.settlement.model.service;

import java.util.ArrayList;


import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

public interface SettlementService {

	// 출금신청내역 insert 용 - 채영
	public int insertWithdraw(Withdraw w);
	
	// 출금신청내역 리스트 조회용 - 채영
	public ArrayList<Withdraw> selectWithdrawRequestList(Withdraw w);

	// k-money 잔액관리 메인페이지용 - 채영
	public Settlement selectKmoneySettlement(int sellerNo);

	//정산 상세보기 페이지-성진
	public ArrayList<Settlement>selectSettleDetailList(PoOrder o);

	//정산 합산 내역 조회-성진
	public ArrayList<Settlement> selectSettleSumList(PoOrder o);
	
	// 정산내역전제조회 - 장미
	public ArrayList<Settlement> selectSettleTotalList(int sellerNo);
	
	// 전자세금계산서 조회 - 건우
	ArrayList<Settlement> selectElectronicList(int selNo);
}
