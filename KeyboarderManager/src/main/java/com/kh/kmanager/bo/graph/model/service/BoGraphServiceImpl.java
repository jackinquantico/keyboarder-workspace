package com.kh.kmanager.bo.graph.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.bo.graph.model.dao.BoGraphDao;
import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

@Service
public class BoGraphServiceImpl implements BoGraphService {

	@Autowired
	private BoGraphDao graphDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<SalesGraph> selectsaleSalesGraph(int month) {
		return graphDao.selectsaleSalesGraph(sqlSession, month);
	}

}
