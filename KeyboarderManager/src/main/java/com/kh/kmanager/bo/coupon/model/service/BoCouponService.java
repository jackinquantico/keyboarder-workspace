package com.kh.kmanager.bo.coupon.model.service;

import java.util.ArrayList;

import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

public interface BoCouponService {
	
	// 쿠폰 전체 조회용
	public ArrayList<BoCoupon> selectCouponList(BoCoupon bc);


}
