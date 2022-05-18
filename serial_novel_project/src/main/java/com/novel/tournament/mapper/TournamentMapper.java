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
		
	// ■ 05.14 토너먼트 8강에 들어갈 작품 적재하기
		public List<Integer> select8ToworkRecord();	// 8강에 들어갈 작품번호(novel_num) 리스트 반환
		public void insert8Towork(TournamentWorkVO vo);
		
	// ■ 05.14 토너먼트 조회(이미 추가되었는지 확인하기 위해)
		public List<TournamentWorkVO> getTournamentData(long to_num);
	
	// ■ 05.14 특정 토너먼트 대상 작품 가져오기
		public List<TournamentJoinVO> getTowork2or4or8(long to_num);
		
	// ■ 05.14 토너먼트 2강 or 4강에 들어갈 작품 적재하기
		// 4강 적재시 to_num=1, rownum=4 / 2강 적재시 to_num=2, rownum=2
		public void insertTowork2or4(@Param("to_num") long to_num, @Param("rownum")int rownum);
		
	// ■ 각 토너먼트 작품 조회 전, 이미 추천한 기록이 있는지 확인하기
		public TournamentWorkRecVO checkRec(@Param("to_num")long to_num, @Param("user_id")String user_id);
		
	// ■ 대회 참여 작품 추천수 +1 하기
		public void upRec(long towork_num);
		
		// ■ 추천수 +1 할 때, 해당 추천 기록 적재하기
		public void insertUpRecRecord(TournamentWorkRecVO vo);
		
	// ■ 예상 우승 작품 가져오기
		public TournamentJoinVO getWinner();
		
		
	// ■ 05.16 대회 우승시 사후처리 
		// ● 작품 관련
			// 1) novel_tbl에서 week=free -> week=mon(예시)로 바꿈 		(테코 완) 
			public void updateWeek(@Param("week")String week, @Param("novel_num")long novel_num);
			
			// 2) auth_tbl에서 작가의 등급을 ROLE_PAID_WRITER로 변경하기
				// 2-1) 우승 작품의 작품번호(novel_num)을 얻어와서 		(테코 완)
				public long getWinnersNovelNum();
				// 2-2) novel_tbl에서 해당 작품 번호의 아이디를 가져온 후	(테코 완)
				public String getWinnersUserId(long novel_num);
				// 2-3) auth_tbl에서 해당 유저의 등급을 변경한다.			(테코 완)
				public void updateWinnersAuth(String user_id);
				
			// 3) free_tbl에서 연재했던 데이터 삭제						(테코 완)
				public void deleteWinnersFreeData(long novel_num);	
		
		// ● 대회 관련
			// 1) 다음 토너먼트를 위해서 tourna_tbl의 to_sdate(시작일), to_edate(종료일)를 업데이트 해줌  (테코 완)
				// 쿼리문 하나만 씀) 종료일을 기준으로 8강, 4강, 2강, 준비기간의 시작일/종료일에 +n을 함
				public void updateTournaDate(
										@Param("addSdate")int addSdate, 
										@Param("addEdate")int addEdate, 
										@Param("to_num")int to_num);
			// 2) torec_tbl(추천 기록)의 데이터를 비워줌											  (테코 완)
				public void deleteTorecTbl();
		
			// 3) towork_tbl(대회 출전 기록)의 데이터를 비워줌										  (테코 완)
				public void deleteToworkTbl();
		
		
		
		
		

		
		
		
		
		
//		// ■ 특정 토너먼트 참여 작품 가져오기('시작' 버튼 클릭시 적재하는 버전)
//				public List<TournamentJoinVO> getToWorkList(long to_num);
//				
//				// ● 새로운 토너먼트 참여시 상위 n개의 row를 적재하기 
//				//	 1) 토너먼트 번호(2:4강, 3:2강)
//				//   2) 상위 n개를 자를 rownum(8강시 8, 4강시 4, 2강시 2)
//				public void insertNewRow(@Param("to_num") long to_num, @Param("rownum")int rownum);
//				
//		// ■ 특정 토너먼트 참여 작품 가져오기(단순 가져오기)
//			public List<TournamentJoinVO> get2and4WorkList(long to_num);
//			
//		// ■ 8강 토너먼트 참여 작품 가져오기
//			public List<TournamentJoinVO> getToWorkList2();

}
