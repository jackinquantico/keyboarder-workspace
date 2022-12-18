package com.kh.kmanager.po.order.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.order.model.service.PoOrderService;
import com.kh.kmanager.po.order.model.vo.PoOrder;

@Controller
public class PoOrderController {
	@Autowired
	public PoOrderService orderService;
	
	/**
	 * PO 전체 주문내역 조회 페이지 이동 처리 및 현재 월의 전체 주문내역 조회를 해주는 메소드 - 백성현
	 * @return : PO 전체 주문내역 조회 페이지 이동
	 */
	@RequestMapping("allOrderList.po")
	public String selectAllOrder(HttpSession session, Model model) {
		
		String sellerNo = Integer.toString(((Member)session.getAttribute("loginUser")).getSellerNo());
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		
		HashMap<String, String> optionDefault = new HashMap<String, String>();
		optionDefault.put("sellerNo", sellerNo);
		optionDefault.put("nowMonth", nowMonth);
		
		int listCount = orderService.selectListCount(optionDefault);
		ArrayList<PoOrder> list = orderService.selectAllOrderList(optionDefault);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "po/poOrder/poSelectAllOrder";
	}
	
	/**
	 * PO 전체 주문내역 조회 페이지의 검색옵션으로 검색해주는 메소드 - 백성현
	 * @return : ajax 데이터
	 */
	@ResponseBody
	@RequestMapping(value="optionSearch.po", produces="application/json; charset=UTF-8")
	public String selectOrder_Option(HttpSession session, String currentDate, String endDate, String keyword, String keywordType) {
		
		String sellerNo = Integer.toString(((Member)session.getAttribute("loginUser")).getSellerNo());
		
		HashMap<String, String> option = new HashMap<String, String>();
		option.put("sellerNo", sellerNo);
		option.put("currentDate", currentDate);
		option.put("endDate", endDate);
		option.put("keyword", keyword);
		option.put("keywordType", keywordType);
		
		ArrayList<PoOrder> list = orderService.selectOrderList(option);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * PO주문확정내역조회페이지 - 장미
	 * @return
	 */
	@RequestMapping("decision.po")
	public String selectDecisionOrder(HttpSession session, Model model) {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		PoOrder poOrder = new PoOrder();
		poOrder.setSellerNo(sellerNo);
		poOrder.setNowMonth(nowMonth);
		
		ArrayList<PoOrder> list = orderService.selectDecisionOrder(poOrder);
		model.addAttribute("list", list);
		model.addAttribute("searchDecisionDate", nowMonth);
		//System.out.println(list);
		return "po/poOrder/poOrderDecisionListView";
	}
	
	/**
	 * PO구매확정내역 기간조회 - 장미
	 */
	 @RequestMapping("searchDecision.po")
	 public String searchPoOrderDecision(HttpSession session, Model model, String searchDecisionDate) {
		 int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		 String searchDate =  searchDecisionDate+"-01";
		 PoOrder poOrder = new PoOrder();
		 poOrder.setSellerNo(sellerNo);
		 poOrder.setSearchDate(searchDate);
		 
		 ArrayList<PoOrder> list = orderService.searchPoOrderDecision(poOrder);
		 model.addAttribute("list", list);
		 model.addAttribute("searchDecisionDate", searchDecisionDate);
		 return "po/poOrder/poOrderDecisionListView";
	 }
	 
	//구매확정내역 엑셀다운로드 -장미
	 @RequestMapping("excelDownloadDecision.po")
	 public void excelDownload(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		PoOrder poOrder = new PoOrder();
		poOrder.setSellerNo(sellerNo);
		poOrder.setNowMonth(nowMonth);

//		 System.out.println("기간설정X");
//		 System.out.println(nowMonth);
		
		 ArrayList<PoOrder> list = orderService.orderDecisionList(poOrder);

		// 셀 생성
	    HSSFWorkbook objWorkBook = new HSSFWorkbook();
        HSSFSheet objSheet = null;
        HSSFRow objRow = null;
        HSSFCell objCell = null;
      
        //제목폰트 
        HSSFFont font = objWorkBook.createFont();
        font.setFontHeightInPoints((short)10);
        font.setFontName("맑은 고딕");
        
        //제목 스타일에 폰트 적용, 정렬</span>
        HSSFCellStyle styleHd = objWorkBook.createCellStyle(); // 제목 스타일
        styleHd.setFont(font);
        
        objSheet = objWorkBook.createSheet("첫번째 시트"); // 워크 시트 생성
        
        // Header
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short)0x150);
        
        objCell = objRow.createCell(0);
        objCell.setCellValue("주문번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("구매확정일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("k-money 지급일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("상품번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("상품명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("주문금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("구매자ID");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("구매자명");
        objCell.setCellStyle(styleHd);
        
        //body
        for(int i=0; i<list.size(); i++) {
        	 objRow = objSheet.createRow(i + 1);
 	        objRow.setHeight ((short)0x150);
 	        	
         	int count = 0;
         	
         	// 주문번호
         	objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getOrderNo());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 구매확정일
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDate());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // k-money지급일
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKeyMoneyDate());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품번호
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getProductNo());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품명
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getProductName());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 주문금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getOrderPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 구매자id
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getConId());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 구매자명
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getConName());
	        objCell.setCellStyle(styleHd);
	        count++;
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        				+ URLEncoder.encode("구매확정내역", "UTF-8") + ".xls");
	 
        OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	 }
	 
	 // 구매확정내역 엑셀다운로드 월별검색 - 장미
	 @RequestMapping("excelDownloadSearch.po")
	 public void excelSearchDownload(HttpSession session, Model model, HttpServletResponse response, String searchDecisionDate) throws IOException {
		 int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		 String searchDate =  searchDecisionDate+"-01";
		 PoOrder poOrder = new PoOrder();
		 poOrder.setSellerNo(sellerNo);
		 poOrder.setSearchDate(searchDate);
		 
		 ArrayList<PoOrder> list = orderService.searchExcelDecisionList(poOrder);
		 
		// 셀 생성
		    HSSFWorkbook objWorkBook = new HSSFWorkbook();
	        HSSFSheet objSheet = null;
	        HSSFRow objRow = null;
	        HSSFCell objCell = null;
	        
	        //제목폰트 
	        HSSFFont font = objWorkBook.createFont();
	        font.setFontHeightInPoints((short)10);
	        font.setFontName("맑은 고딕");
	        
	        //제목 스타일에 폰트 적용, 정렬</span>
	        HSSFCellStyle styleHd = objWorkBook.createCellStyle(); // 제목 스타일
	        styleHd.setFont(font);
	        
	        objSheet = objWorkBook.createSheet("첫번째 시트"); // 워크 시트 생성
	        
	        // Header
	        objRow = objSheet.createRow(0);
	        objRow.setHeight ((short)0x150);
	        
	        objCell = objRow.createCell(0);
	        objCell.setCellValue("주문번호");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(1);
	        objCell.setCellValue("구매확정일");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(2);
	        objCell.setCellValue("k-money 지급일");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(3);
	        objCell.setCellValue("상품번호");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(4);
	        objCell.setCellValue("상품명");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(5);
	        objCell.setCellValue("주문금액");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(6);
	        objCell.setCellValue("구매자ID");
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(7);
	        objCell.setCellValue("구매자명");
	        objCell.setCellStyle(styleHd);
	        
	        //body
	        for(int i=0; i<list.size(); i++) {
	        	 objRow = objSheet.createRow(i + 1);
	 	        objRow.setHeight ((short)0x150);
	 	        	
	         	int count = 0;
	         	
	         	// 주문번호
	         	objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getOrderNo());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // 구매확정일
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getSettleDate());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // k-money지급일
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getKeyMoneyDate());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // 상품번호
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getProductNo());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // 상품명
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getProductName());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // 주문금액
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getOrderPrice());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // 구매자id
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getConId());
		        objCell.setCellStyle(styleHd);
		        count++;
		        
		        // 구매자명
		        objCell = objRow.createCell(count);
		        objCell.setCellValue(list.get(i).getConName());
		        objCell.setCellStyle(styleHd);
		        count++;
	        }
	        
	        response.setContentType("Application/Msexcel");
	        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
	        				+ URLEncoder.encode("기간별구매확정내역", "UTF-8") + ".xls");
		 
	        OutputStream fileOut  = response.getOutputStream();
		    objWorkBook.write(fileOut);
		    fileOut.close();
		
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		 
	 }
	 
	/**
	 * 환불처리 기능 - 채영
	 * @param pgd
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="refundPay.fo")
	public String refundPay(PoOrder pgd, HttpSession session) throws IOException {
		
		// System.out.println(pgd);
		
		//int amount = service.selectRefundAmount(pgd);		
		String token = orderService.getToken();
		int amount = orderService.paymentInfo(pgd.getPaymentNo(), token);
		
		orderService.payMentCancel(token, pgd.getPaymentNo(), amount, "단순 변심 취소");
		
		int result = orderService.orderCancel(pgd);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "결제 취소 완료");
			return "redirect:/allOrderList.po";
		} else {
			session.setAttribute("alertMsg", "결제 취소 실패");
			return "redirect:/allOrderList.po";
		}
	}
}
