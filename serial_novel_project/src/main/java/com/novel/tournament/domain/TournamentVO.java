package com.novel.tournament.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class TournamentVO { // ◀ 토너먼트 대회 테이블
	
	private long to_num;		// 토너먼트 번호
	private String to_name;		// 토너먼트 이름
	private Date to_sdate;		// 토너먼트 시작 날짜
	private Date to_edate;		// 토너먼트 종료 날짜

}
