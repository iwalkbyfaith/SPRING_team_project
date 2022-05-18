package com.novel.tournament.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;

public interface TournamentService {

	// ■ 전체 리스트 가져오기
	public List<TournamentVO> listTournament();
	
	// ■ 05.14 토너먼트 8강에 들어갈 작품 적재하기
	public List<Integer> select8ToworkRecord();		// 8강에 들어갈 작품번호(novel_num) 리스트 반환
	public void insert8Towork(TournamentWorkVO vo);	// 적재
	
	// ■ 05.14 토너먼트 조회(이미 추가되었는지 확인하기 위해)
	public List<TournamentWorkVO> getTournamentData(long to_num);
	
	// ■ 05.14 특정 토너먼트 대상 작품 가져오기
	public List<TournamentJoinVO> getTowork2or4or8(long to_num);
	
	// ■ 05.14 토너먼트 2강 or 4강에 들어갈 작품 적재하기
	// 4강 적재시 to_num=1, rownum=4 / 2강 적재시 to_num=2, rownum=2
	public void insertTowork2or4(@Param("to_num") long to_num, @Param("rownum")int rownum);
		
	// ■ 각 토너먼트 작품 조회 전, 이미 추천한 기록이 있는지 확인하기
	public TournamentWorkRecVO checkRec(@Param("to_num")long to_num, String user_id);
	
	// ■ 대회 참여 작품 추천수 +1 하기
	public void upRec(long towork_num);
	
		// ■ 추천수 +1 할 때, 해당 추천 기록 적재하기
		public void insertUpRecRecord(TournamentWorkRecVO vo);
	
	// ■ 예상 우승 작품 가져오기
	public TournamentJoinVO getWinner();
	
	
	
	// ■ 05.17 대회 우승시 사후처리 1) 작품 & 작가 관련 // 파라미터 : novel_num
	public void afterTowork1(long novel_num);
		// ■ 우승 작품 노블 번호 가져오기
		public long getWinnersNovelNum();
	
	// ■ 05.17 대회 우승시 사후처리 2) 대회 관련 // 파라미터 : 없음 
	public void afterTowork2();
	
	
	
	
	
	
	
	
	
//	// ■ 특정 토너먼트 리스트 가져오기('시작' 버튼 클릭시 적재하는 버전)
//	public List<TournamentJoinVO> listTournamentWork(long to_num);
//	
//	// ■ 특정 토너먼트 참여 작품 가져오기(단순 가져오기)
//	public List<TournamentJoinVO> get2and4WorkList(long to_num);
//	
//	// ■ 8강 토너먼트 리스트 가져오기
//	public List<TournamentJoinVO> listTournamentWork2();
	
}
