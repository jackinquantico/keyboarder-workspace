package com.kh.kmanager.bo.coupon.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.coupon.model.dao.BoCouponDao;
import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

@Service
public class BoCouponServiceImpl implements BoCouponService {

	@Autowired
	private BoCouponDao couponDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<BoCoupon> selectCouponList(BoCoupon bc) {
		return couponDao.selectCouponList(sqlSession, bc);
	}
	

}
