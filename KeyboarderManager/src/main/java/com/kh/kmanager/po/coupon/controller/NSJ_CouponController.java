package com.kh.kmanager.po.coupon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.bo.coupon.model.vo.BoCoupon;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.coupon.model.service.CouponService;
import com.kh.kmanager.po.coupon.model.vo.Coupon;
import com.kh.kmanager.po.product.model.vo.Product;

@Controller
public class NSJ_CouponController {
	@Autowired
	private CouponService couponService;

	/**
	 * po 쿠폰 등록하는 화면 으로 이동-성진
	 * 
	 * @return
	 */
	@RequestMapping("mainCoupon.po")
	public String prodcutListforCoupon(Model model, HttpSession session) {

		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		ArrayList<Product> list = couponService.prodcutListforCoupon(sellerNo);

		if (list != null) {
			model.addAttribute("list", list);
		}
		return "/po/poCoupon/PoCouponInsert";

	}

	/**
	 * po 쿠폰 등록하는 메소드-성진
	 * 
	 * @return
	 */
	@RequestMapping("insertCoupon.po")
	public String insertCoupon(Coupon c, HttpSession session) {

		int sellerNo = ((Member) session.getAttribute("loginUser")).getSellerNo();
		c.setSellerNo(sellerNo);
		// => 만약 안 했을 경우 c의 sellerNo 이 0인 상태
		
		int result = couponService.insertCoupon(c);

		if (result > 0) {
			session.setAttribute("alertMsg", "쿠폰 등록에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "쿠폰 등록에 실패했습니다.");
		}

		return "redirect:/mainCoupon.po";
	}

	/**
	 * po 사용가능쿠폰 전체조회 -성진
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="able.co",produces="application/json; charset=UTF-8")
	public String showAbleCouponList(Coupon c){
	
		c.setCouponStmt("Y");
		ArrayList<Coupon> list = couponService.showAbleCouponList(c);
		return new Gson().toJson(list);
	}
	
	
	@ResponseBody
	@RequestMapping(value="SearchAble.co",  produces="application/json; charset=UTF-8")
	public String ableCouponSearch(Coupon c, HttpSession session) {
		
		
		
		ArrayList<Coupon> list = couponService.showAbleCouponList(c);
		
		return new Gson().toJson(list);
		}
	
	/**
	 * 사용 가능 쿠폰 전체 조회 페이지 리턴
	 * @return
	 */
	@RequestMapping("ableCoupon.po")
	public String ableCouponList() {
		
		return "po/poCoupon/poAbleCouponList";
	}
	
		
	}

