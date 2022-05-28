package com.novel.tournament.domain;

import lombok.Data;

@Data		 
public class TournamentJoinVO {	// ◀ 토너먼트&토너먼트작품&노블 조인 테이블
	
	private long to_num;		 	// 토너먼트 넘버 ( 1=8강 / 2=4강 / 3=2강(결승)	- 토너먼트
	private String to_name;			// 토너먼트 이름 ( 1=웹소설 최강자 8강전)			- 토너먼트
	private long towork_num;		// 토너먼트 작품 번호 							- 토너먼트 작품
	private String novel_title;		// 토너먼트 작품 제목							- 노블
	private String novel_writer;	// 토너먼트 작품 작가							- 노블
	private long towork_rec;		// 토너먼트 작품 추천수							- 토너먼트 작품

	// 05.14
	private long novel_num;			// 토너먼트 소설 번호							- 노블
	

}
