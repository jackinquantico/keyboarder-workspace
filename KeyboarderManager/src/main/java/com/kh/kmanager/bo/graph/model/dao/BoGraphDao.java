package com.kh.kmanager.bo.graph.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

@Repository
public class BoGraphDao {

	public ArrayList<SalesGraph> selectSalesGraph(SqlSessionTemplate sqlSession, int month) {
		return (ArrayList)sqlSession.selectList("graphMapper.selectSalesGraph", month);
	}

	public ArrayList<SalesGraph> selectAvgSalesGraph(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("graphMapper.selectAvgSalesGraph");
	}

	
}
