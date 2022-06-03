package com.novel.charge.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class UseVO {
	private long use_num; // ◎ 구매고유번호 (PK) 
	private long user_num; // ◎ 구매유저 (FK)
	private String use_type; // ◎ 구매분류
	private long use_count; // ◎ 구매금액
	private Date use_date; // ◎ 구매날짜
	private long paid_num; // ◎ 구매소설 (FK)
	
	private String paid_title; // ◎ 소설제목 (join) 
	private long novel_num; // ◎ 소설번호 (join)
}


