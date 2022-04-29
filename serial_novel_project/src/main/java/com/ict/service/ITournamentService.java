package com.ict.service;

import java.util.List;

import com.ict.domain.TournamentJoinVO;
import com.ict.domain.TournamentVO;

public interface ITournamentService {

	// ■ 전체 리스트 가져오기
	public List<TournamentVO> listTournament();
	
	// ■ 전체 토너먼트 리스트 가져오기
	public List<TournamentJoinVO> listTournamentWork();
}
