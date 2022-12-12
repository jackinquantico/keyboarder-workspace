package com.kh.kmanager.po.order.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.kmanager.po.order.model.vo.PoOrder;



@Repository
public class PoOrderDao {
	// 구매확정 전체 조회
	public ArrayList<PoOrder> selectDecisionOrder(SqlSessionTemplate sqlSession) {
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		nowMonth = "2022-09"; // 9월 더미밖에 없어서 일단 9월달로만 해놓음
//		System.out.println(nowMonth);
//		System.out.println("오니?");
		return (ArrayList)sqlSession.selectList("poorderMapper.selectDecisionOrder", nowMonth);
	}
}
