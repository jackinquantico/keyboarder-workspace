package com.kh.kmanager.po.order.model.vo;

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
public class PoOrder {

	private String orderNo; // 주문번호
	private Date orderDate; // 주문일시
	private int orderPrice; // 주문금액
	private String couponYN; // 쿠폰사용여부
	private String orderStatus; //구매상태
	private int productNo; //상품키
	private int conNo; // 고객번호
	
	private Date settleDate; //조인할 정산일
	private String keyMoneyDate; // 조인할 k머니지급일
	private String productName; // 조인할 상품명
	private String conId; // 조인할 구매자아이디
	private String conName; // 조인할 구매자명


}