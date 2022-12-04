package com.kh.kmanager.po.settlement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.net.aso.p;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class Withdraw {

	private int sellerNo;
	private String withdrawDate;
	private int withdrawMoney;
	private String accountNo;
	private String repName;
	private String reqResult;
	private String sellerName;
	private String startDate;
	private String endDate;
	
	public Withdraw() { }

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(String withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

	public int getWithdrawMoney() {
		return withdrawMoney;
	}

	public void setWithdrawMoney(int withdrawMoney) {
		this.withdrawMoney = withdrawMoney;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}

	public String getReqResult() {
		return reqResult;
	}

	public void setReqResult(String reqResult) {
		this.reqResult = reqResult;
	}

	public String getSellerName() {
		return sellerName;
	}
	
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "Withdraw [sellerNo=" + sellerNo + ", withdrawDate=" + withdrawDate + ", withdrawMoney=" + withdrawMoney
				+ ", accountNo=" + accountNo + ", repName=" + repName + ", reqResult=" + reqResult + ", sellerName="
				+ sellerName + "]";
	}
	
}
