package com.kh.kmanager.bo.store.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.store.model.vo.Store;

@Repository
public class StoreDao {

	public ArrayList<Store> selectStoreList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreList");
	}

	public int identifyStore(SqlSessionTemplate sqlSession, Store s) {
		return sqlSession.update("storeMapper.identifyStore", s);
	}
	
	
}
