package com.kh.kmanager.po.settlement.model.service;

import java.util.ArrayList;

import com.kh.kmanager.po.settlement.model.vo.Withdraw;

public interface SettlementService {

	// 출금신청내역 insert 용 - 채영
	public int insertWithdraw(Withdraw w);
	
	// 출금신청내역 리스트 조회용 - 채영
	public ArrayList<Withdraw> selectWithdrawRequestList(Withdraw w);
}
