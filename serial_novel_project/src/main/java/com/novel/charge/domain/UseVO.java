package com.novel.charge.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UseVO {
	private long use_num;
	private long user_num;
	private String use_type;
	private long use_count;
	private Date use_date;
}
