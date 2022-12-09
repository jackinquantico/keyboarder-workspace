package com.kh.kmanager.bo.order.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.order.model.vo.Order;

public interface OrderService {

	// 현재 월의 전체주문내역 리스트 조회 서비스
	int selectListCount(); // 현재 월의 주문내역 총 개수
	ArrayList<Order> selectAllOrderList();
}
