package com.kh.kmanager.po.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.product.model.vo.Product;

@Repository
public class ProductDao {

	public static int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.insert("poMapper.updateProduct",p);
		
	}

	public static int productCouponInsert(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.insert("poMapper.productCouponInsert",p);
		
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("poMapper.insertProduct", p);
	}

}
