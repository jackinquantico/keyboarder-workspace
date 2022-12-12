package com.kh.kmanager.bo.settlement.model.vo;

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
public class CWS_Settlement {
	
	private int sellerNo;
	private String sellerName;
	private String orderNo;
	private int orderPrice;
	private String settleDate;
	private int commition;
	private int settleDept;
	private int taxAmount;
	private int supplyValue;
	private int billPublishAmount;
	private int sales;
	private String paymentNo;
	private String corpNo;
	private String repName;
	private String sellerEmail;
	private String sellerPhone;
	private String location;
	private String productName;
	private int price;
	
	public CWS_Settlement(String sellerName) {
		super();
		this.sellerName = sellerName;
	}

	public CWS_Settlement(String sellerName, String settleDate) {
		super();
		this.sellerName = sellerName;
		this.settleDate = settleDate;
	}

	public CWS_Settlement(String sellerName, String orderNo, String settleDate) {
		super();
		this.sellerName = sellerName;
		this.orderNo = orderNo;
		this.settleDate = settleDate;
	}
		
	public CWS_Settlement(String orderNo, String corpNo, String sellerName, String repName, String location, String sellerEmail, String sellerPhone
						, int supplyValue, int taxAmount, String productName, int price, String settleDate) {
		this.orderNo = orderNo;
		this.corpNo = corpNo;
		this.sellerName = sellerName;
		this.repName = repName;
		this.location = location;
		this.sellerEmail = sellerEmail;
		this.sellerPhone = sellerPhone;
		this.supplyValue = supplyValue;
		this.taxAmount = taxAmount;
		this.productName = productName;
		this.price = price;
		this.settleDate = settleDate;
	}
}
