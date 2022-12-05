package com.kh.kmanager.common.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.kmanager.common.model.vo.PageInfo;
import com.kh.kmanager.common.notice.model.service.NoticeService;
import com.kh.kmanager.common.notice.model.vo.Notice;
import com.kh.kmanager.common.template.Pagination;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;

	/**
	 * BO 공지사항 리스트 조회 및 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : BO 공지사항 리스트 조회 페이지 이동
	 */
	@RequestMapping("noticeList.bo")
	public String boSelectNoticeList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = noticeService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
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
	 * BO 공지사항 작성 메소드 - 백성현
	 * @param n : 새로 작성한 공지사항 객체
	 * @param session : alert 메시지 알람
	 * @param mv : 공지사항 리스트 조회 페이지로 리다이렉트
	 * @return
	 */
	@RequestMapping("insertNotice.bo")
	public ModelAndView insertNotice(Notice n, HttpSession session, ModelAndView mv) {
		
		int result = noticeService.insertNotice(n);
		
		if(result > 0) { // 공지사항 작성 성공 => 공지사항 리스트 페이지로 url 재요청
			
			session.setAttribute("alertMsg", "공지사항 등록 완료");
		}
		else { // 공지사항 작성 실패 =>
			
			session.setAttribute("alertMsg", "공지사항 작성 실패");
		}
		
		mv.setViewName("redirect:/noticeList.bo");
		
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * PO 공지사항 리스트 조회 및 페이지로 이동 처리를 해주는 메소드 - 백성현
	 * @return : PO 공지사항 리스트 조회 페이지 이동
	 */
	@RequestMapping("noticeList.po")
	public String poSelectNoticeList() {
		
		return "common/noticeListView";
	}
}
