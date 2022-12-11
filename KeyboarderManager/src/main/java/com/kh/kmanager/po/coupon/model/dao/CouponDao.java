package com.kh.kmanager.po.coupon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;

@Repository
public class CouponDao {

	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.insert("poCouponMapper.insertCoupon",c);
	}

	
	public ArrayList<Product> prodcutListforCoupon(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("poMapper.getProductName",sellerNo);
	}


	public ArrayList<Coupon> showAbleCouponList(SqlSessionTemplate sqlSession, Coupon c ) {
		
		return (ArrayList)sqlSession.selectList("poCouponMapper.showAbleCouponList",c);
	}


	public ArrayList<Coupon> ableCouponSearch(SqlSessionTemplate sqlSession, Coupon c) {
		
		return (ArrayList)sqlSession.selectList("poCouponMapper.ableCouponSearch",c);
	}


	


}
