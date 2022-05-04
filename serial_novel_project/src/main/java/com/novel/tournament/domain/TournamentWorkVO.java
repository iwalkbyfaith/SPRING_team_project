package com.novel.tournament.domain;

import lombok.Data;

@Data
public class TournamentWorkVO {
	
	private long towork_num;		// 토너먼트-작품 번호
	private long to_num;			// 토너먼트 번호 (fk : tourna_tbl)
	private long novel_num;			// 작품 번호	  (fk : novel_tbl)
	private long towork_rec;		// 토너먼트-작품 추천수

}
