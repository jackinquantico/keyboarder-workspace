package com.kh.keyboarder.order.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class PGData {

	private String paymentNo; // 결제번호 // imp_uid
	private String orderNo; // 주문번호 // merchant_uid
	private int productNo; // 상품번호
	private String amount; // 실결제액
	private int conNo; // 소비자번호
	private int paymentBill; // 결제금액
	private int orderPrice; // 주문금액
	private int couponPrice; // 쿠폰금액
	private int sellerNo; // 판매자번호
	private int commition; // 수수료금액
	private int settleDept; // 정산금액
	private int taxAmount; // 세액
	private int supplyValue; // 공급가액
	
	public PGData() { }

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public int getPaymentBill() {
		return paymentBill;
	}

	public void setPaymentBill(int paymentBill) {
		this.paymentBill = paymentBill;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public int getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(int couponPrice) {
		this.couponPrice = couponPrice;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public int getCommition() {
		return commition;
	}

	public void setCommition(int commition) {
		this.commition = commition;
	}

	public int getSettleDept() {
		return settleDept;
	}

	public void setSettleDept(int settleDept) {
		this.settleDept = settleDept;
	}

	public int getTaxAmount() {
		return taxAmount;
	}

	public void setTaxAmount(int taxAmount) {
		this.taxAmount = taxAmount;
	}

	public int getSupplyValue() {
		return supplyValue;
	}

	public void setSupplyValue(int supplyValue) {
		this.supplyValue = supplyValue;
	}

	@Override
	public String toString() {
		return "PGData [paymentNo=" + paymentNo + ", orderNo=" + orderNo + ", productNo=" + productNo + ", amount="
				+ amount + ", conNo=" + conNo + ", paymentBill=" + paymentBill + ", orderPrice=" + orderPrice
				+ ", couponPrice=" + couponPrice + ", sellerNo=" + sellerNo + ", commition=" + commition
				+ ", settleDept=" + settleDept + ", taxAmount=" + taxAmount + ", supplyValue=" + supplyValue + "]";
	}
}
