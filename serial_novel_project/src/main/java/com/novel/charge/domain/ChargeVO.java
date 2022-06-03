package com.novel.charge.domain;

import java.sql.Date;

import lombok.Data;
@Data
public class ChargeVO {

	private long charge_num; // ◎ 결제고유번호 (PK)
	private String merchant_uid; // ◎ 결제아이디
	private String itemname; // ◎ 결제상품이름
	private Date charge_date; // ◎ 결제일
	private long user_num; // ◎ 결제한 유저
	private long charge_price; // ◎ 결제금액
	private long charge_coin; // ◎ 결제코인
	private long charge_coupon; // ◎ 결제쿠폰
	
}
