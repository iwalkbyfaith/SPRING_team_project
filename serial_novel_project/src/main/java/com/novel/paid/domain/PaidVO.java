package com.novel.paid.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaidVO {
	private long paid_num; // 유료 소설 번호
	private long novel_num; // 소설 번호 pk
	private long paid_snum; // 유료 소설 현재 회차 
	private String paid_title; // 유료 제목 (소제목)
	private String paid_content; // 유료 내용
	private Date paid_rdate; // 등록일
	private Date paid_mdate; // 수정일
	private long paid_hit; // 조회수
	private long paid_rec; // 추천수
	private long paid_price; // 유료 소설 가격
	
	private String novel_title; // 소설 제목
	private long novel_tsnum; // 소설 총 회차
	private String novel_writer; // 작가
	private String novel_category; // 소설 장르
	private String novel_week; // 소설 연재요일
	private boolean novel_end; // 소설 완결유무
	
}
