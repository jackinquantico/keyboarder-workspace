package com.kh.kmanager.po.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.product.model.vo.Product;

@Repository
public class ProductDao {
	
	public ArrayList<Product> showProduct(SqlSessionTemplate sqleSession, Product p) {
		return (ArrayList)sqleSession.selectList("poMapper.showProduct",p);
		
	}

	public static int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.update("poMapper.updateProduct",p);
		
	}

	public static int productCouponInsert(SqlSessionTemplate sqlSession, Product p) {
		
		return sqlSession.insert("poMapper.productCouponInsert",p);
		
	}
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("poMapper.insertProduct", p);
	}
	
	public Product detailProduct(SqlSessionTemplate sqleSession, int productNo){
		return sqleSession.selectOne("poMapper.detailProduct", productNo);
		
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
		
		return sqlSession.update("poMapper.deleteProduct",productNo);
	}
}

