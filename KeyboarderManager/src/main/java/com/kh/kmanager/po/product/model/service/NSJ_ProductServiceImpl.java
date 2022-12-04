package com.kh.kmanager.po.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.product.model.dao.ProductDao;
import com.kh.kmanager.po.product.model.vo.Product;

@Service
public class NSJ_ProductServiceImpl implements NSJ_ProductService{
	//Mybatis 사용하기위한 선언문
		@Autowired
		private SqlSessionTemplate sqlSession;
		//ProductDao 객체 선언
		@Autowired
		private ProductDao productDao;
		
	
	
	@Override
	public int insertProduct(Product p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return ProductDao.updateProduct(sqlSession,p);
	}

	@Override
	public Product showProduct(Product p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product detailProduct(int productNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product searchProduct(String ProductName) {
		// TODO Auto-generated method stub
		return null;
	}

	public interface FileUploadService {
		public String saveFile();
	}
	
	
	
}
