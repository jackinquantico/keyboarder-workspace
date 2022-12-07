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

	private String CouponNo; 
	private String CouponName;
	private int CouponPrice;
	private Date CreateDate;
	private Date UseDate;
	private Date DueDate;
	private String CouponStmt;
	private int sellerNo;
	private int ProductNo;
	
}
