package com.kh.kmanager.bo.graph.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

public interface BoGraphService {

	// 월별 매출통계 조회용
	ArrayList<SalesGraph> selectSalesGraph(int month);
	
	// 전체 월 평균 매출 통계 조회용
	ArrayList<SalesGraph> selectAvgSalesGraph();
}
