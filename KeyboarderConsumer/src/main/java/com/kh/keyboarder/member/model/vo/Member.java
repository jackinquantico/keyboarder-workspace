package com.kh.keyboarder.member.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Member {

	private int conNo;
	private String conName;
	private String conId;
	private String conPwd;
	// 기본주소
	private String address1;
	// 상세주소
	private String address2;
	// 전체주소
	private String address; 
	private String conPhone;
	private String conEmail;
	
	
}
