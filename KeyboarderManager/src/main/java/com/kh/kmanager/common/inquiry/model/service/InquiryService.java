package com.kh.kmanager.common.inquiry.model.service;

import java.util.ArrayList;

import com.kh.kmanager.common.inquiry.model.vo.Inquiry;
import com.kh.kmanager.common.model.vo.PageInfo;

public interface InquiryService {
	int selectListCount();
	ArrayList<Inquiry> selectList(PageInfo pi);
	int increaseCount(int inquiryNo);
	Inquiry selectInquiry(int inquiryNo);
	int insertInquiry(Inquiry i);
	
	ArrayList<Inquiry> selectReplyList(int inquiryNo); // 답변조회
	int insertReply(Inquiry r); // 답변작성
}
