package com.kh.kmanager.bo.graph.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.kmanager.bo.graph.model.service.BoGraphService;
import com.kh.kmanager.bo.graph.model.vo.SalesGraph;

@Controller
public class BoGraphController {
	
	@Autowired
	private BoGraphService graphService;

	/**
	 * 당월, 전월 매출 실적 조회용 - 채영
	 * @param model
	 * @return tlist : 당월 매출 실적, llist: 전월 매출 실적, alist: 전체 월 평균 실적
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
		ArrayList<SalesGraph> tlist = graphService.selectSalesGraph(thisMonth);
		ArrayList<SalesGraph> llist = graphService.selectSalesGraph(lastMonth);
		
		// 전체달 평균 매출 실적 조회해서 보여주는 메소드
		ArrayList<SalesGraph> alist = graphService.selectAvgSalesGraph();
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("llist", llist);
		model.addAttribute("alist", alist);
		
		return "bo/boGraph/boSalesGraphMain";
	}
	
	@ResponseBody
	@RequestMapping(value="mainBarGraph.bo", produces="application/json; charset=UTF-8")
	public String test() {
		
		// System.out.println("???"); // 잘찍혔음!!
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date()); // 오늘 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("MM"); // 월만 뽑아서
		// int thisMonth = Integer.parseInt(sdf.format(cal.getTime())); // 이번달
		int thisMonth = 10;
		cal.add(Calendar.MONTH, -1);
		// int nextMonth = Integer.parseInt(sdf.format(cal.getTime())); // 다음달
		int lastMonth = 9;
		
		// 당월, 전월 매출 실적 조회해서 보여주는 메소드
		ArrayList<SalesGraph> tlist = graphService.selectSalesGraph(thisMonth);
		ArrayList<SalesGraph> llist = graphService.selectSalesGraph(lastMonth);
		
		
		Map<String, ArrayList<SalesGraph>> map = new HashMap<String, ArrayList<SalesGraph>>();
		map.put("tlist", tlist);
		map.put("llist", llist);
		
		// return new Gson().toJson(tlist); // 요청은 들어왔으나 응답이 안돌아가는 상황임 (ajax complete 도 호출안됬음)
		
		return new Gson().toJson(map);
	}
}
