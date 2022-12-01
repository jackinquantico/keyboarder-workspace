package com.kh.kmanager.common;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.kmanager.common.model.vo.PGData;

@Controller
public class SCY_Controller {
	
	@Autowired
	private SCY_Service service;
		
	
	@RequestMapping("purchase.fo")
	public String requestPay(PGData pgd) {
		
		int amount = Integer.parseInt(pgd.getAmount()); // 실결제금액
		pgd.setOrderPrice(amount + pgd.getCouponPrice()); // 주문금액
		pgd.setPaymentBill(amount); // 결제금액
		pgd.setCommition((int)(pgd.getOrderPrice() * 0.15)); // 수수료
		pgd.setSettleDept(pgd.getPaymentBill() - pgd.getCommition()); // 정산금액
		pgd.setSupplyValue((int)(pgd.getPaymentBill() / 1.1)); // 공급가액
		pgd.setTaxAmount(pgd.getPaymentBill() - pgd.getSupplyValue()); // 세액
		
		// System.out.println(pgd);
		
		int result = service.insertOrder(pgd);
		
		if (result > 0) {
			System.out.println("성공");
			return "redirect:/";
		} else {
			System.out.println("실패");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="refundPay.fo")
	public String  refundPay(PGData pgd, HttpSession session) throws IOException {
		
		// System.out.println(pgd);
		
		//int amount = service.selectRefundAmount(pgd);		
		String token = service.getToken();
		int amount = service.paymentInfo(pgd.getPaymentNo(), token);
		
		service.payMentCancel(token, pgd.getPaymentNo(), amount, "단순 변심 취소");
		
		int result = service.orderCancel(pgd);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "결제 취소 완료");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "결제 취소 실패");
			return "redirect:/";
		}
	}
	
}