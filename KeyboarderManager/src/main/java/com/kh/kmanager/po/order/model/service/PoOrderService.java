package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.kmanager.po.order.model.vo.PoOrder;

public interface PoOrderService {
	
	// 구매확정내역 리스트 조회(기본으로 해당월 조회)
	ArrayList<PoOrder> selectDecisionOrder(PoOrder poOrder);
	
	// 구매확정내역 기간별 조회
	ArrayList<PoOrder> searchPoOrderDecision(PoOrder poOrder);
	
	// 현재 월의 전체주문내역 리스트 조회 서비스
	int selectListCount(HashMap<String, String> optionDefault); // 해당 PO의 현재 월의 주문내역 총 개수
	ArrayList<PoOrder> selectAllOrderList(HashMap<String, String> optionDefault); // 해당 PO의 현재 월의 주문내역 리스트 

	// 구매확정내역 (해당월)엑셀다운로드
	ArrayList<PoOrder> orderDecisionList(PoOrder poOrder);
	
	// 구매확정내역 기간별조회 엑셀다운로드
	ArrayList<PoOrder> searchExcelDecisionList(PoOrder poOrder);
}
