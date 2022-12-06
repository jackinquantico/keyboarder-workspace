package com.kh.keyboarder.product.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class JKW_Coupon {

	private int keyCouponNo; 
	private String keyCouponName;
	private int keyCouponPrice;
	private Date keyCreateDate;
	private Date keyUseDate;
	private Date keyDueDate;
	private String keyCouponStmt;
	private int keySellerNo;
	private int keyProductNo;
	private int stoCouponNo; 
	private String stoCouponName;
	private int stoCouponPrice;
	private Date stoCreateDate;
	private Date stoUseDate;
	private Date stoDueDate;
	private String stoCouponStmt;
	private int stoSellerNo;
	private int stoProductNo;
}
