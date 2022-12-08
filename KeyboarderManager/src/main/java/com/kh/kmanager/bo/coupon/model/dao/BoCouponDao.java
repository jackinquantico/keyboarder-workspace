package com.kh.kmanager.bo.coupon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

@Repository
public class BoCouponDao {

	public ArrayList<BoCoupon> selectCouponList(SqlSessionTemplate sqlSession, BoCoupon bc) {
		return (ArrayList)sqlSession.selectList("boCouponMapper.selectCouponList", bc);
	}

}
