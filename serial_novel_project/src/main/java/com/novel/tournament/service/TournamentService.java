package com.novel.tournament.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;

public interface TournamentService {

	// ■ 전체 리스트 가져오기
	public List<TournamentVO> listTournament();
	
	// ■ 각 토너먼트 작품 조회 전, 이미 추천한 기록이 있는지 확인하기
	public TournamentWorkRecVO checkRec(@Param("to_num")long to_num, String user_id);
	
	
	// ■ 특정 토너먼트 리스트 가져오기('시작' 버튼 클릭시 적재하는 버전)
	public List<TournamentJoinVO> listTournamentWork(long to_num);
	
	// ■ 특정 토너먼트 참여 작품 가져오기(단순 가져오기)
	public List<TournamentJoinVO> get2and4WorkList(long to_num);
	
	// ■ 8강 토너먼트 리스트 가져오기
	public List<TournamentJoinVO> listTournamentWork2();
	
	// ■ 대회 참여 작품 추천수 +1 하기
	public void upRec(long towork_num);
	
		// ■ 추천수 +1 할 때, 해당 추천 기록 적재하기
		public void insertUpRecRecord(TournamentWorkRecVO vo);
	
	// ■ 예상 우승 작품 가져오기
	public TournamentJoinVO getWinner();
	
}
