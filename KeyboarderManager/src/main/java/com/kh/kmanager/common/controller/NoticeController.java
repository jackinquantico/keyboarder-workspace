package com.kh.kmanager.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {

	/**
	 * BO 공지사항 리스트 조회 및 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 리스트 조회 페이지 이동
	 */
	@RequestMapping("noticeList.bo")
	public String boSelectListNotice() {
		
		return "common/noticeListView";
	}
	
	/**
	 * BO 공지사항 작성 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 작성 페이지 이동
	 */
	@RequestMapping("noticeEnrollForm.bo")
	public String boEnrollFormNotice() {
		
		return "common/boNoticeEnrollForm";
	}
	
	/**
	 * BO 공지사항 상세페이지 조회 메소드 - 백성현
	 * @return : BO 공지사항 상세조회 페이지 이동
	 */
	@RequestMapping("noticeDetail.bo")
	public String boSelectNotice() {
		
		return "common/noticeDetailView";
	}
	
	/**
	 * BO 공지사항 수정 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 수정 페이지 이동
	 */
	@RequestMapping("noticeUpdateForm.bo")
	public String boUpdateFormNotice() {
		
		return "common/boNoticeUpdateForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * PO 공지사항 리스트 조회 및 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : PO 공지사항 리스트 조회 페이지 이동
	 */
	@RequestMapping("noticeList.po")
	public String poSelectListNotice() {
		
		return "common/noticeListView";
	}
}
