package com.kh.kmanager.common.model.service;

import com.kh.kmanager.common.model.vo.PoMainData;

public interface PoMainPageService {

	PoMainData mainOrderSummary(int sellerNo);
	
	PoMainData mainPaymentSummary(int sellerNo);
}
