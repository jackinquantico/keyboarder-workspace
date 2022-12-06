package com.kh.kmanager.bo.graph.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

@Repository
public class BoGraphDao {

	public ArrayList<SalesGraph> selectsaleSalesGraph(SqlSessionTemplate sqlSession, int month) {
		return (ArrayList)sqlSession.selectList("graphMapper.selectsaleSalesGraph", month);
	}

	
}
