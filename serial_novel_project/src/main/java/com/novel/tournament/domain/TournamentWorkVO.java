package com.novel.tournament.domain;

import lombok.Data;

@Data
public class TournamentWorkVO { // ◀ 토너먼트 대회 출천 작품 테이블
	
	private long towork_num;		// 토너먼트-작품 번호
	private long to_num;			// 토너먼트 번호 				- 토너먼트
	private long novel_num;			// 작품 번호	  				- 노블
	private long towork_rec;		// 토너먼트-작품 추천수

}
