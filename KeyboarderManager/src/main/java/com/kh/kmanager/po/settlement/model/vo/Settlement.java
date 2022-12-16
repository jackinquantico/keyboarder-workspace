package com.kh.kmanager.po.settlement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Settlement {

	private int allBalance; // 총 잔액
	private int confirmSettlement; // 정산확정금액
	private int preSettlement; // 정산예정금액
	private int remitBalance; // 송금예정잔액
	private int ableBalance; // 출금가능잔액
	
	
	private int sellerNo;  //판매자
	private String orderNo; //주문번호
	private String settleDate; // 정산일
	private int commition; // 수수료금액
	private int settleDept; // 정산금액
	private int taxAmount; // 세액
	private int supplyValue; // 공급가액
	private String paymentNo; // 결제번호
	private String nowMonth;
	private int productNo; // 조인할 상품코드
	private int price; // 조인할 상품가격
	private int keyCouponPrice; // 조인할 키보더쿠폰가격
	private int stoCouponPrice; // 조인할 스토어쿠폰가격
	private int paymentBill; // 조인할 결제금액
	private int couponPrice;
	
	private String searchSettleDate; // 기간조회검색
	private String searchDate;
		

}
