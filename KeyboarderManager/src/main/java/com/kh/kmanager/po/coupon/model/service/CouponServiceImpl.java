package com.kh.kmanager.po.coupon.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.coupon.model.dao.CouponDao;
import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;


@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CouponDao couponDao;
	
	//쿠폰 인서트
	public int  insertCoupon(Coupon c) {
	
	return couponDao.insertCoupon(sqlSession, c);
	}

	//상품 가져오기
	@Override
	public ArrayList<Product> prodcutListforCoupon(int sellerNo) {
		
		return couponDao.prodcutListforCoupon(sqlSession,sellerNo);
	}
}
