package com.kh.kmanager.bo.graph.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.bo.graph.model.service.BoGraphService;
import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

@Controller
public class BoGraphController {
	
	@Autowired
	private BoGraphService graphService;

	/**
	 * 당월, 전월 매출 실적 조회용 - 채영
	 * @param model
	 * @return tlist : 당월 매출 실적, llist: 전월 매출 실적
	 */
	@RequestMapping("salesStatics.bo")
	public String test(Model model) {
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date()); // 오늘 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("MM"); // 월만 뽑아서
		// int thisMonth = Integer.parseInt(sdf.format(cal.getTime())); // 이번달
		int thisMonth = 10;
		cal.add(Calendar.MONTH, -1);
		// int nextMonth = Integer.parseInt(sdf.format(cal.getTime())); // 다음달
		int lastMonth = 9;
		
		// 당월, 전월 매출 실적 조회해서 보여주는 메소드
		ArrayList<SalesGraph> tlist = graphService.selectsaleSalesGraph(thisMonth);
		ArrayList<SalesGraph> llist = graphService.selectsaleSalesGraph(lastMonth);
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("llist", llist);
		
		return "bo/boGraph/boSalesGraphMain";
	}
}
