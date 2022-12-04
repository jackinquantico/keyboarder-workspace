package com.kh.kmanager.po.product.model.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@AllArgsConstructor //매개변수생성자
@Setter	//setter
@Getter //getter
@ToString //toString
public class Product {

	private int productNo;//상품식별키
	private String productName;//상품이름
	private int price;
	private String description;
	private String attachment1;
	private String attachment2;
	private String attachment3;
	private String attachment4;
	private int sellerNo;
	private int couponNo;
	private String couponName;
	private List<Product> list;

	public Product() { }

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAttachment1() {
		return attachment1;
	}

	public void setAttachment1(String attachment1) {
		this.attachment1 = attachment1;
	}

	public String getAttachment2() {
		return attachment2;
	}

	public void setAttachment2(String attachment2) {
		this.attachment2 = attachment2;
	}

	public String getAttachment3() {
		return attachment3;
	}

	public void setAttachment3(String attachment3) {
		this.attachment3 = attachment3;
	}

	public String getAttachment4() {
		return attachment4;
	}

	public void setAttachment4(String attachment4) {
		this.attachment4 = attachment4;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", price=" + price
				+ ", description=" + description + ", attachment1=" + attachment1 + ", attachment2=" + attachment2
				+ ", attachment3=" + attachment3 + ", attachment4=" + attachment4 + ", sellerNo=" + sellerNo
				+ ", couponNo=" + couponNo + ", couponName=" + couponName + ", list=" + list + "]";
	}
	
	
}
