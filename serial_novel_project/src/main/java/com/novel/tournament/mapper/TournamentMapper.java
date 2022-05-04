package com.novel.tournament.mapper;

import java.util.List;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;

public interface TournamentMapper {
	
	// ■ 전체 리스트 가져오기
		public List<TournamentVO> getList();
		
	// ■ 전체 토너먼트 참여 작품 가져오기
		public List<TournamentJoinVO> getToWorkList();

}
