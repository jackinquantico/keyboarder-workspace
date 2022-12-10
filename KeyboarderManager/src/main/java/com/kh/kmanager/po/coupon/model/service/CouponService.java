package com.kh.kmanager.po.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;


public interface CouponService {
	
	//상품리스트를 가져오는 메소드
	ArrayList<Product> prodcutListforCoupon(int sellerNo);
	
	//쿠폰을 인서트 하는 메소드
	int insertCoupon(Coupon c);
	
	//사용가능한 쿠폰을 조회하는 메소드
	ArrayList<Coupon> showAbleCouponList(Coupon c);


	
	
	
	
	

}
