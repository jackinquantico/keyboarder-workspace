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
	private Date settleDate;
	private int commition;
	private int settleDept;
	private int taxAmount;
	private int supplyValue;
	private int billPublishAmount = supplyValue - taxAmount;
	private int sales;
	private String paymentNo;
	
	public CWS_Settlement(String sellerName) {
		super();
		this.sellerName = sellerName;
	}

	public CWS_Settlement(String sellerName, Date settleDate) {
		super();
		this.sellerName = sellerName;
		this.settleDate = settleDate;
	}
		
	
}
