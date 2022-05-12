package com.novel.tournament.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;

public interface TournamentMapper {
	
	// ■ 전체 리스트 가져오기
		public List<TournamentVO> getList();
		
	// ■ 각 토너먼트 작품 조회 전, 이미 추천한 기록이 있는지 확인하기
		public TournamentWorkRecVO checkRec(@Param("to_num")long to_num, @Param("user_id")String user_id);
		
	// ■ 특정 토너먼트 참여 작품 가져오기('시작' 버튼 클릭시 적재하는 버전)
		public List<TournamentJoinVO> getToWorkList(long to_num);
		
		// ● 새로운 토너먼트 참여시 상위 n개의 row를 적재하기 
		//	 1) 토너먼트 번호(2:4강, 3:2강)
		//   2) 상위 n개를 자를 rownum(8강시 8, 4강시 4, 2강시 2)
		public void insertNewRow(@Param("to_num") long to_num, @Param("rownum")int rownum);
		
	// ■ 특정 토너먼트 참여 작품 가져오기(단순 가져오기)
		public List<TournamentJoinVO> get2and4WorkList(long to_num);
		
	// ■ 8강 토너먼트 참여 작품 가져오기
		public List<TournamentJoinVO> getToWorkList2();
		
	// ■ 대회 참여 작품 추천수 +1 하기
		public void upRec(long towork_num);
		
		// ■ 추천수 +1 할 때, 해당 추천 기록 적재하기
		public void insertUpRecRecord(TournamentWorkRecVO vo);
		
	// ■ 추천수를 +1했을때 취소하는 것 만들고 싶은데 키워드가 뭔지
		
	// ■ 예상 우승 작품 가져오기
		public TournamentJoinVO getWinner();

}
