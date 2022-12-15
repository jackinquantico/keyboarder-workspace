package com.kh.kmanager.po.info.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.po.info.model.dao.InfoDao;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InfoDao infoDao;
}
