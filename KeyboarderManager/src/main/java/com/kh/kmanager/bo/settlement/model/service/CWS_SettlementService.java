package com.kh.kmanager.bo.settlement.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.settlement.model.vo.CWS_Settlement;
import com.kh.kmanager.member.model.vo.Member;

public interface CWS_SettlementService {
	
	// 입점업체 조회
	ArrayList<Member> selectSeller();
	
	// 수수료 매출 조회(전체)
	ArrayList<CWS_Settlement> selectSellerCommition();
	
	// 입점업체 검색
	ArrayList<CWS_Settlement> searchSellerCommition();
}
