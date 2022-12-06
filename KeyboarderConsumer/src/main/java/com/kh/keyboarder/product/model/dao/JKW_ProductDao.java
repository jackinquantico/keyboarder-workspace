package com.kh.keyboarder.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

@Repository
public class JKW_ProductDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productMapper.selectListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
	}
	/*
	public ArrayList<JKW_Coupon> stoCouponList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("productMapper.stoCouponList");
	}
	*/
	
	public ArrayList<JKW_Coupon> keyCouponList(SqlSessionTemplate sqlSession){
		
		return (ArrayList)sqlSession.selectList("productMapper.keyCouponList");
	}
}
