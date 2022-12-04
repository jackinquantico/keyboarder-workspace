package com.kh.kmanager.po.product.model.service;


import com.kh.kmanager.po.product.model.vo.Product;

public interface NSJ_ProductService {


	//상품등록(insert)
	int insertProduct(Product p);
	
	//상품 수정,삭제(update)
	int updateProduct(Product p);
	
	//상품 전체 조회(select)
	
	Product showProduct(Product p);
	
	//상품 상세 조회 (select)
	
	Product detailProduct(int productNo);
	
	//상품 검색(select)
	Product searchProduct(String ProductName);
	
}
