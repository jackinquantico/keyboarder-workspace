package com.kh.kmanager.po.coupon.controller;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NSJ_CouponController {



/**
 * po 쿠폰 등록하는 화면 으로 이동
 * 
 * @return
 */
@RequestMapping("insert.sco")
public String insertStcoupon() {
		return "po/poCoupon/PoCouponInsert";
	}

}

