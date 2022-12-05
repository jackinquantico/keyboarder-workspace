package com.kh.kmanager.common.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.kmanager.common.model.vo.PageInfo;
import com.kh.kmanager.common.notice.model.dao.NoticeDao;
import com.kh.kmanager.common.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int selectListCount() {
		
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return null;
	}

	@Override
	public int increaseCount(int noticeNo) {
		return 0;
	}

	@Override
	public Notice selectNoticeDetail(int noticeNo) {
		return null;
	}

	@Override
	public int insertNotice(Notice n) {
		
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		return 0;
	}

}
