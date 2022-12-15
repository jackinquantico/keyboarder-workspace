package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;

import com.kh.kmanager.po.order.model.vo.PoOrder;

public interface JKW_OrderService {

	int orderStatus1(int selNo);

	int orderStatus2(int selNo);
	
	int orderStatus3(int selNo);
	
	int orderStatus4(int selNo);
	
	int orderCount(int selNo);
	
	ArrayList<PoOrder> orderList(int selNo);

	ArrayList<PoOrder> deliverySearchDate(PoOrder poOrder);

	int dateOrderStatus1(PoOrder poOrder);

	int dateOrderStatus2(PoOrder poOrder);

	int dateOrderStatus3(PoOrder poOrder);

	int dateOrderStatus4(PoOrder poOrder);

	int dateOrderCount(PoOrder poOrder);
}
