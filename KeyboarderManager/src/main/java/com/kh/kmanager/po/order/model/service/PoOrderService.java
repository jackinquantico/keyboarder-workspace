package com.kh.kmanager.po.order.model.service;

import java.util.ArrayList;

import com.kh.kmanager.po.order.model.vo.PoOrder;

public interface PoOrderService {

	ArrayList<PoOrder> selectDecisionOrder();
}
