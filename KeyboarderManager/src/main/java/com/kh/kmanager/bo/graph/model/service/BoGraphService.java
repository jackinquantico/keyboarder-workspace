package com.kh.kmanager.bo.graph.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

public interface BoGraphService {

	// 매출통계 조회용
	ArrayList<SalesGraph> selectsaleSalesGraph(int month);
}
