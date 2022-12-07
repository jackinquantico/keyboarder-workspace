package com.kh.kmanager.bo.order.model.vo;

import java.sql.Date;

public class Order {

	private String orderNo;
	private Date orderDate;
	private int orderPrice;
	private String couponYn;
	private String orderStatus;
	private int productNo;
	private int conNo;
	
	private String productName; // 조인한 상품명
	private String consumerName; // 조인한 주문자명
	private int paymentBill; // 조인한 결제금액
	private String sellerName; // 조인한 판매자명(입점업체명)
	
	// 추후 롬북 만들예정 (아직 필드 선언 다 못함)
}
