package com.novel.paid.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaidNovelInnerVO {
	
	// NovelVO
	private long novel_num;
	private String novel_writer;
	private String novel_title;
	private String novel_tsnum;
	private String novel_category;
	private String novel_week;
	private long novel_end;
	
	
	private long paid_num; // 유료 소설 번호
	private long paid_snum; // 유료 소설 현재 회차
	private String paid_title; // 유료 제목
	private String paid_content; // 유료 내용
	private Date paid_rdate; // 등록일
	private Date paid_mate; // 수정일
	private long paid_hit; // 조회수
	private long paid_rec; // 추천수
	private long paid_price; // 유료 소설 가격
}
