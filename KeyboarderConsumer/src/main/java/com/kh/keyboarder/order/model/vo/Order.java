package com.kh.keyboarder.order.model.vo;

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
public class Order {

	private int orderNo; // 주문번호
	private String orderDate; // 주문일시
	private int orderPrice; // 주문 금액
	private String couponYN; // 쿠폰 사용 여부
	private String orderStatus; // 구매 상태
	private int productNo; // 상품키
	private int conNo; // 고객번호
	private String productAttachment; // 상품사진
	private String productName; // 상품명
}
