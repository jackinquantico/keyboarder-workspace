package com.kh.kmanager.po.settlement.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class Settlement {

	private int allBalance; // 총 잔액
	private int confirmSettlement; // 정산확정금액
	private int preSettlement; // 정산예정금액
	private int remitBalance; // 송금예정잔액
	private int ableBalance; // 출금가능잔액
}
