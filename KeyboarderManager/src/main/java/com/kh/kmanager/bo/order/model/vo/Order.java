package com.kh.kmanager.bo.order.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {

	private String orderNo;
	private String orderDate;
	private int orderPrice;
	private String couponYn;
	private String orderStatus;
	private int productNo;
	private int conNo;
	
	private String productName; // 조인한 상품명
	private String conName; // 조인한 주문자명
	private int paymentBill; // 조인한 결제금액
	private String sellerName; // 조인한 판매자명(입점업체명)
	private String buyConfirmDate; // 조인한 구매확정일
	private int poCouponPrice; // 조인한 스토어발행 쿠폰 금액
	private int boCouponPrice; // 조인한 키보더발행 쿠폰 금액
	private int commission; // 수수료 금액
}
