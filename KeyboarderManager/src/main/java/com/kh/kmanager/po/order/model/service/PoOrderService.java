package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;

import com.kh.kmanager.po.order.model.vo.PoOrder;

public interface PoOrderService {
	
	// 구매확정내역 리스트 조회(기본으로 해당월 조회)
	ArrayList<PoOrder> selectDecisionOrder(int sellerNo);
	
	// 구매확정내역 기간별 조회
	ArrayList<PoOrder> searchPoOrderDecision(PoOrder poOrder);
}
