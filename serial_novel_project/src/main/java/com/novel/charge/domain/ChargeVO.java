package com.novel.charge.domain;

import java.sql.Date;

import lombok.Data;
@Data
public class ChargeVO {

	private long charge_num;
	private String merchant_uid;
	private String itemname;
	private Date charge_date;
	private long user_num;
	private long charge_price;
	private long charge_coin;
	private long charge_coupon;
	
}
