package com.kh.kmanager.po.coupon.model.vo;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor
@Getter
@Setter
@ToString


public class Coupon {
	private String couponNo;
	private String couponName;
	private int couponPrice;
	private String createDate;
	private String useDate;
	private String dueDate;
	private String couponStmt;
	private int productNo;
	
	
	

}
