package com.novel.tournament.service;

import java.util.List;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;

public interface TournamentService {

	// ■ 전체 리스트 가져오기
	public List<TournamentVO> listTournament();
	
	// ■ 특정 토너먼트 리스트 가져오기
	public List<TournamentJoinVO> listTournamentWork(long to_num);
	
	// ■ 8강 토너먼트 리스트 가져오기
	public List<TournamentJoinVO> listTournamentWork2();
	
	// ■ 대회 참여 작품 추천수 +1 하기
	public void upRec(long towork_num);
	
	// ■ 예상 우승 작품 가져오기
	public TournamentJoinVO getWinner();
	
}
