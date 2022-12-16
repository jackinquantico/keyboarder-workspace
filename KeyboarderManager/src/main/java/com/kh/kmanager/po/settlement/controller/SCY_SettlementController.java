package com.kh.kmanager.po.settlement.controller;

import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;

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

import com.kh.kmanager.member.model.vo.Member;
import com.kh.kmanager.po.order.model.service.JKW_OrderService;
import com.kh.kmanager.po.order.model.vo.PoOrder;
import com.kh.kmanager.po.settlement.model.service.SettlementService;
import com.kh.kmanager.po.settlement.model.vo.Withdraw;

@Controller
public class SCY_SettlementController {
	
	@Autowired
	private SettlementService settlementService;

	@RequestMapping("excelDownload.kmoney")
	public void excelDownloadKmoney(Withdraw w, HttpServletResponse response, Model model, HttpSession session) throws Exception {
		
		int sellerNo = ((Member)session.getAttribute("loginUser")).getSellerNo();
		
		w.setSellerNo(sellerNo);
		
		ArrayList<Withdraw> wlist = settlementService.selectWithdrawRequestList(w);
		
		// 셀 생성
	    HSSFWorkbook objWorkBook = new HSSFWorkbook();
        HSSFSheet objSheet = null;
        HSSFRow objRow = null;
        HSSFCell objCell = null;
        
        // 제목 폰트
        HSSFFont font = objWorkBook.createFont();
        font.setFontHeightInPoints((short)10);
        font.setFontName("맑은 고딕");
        
        //제목 스타일에 폰트 적용, 정렬</span>
        HSSFCellStyle styleHd = objWorkBook.createCellStyle(); // 제목 스타일
        styleHd.setFont(font);
        
        objSheet = objWorkBook.createSheet(w.getStartDate() + " ~ " + w.getEndDate() + " 출금신청내역"); // 워크 시트 생성
        
        // 1행
        objRow = objSheet.createRow(0);
        objRow.setHeight((short)0x150);
        
    	objCell = objRow.createCell(0);
        objCell.setCellValue("요청업체명");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(1);
        objCell.setCellValue("출금요청일");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(2);
        objCell.setCellValue("출금요청금액");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(3);
        objCell.setCellValue("출금요청계좌번호");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(4);
        objCell.setCellValue("예금주");
        objCell.setCellStyle(styleHd);
        
        objCell = objRow.createCell(5);
        objCell.setCellValue("처리결과");
        objCell.setCellStyle(styleHd);
        
        // 2행 ~ 마지막행
        for(int i = 0; i < wlist.size(); i++) {
        	
	        objRow = objSheet.createRow(i + 1);
	        objRow.setHeight ((short)0x150);
	        	
        	int count = 0;
        	
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getSellerName());
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getWithdrawDate());
	        objCell.setCellStyle(styleHd);
	        		        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getWithdrawMoney());
	        objCell.setCellStyle(styleHd);
	        	        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getAccountNo());
	        objCell.setCellStyle(styleHd);
	        
	        objCell = objRow.createCell(count++);
	        objCell.setCellValue(wlist.get(i).getRepName());
	        objCell.setCellStyle(styleHd);
	        
	        if(wlist.get(i).getReqResult().equals("N")) {
		        objCell = objRow.createCell(count++);
		        objCell.setCellValue("미처리");
		        objCell.setCellStyle(styleHd);
		        
	        } else {
	        	objCell = objRow.createCell(count);
		        objCell.setCellValue("완료");
		        objCell.setCellStyle(styleHd);
	        }
        }
        
        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=" 
        		+ URLEncoder.encode(wlist.get(0).getSellerName() + "_K-Money_출금신청내역" + w.getStartDate() + "_" + w.getEndDate(), "UTF-8") + ".xls");
        
	    OutputStream fileOut  = response.getOutputStream();
	    objWorkBook.write(fileOut);
	    fileOut.close();
	
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
}
