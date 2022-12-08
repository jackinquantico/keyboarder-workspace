package com.kh.kmanager.bo.coupon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.bo.coupon.model.service.BoCouponService;
import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;

@Controller
public class BoCouponController {
	
	@Autowired
	private BoCouponService couponService;

	/**
	 * bo 쿠폰 전체 조회 화면 - 채영
	 * @return
	 */
	@RequestMapping("coupon.bo")
	public String couponMain(BoCoupon bc) {
		
		return "bo/boCoupon/boCouponList";
	}
	
	/**
	 * bo 쿠폰 등록 화면 - 채영
	 * @return
	 */
	@RequestMapping("couponInsert.bo")
	public String couponInsert() {
		
		return "bo/boCoupon/boCouponInsert";
	}
	
	@ResponseBody
	@RequestMapping(value="loadCoupon.bo", produces="application/json; charset=UTF-8")
	public String loadCoupon(BoCoupon bc) {
		
		ArrayList<BoCoupon> list = couponService.selectCouponList(bc);
		
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="ableCoupon.bo", produces="application/json; charset=UTF-8")
	public String ableCoupon(BoCoupon bc) {
		
		// 쿠폰 리스트 조회
		bc.setCouponStmt("Y");
		
		ArrayList<BoCoupon> list = couponService.selectCouponList(bc);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="expireCoupon.bo", produces="application/json; charset=UTF-8")
	public String expireCoupon(BoCoupon bc) {
		
		// 쿠폰 리스트 조회
		bc.setCouponStmt("N");
		
		ArrayList<BoCoupon> list = couponService.selectCouponList(bc);
		
		return new Gson().toJson(list);
	}
}
