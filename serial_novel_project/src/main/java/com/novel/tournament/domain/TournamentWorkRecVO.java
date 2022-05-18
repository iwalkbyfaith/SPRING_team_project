package com.novel.tournament.domain;

import java.sql.Date;

import lombok.Data;

@Data			 
public class TournamentWorkRecVO { // ◀ 토너먼트 작품 추천 기록
	
	private long torec_num;		// 추천 번호
	private String user_id;		// 유저 아이디				- 유저
	private long to_num;		// 토너먼트 대회 번호		- 토너먼트
	private long towork_num;	// 토너먼트 작품 번호		- 토너먼트 작품
	private Date rec_date;		// 추천일
	
	// 05.14 추가
	private long novel_num;		// 소설 번호				- 노블

}
