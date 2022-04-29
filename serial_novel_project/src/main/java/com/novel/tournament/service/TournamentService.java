package com.novel.tournament.service;

import java.util.List;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;

public interface TournamentService {

	// ■ 전체 리스트 가져오기
	public List<TournamentVO> listTournament();
	
	// ■ 전체 토너먼트 리스트 가져오기
	public List<TournamentJoinVO> listTournamentWork();
}
