package com.kh.keyboarder.product.model.service;

import java.util.ArrayList;

import com.kh.keyboarder.common.model.vo.PageInfo;
import com.kh.keyboarder.product.model.vo.JKW_Coupon;
import com.kh.keyboarder.product.model.vo.Product;

public interface JKW_ProductService {

	// 게시판 리스트 조회 서비스 + 페이징 처리
	// 게시글 총 개수
	int selectListCount();
	
	// 게시글 리스트 조회
	ArrayList<Product> selectList(PageInfo pi);
	
	// ArrayList<JKW_Coupon> stoCouponList();
	
	ArrayList<JKW_Coupon> keyCouponList();
}
