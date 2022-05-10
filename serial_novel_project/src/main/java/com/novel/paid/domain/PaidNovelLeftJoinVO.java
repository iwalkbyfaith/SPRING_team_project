package com.novel.paid.domain;

import java.sql.Date;

public class PaidNovelLeftJoinVO {
	
	private long paid_num; // 유료 소설 번호
	private long novel_num; // 소설 번호 pk
	private long paid_snum; // 유료 소설 현재 회차 
	private String paid_title; // 유료 제목 (소제목)
	private String paid_content; // 유료 내용
	private Date paid_rdate; // 등록일
	private Date paid_mate; // 수정일
	private long paid_hit; // 조회수
	private long paid_rec; // 추천수
	private long paid_price; // 유료 소설 가격
	
}
