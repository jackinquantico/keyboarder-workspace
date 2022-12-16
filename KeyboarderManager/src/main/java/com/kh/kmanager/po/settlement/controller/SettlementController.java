package com.kh.kmanager.po.settlement.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.kmanager.bo.order.model.vo.Order;
import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.service.SettlementService;
import com.kh.kmanager.po.settlement.model.vo.Settlement;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Controller
public class SettlementController {

	@Autowired
	private SettlementService settlementService;
	
	/**
	 * K-Money 잔액관리 페이지 띄우는 용도 - 채영
	 * @return
	 */
	@RequestMapping("kmoney.po")
	public String kmoneyMain(Model model, HttpSession session) {
		
		// 총 잔액, 정산확정금액, 정산예정금액, 송금예정잔액, 출금가능금액 필요
		// SELLER_NO 필요함 => session에서 뽑아온 값으로 변경
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		Settlement s = settlementService.selectKmoneySettlement(sellerNo);
		
		model.addAttribute("s", s);
		
		return "po/poSettlement/poKmoneyMain";
	}
	
	/**
	 * K-Money 출금신청내역 페이지 - 채영
	 * @return
	 */
	@RequestMapping("kmoneylist.po")
	public String kmoneyWithdraw(Withdraw w, Model model, HttpSession session) {
		
		// 기간별 검색 : startDate, endDate
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		w.setSellerNo(sellerNo);
		
		// 업체명, 출금요청일, 출금요청금액, 출금계좌번호, 예금주, 처리결과 필요
		ArrayList<Withdraw> list = settlementService.selectWithdrawRequestList(w);
		
		model.addAttribute("list", list);
		model.addAttribute("w", w);
		
		return "po/poSettlement/poKmoneyList";
	}
	
	
	/**
	 * PO 수수료 내역 조회 페이지로 단순이동 처리를 해주는 메소드 - 백성현
	 * @return : PO 수수료 내역 조회 페이지 이동
	 */
	@RequestMapping("commissionList.po")
	public String selectCommissionList() {
		
		return "po/poSettlement/poCommissionListView";
	}
	
	/**
	 * PO K-money 출금신청 요청 - 채영
	 * @return
	 */
	@RequestMapping("withdraw.po")
	public String withdrawRequest(HttpSession session, Withdraw w) {
		
		// 판매자식별키, 출금요청금액, 출금계좌번호, 예금주	
		// w 에 로그인세션으로부터 얻어온 값 담아둠
		int result = settlementService.insertWithdraw(w);
		
		if (result > 0) {			
		
			// 출금가능금액에서 출금요청금액을 뺀 나머지 출력해야함 - 완료
			// 송금예정잔액에 출금요청금액 더한 값 출력해야함 - 완료
			
			session.setAttribute("alertMsg", "K-MONEY는 현금성 으로 사용하실 수 있으며 고객님의 은행 계좌로 현금 출금을 신청 후 송금될 예정입니다. 현금 지급은 요청일 기준 익일 지급됩니다. (영업일 기준)");
		
		} else {
			session.setAttribute("alertMsg", "K-MONEY 출금 요청에 실패했습니다.");
		}
		
		return "redirect:/kmoney.po";
	}
	
	/**
	 * Po 메인페이지의 정산현황 조회용 - 채영
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="mainSettlement.po", produces="application/json; charset=UTF-8")
	public String mainSettlement(HttpSession session) {
		
		// 해당 로그인 유저의 정산 내역 조회
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		Settlement s = settlementService.selectKmoneySettlement(sellerNo);
		
		return new Gson().toJson(s);
	}
	
	/**
	 *	정산내역 전체조회 - 장미 
	 * @return
	 */
	@RequestMapping("list.se")
	public String selectSettleList(HttpSession session, Model model) {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		Settlement set = new Settlement();
		set.setNowMonth(nowMonth);
		set.setSellerNo(sellerNo);
		
		ArrayList<Settlement> list = settlementService.selectSettleTotalList(set);
		
		model.addAttribute("list", list);
		return "po/poSettlement/poSettlementTotalListView";
	}
	
	/**
	 * 정산내역 기간조회 -장미
	 * @param session
	 * @param model
	 * @param searchSettleDate
	 * @return
	 */
	@RequestMapping("searchSettlementTotal.po")
	public String searchSettleList(HttpSession session, Model model, String searchSettleDate) {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		String searchDate =  searchSettleDate+"-01";
		Settlement set = new Settlement();
		set.setSellerNo(sellerNo);
		// System.out.println(sellerNo);
		set.setSearchDate(searchDate);
		System.out.println(searchDate);
		ArrayList<Settlement> list = settlementService.searchSettleList(set);
		System.out.println(list);
		model.addAttribute("list", list);
		return "po/poSettlement/poSettlementTotalListView";
	}
	
	/**
	 *	정산내역 상세조회페이지뷰- 성진 
	 * @return
	 */
	@RequestMapping("settleView.po")
	public String selectSettleDetailList(HttpSession session, Model model,PoOrder o) {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		o.setSellerNo(sellerNo);
		
		ArrayList<Settlement> list = settlementService.selectSettleDetailList(o);
		ArrayList<Settlement> list2 =settlementService.selectSettleSumList(o);
		
		if(list!=null) {
			model.addAttribute("list",list);
		if(list2!=null) {
			model.addAttribute("list2",list2);
			}
		}
		
		return "po/poSettlement/poSettlementDetailList";
	}
	
	
	@RequestMapping("searchSettle.po")

	public String selectSearchList(HttpSession session, Model model,PoOrder o) {
		
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		o.setSellerNo(sellerNo);
		

		System.out.println(o);
		
		ArrayList<Settlement> list = settlementService.selectSettleDetailList(o);
		ArrayList<Settlement> list2 =settlementService.selectSettleSumList(o);
		
		
		System.out.println(list);
		if(list!=null) {
			model.addAttribute("list",list);
			
		if(list2!=null) {
			model.addAttribute("list2",list2);
			}
		}
		
		return "po/poSettlement/poSettlementDetailList";
	}

	@RequestMapping("electronicTaxInvoice.po")
	public String electronicTaxInvoice(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int selNo = m.getSellerNo();
		
		ArrayList<Settlement> elecList = settlementService.selectElectronicList(selNo);
		
		model.addAttribute("elecList", elecList);
		
		return "po/poSettlement/poElectronicTaxInvoice";
	}
	
	// 정산내역 전체조회 엑셀다운로드 - 장미
	@RequestMapping("excelDownloadTotal.se")
	public void excelDownloadSettlement(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		String nowMonth = new SimpleDateFormat("yyyy-MM").format(new Date());
		Settlement set = new Settlement();
		set.setNowMonth(nowMonth);
		set.setSellerNo(sellerNo);
		
		ArrayList<Settlement> list = settlementService.settleExcelTotalList(set);
		
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
        objCell.setCellValue("정산일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("상품번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("상품금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("배송비");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("총 판매금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("판매수수료");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("KEYBOAR-DER 쿠폰금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("입점사 쿠폰금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("정산 확정금액");
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
	        
	        // 정산일
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDate());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품번호
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getProductNo());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 배송비
	        objCell = objRow.createCell(count);
	        objCell.setCellValue("2500");
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 총판매금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getPaymentBill());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 판매수수료
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getCommition());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // KEYBOAR-DER쿠폰금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKeyCouponPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 입점사 쿠폰금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getStoCouponPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 정산 확정금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDept());
	        objCell.setCellStyle(styleHd);
	        count++;
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        				+ URLEncoder.encode("정산내역전체조회", "UTF-8") + ".xls");
	 
        OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	// 정산내역 기간조회 엑셀다운로드 -장미
	@RequestMapping("excelDownloadSearch.se")
	public void excelSearchDownloadSettlement(HttpSession session, Model model, HttpServletResponse response, String searchSettleDate) throws IOException {
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		String searchDate =  searchSettleDate+"-01";
		Settlement set = new Settlement();
		set.setSellerNo(sellerNo);
		set.setSearchDate(searchDate);
		ArrayList<Settlement> list = settlementService.searchSettleExcelList(set);
		
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
        objCell.setCellValue("정산일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("상품번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("상품금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("배송비");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("총 판매금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(6);
        objCell.setCellValue("판매수수료");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(7);
        objCell.setCellValue("KEYBOAR-DER 쿠폰금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(8);
        objCell.setCellValue("입점사 쿠폰금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(9);
        objCell.setCellValue("정산 확정금액");
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
	        
	        // 정산일
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDate());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품번호
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getProductNo());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 상품금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 배송비
	        objCell = objRow.createCell(count);
	        objCell.setCellValue("2500");
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 총판매금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getPaymentBill());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 판매수수료
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getCommition());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // KEYBOAR-DER쿠폰금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getKeyCouponPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 입점사 쿠폰금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getStoCouponPrice());
	        objCell.setCellStyle(styleHd);
	        count++;
	        
	        // 정산 확정금액
	        objCell = objRow.createCell(count);
	        objCell.setCellValue(list.get(i).getSettleDept());
	        objCell.setCellStyle(styleHd);
	        count++;
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        				+ URLEncoder.encode("정산내역전체조회", "UTF-8") + ".xls");
	 
        OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
		
	}
}


































