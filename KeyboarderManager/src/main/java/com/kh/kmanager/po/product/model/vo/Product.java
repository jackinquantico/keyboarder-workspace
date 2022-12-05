package com.kh.kmanager.po.product.model.vo;


import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor//기본생성자
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

}
