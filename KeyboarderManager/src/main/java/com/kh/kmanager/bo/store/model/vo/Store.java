package com.kh.kmanager.bo.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//@AllArgsConstructor
//@Getter
//@Setter
//@ToString
public class Store {

	private int sellerNo; //SELLER_NO	NUMBER
	private String sellerName; //SELLER_NAME	VARCHAR2(50 BYTE)
	private String repName; //REP_NAME	VARCHAR2(20 BYTE)
	private String sellerId; //SELLER_ID	VARCHAR2(20 BYTE)
	private String sellerPwd; //SELLER_PWD	VARCHAR2(20 BYTE)
	private String sellerEmail; //SELLER_EMAIL	VARCHAR2(50 BYTE)
	private String sellerPhone; //SELLER_PHONE	CHAR(13 BYTE)
	private String corpNo; //CORP_NO	CHAR(12 BYTE)
	private String accountNo; //ACCOUNT_NO	VARCHAR2(20 BYTE)
	private String joinDate; //JOIN_DATE	DATE // String
	private String location; //LOCATION	VARCHAR2(100 BYTE)
	private String sellerStatus; //SELLER_STATUS	CHAR(1 BYTE)
	private String identifyStatus; //IDENTIFY_STATUS	CHAR(1 BYTE)
	private String logoAttachment; //LOGO_ATTACHMENT	VARCHAR2(500 BYTE)
	
	public Store() { }

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getRepName() {
		return repName;
	}

	public void setRepName(String repName) {
		this.repName = repName;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellerPwd() {
		return sellerPwd;
	}

	public void setSellerPwd(String sellerPwd) {
		this.sellerPwd = sellerPwd;
	}

	public String getSellerEmail() {
		return sellerEmail;
	}

	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}

	public String getSellerPhone() {
		return sellerPhone;
	}

	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}

	public String getCorpNo() {
		return corpNo;
	}

	public void setCorpNo(String corpNo) {
		this.corpNo = corpNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getSellerStatus() {
		return sellerStatus;
	}

	public void setSellerStatus(String sellerStatus) {
		this.sellerStatus = sellerStatus;
	}

	public String getIdentifyStatus() {
		return identifyStatus;
	}

	public void setIdentifyStatus(String identifyStatus) {
		this.identifyStatus = identifyStatus;
	}

	public String getLogoAttachment() {
		return logoAttachment;
	}

	public void setLogoAttachment(String logoAttachment) {
		this.logoAttachment = logoAttachment;
	}

	@Override
	public String toString() {
		return "Store [sellerNo=" + sellerNo + ", sellerName=" + sellerName + ", repName=" + repName + ", sellerId="
				+ sellerId + ", sellerPwd=" + sellerPwd + ", sellerEmail=" + sellerEmail + ", sellerPhone="
				+ sellerPhone + ", corpNo=" + corpNo + ", accountNo=" + accountNo + ", joinDate=" + joinDate
				+ ", location=" + location + ", sellerStatus=" + sellerStatus + ", identifyStatus=" + identifyStatus
				+ ", logoAttachment=" + logoAttachment + "]";
	}
	
	
}
