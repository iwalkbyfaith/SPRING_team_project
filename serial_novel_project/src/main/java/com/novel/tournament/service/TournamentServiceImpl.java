package com.novel.tournament.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;
import com.novel.tournament.mapper.TournamentMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TournamentServiceImpl implements TournamentService{

	@Autowired
	private TournamentMapper mapper;
	
	
	// ■ 전체 리스트 가져오기
	@Override
	public List<TournamentVO> listTournament() {
		
		return mapper.getList();
	}
	
	// ■ 05.14 토너먼트 8강에 들어갈 작품 적재하기
		@Override
		public List<Integer> select8ToworkRecord() {
			return mapper.select8ToworkRecord();
		}
	
		@Override
		public void insert8Towork(TournamentWorkVO vo) {
			mapper.insert8Towork(vo);
		}
		
	// ■ 05.14 토너먼트 조회(이미 추가되었는지 확인하기 위해)
	@Override
	public List<TournamentWorkVO> getTournamentData(long to_num) {
		return mapper.getTournamentData(to_num);
	}
	
	// ■ 05.14 특정 토너먼트 대상 작품 가져오기
	@Override
	public List<TournamentJoinVO> getTowork2or4or8(long to_num) {
		return mapper.getTowork2or4or8(to_num);
	}
	
	//■ 05.14 토너먼트 2강 or 4강에 들어갈 작품 적재하기
		// 4강 적재시 to_num=1, rownum=4 / 2강 적재시 to_num=2, rownum=2
	@Override
	public void insertTowork2or4(long to_num, int rownum) {
		mapper.insertTowork2or4(to_num, rownum);	
	}
	
	// ■ 각 토너먼트 작품 조회 전, 이미 추천한 기록이 있는지 확인하기
	@Override
	public TournamentWorkRecVO checkRec(long to_num, String user_id) {
		return mapper.checkRec(to_num, user_id);
	}

	// ■ 대회 참여 작품 추천수 +1 하기
	@Override
	public void upRec(long towork_num) {
		mapper.upRec(towork_num);
	}
	
		// ■ 추천수 +1 할 때, 해당 추천 기록 적재하기
		@Override
		public void insertUpRecRecord(TournamentWorkRecVO vo) {
			mapper.insertUpRecRecord(vo);
		}
	

	// ■ 예상 우승 작품 가져오기
	@Override
	public TournamentJoinVO getWinner() {
		return mapper.getWinner();
  	}
 
	// ■ 05.17 대회 우승시 사후처리 1) 작품 & 작가 관련
	@Transactional
	@Override
	public void afterTowork1(long novel_num) {
		// 1) novel_tbl에서 week=free인 것을 변경해준다
		mapper.updateWeek("mon", novel_num);
		
		// 2) auth_tbl에서 작가의 등급을 ROLE_PAID_WRITER로 변경하기
			// 2-1) 우승 작품의 작품번호(novel_num)을 얻어와서
			long winnersNovelNum = mapper.getWinnersNovelNum();
			
			// 2-2) novel_tbl에서 해당 작품 번호의 아이디를 가져온 후
			String winnersUserId = mapper.getWinnersUserId(winnersNovelNum);
			
			// 2-3) auth_tbl에서 해당 유저의 등급을 변경한다.
			mapper.updateWinnersAuth(winnersUserId);
		
		// 3) free_tbl에서 연재했던 데이터 삭제
		mapper.deleteWinnersFreeData(winnersNovelNum);
		
	}
	
		// ■ 우승 작품 노블 번호 가져오기
		@Override
		public long getWinnersNovelNum() {
			return mapper.getWinnersNovelNum();
		}

	// ■ 05.17 대회 우승시 사후처리 2) 대회 관련
	@Transactional
	@Override
	public void afterTowork2() {
		
		// 1) 다음 토너먼트를 위해서 tourna_tbl의 to_sdate(시작일), to_edate(종료일)를 업데이트 해줌
			// 1-1) 8강 업데이트
			mapper.updateTournaDate(1, 8, 1);
			
			// 1-2) 4강 업데이트
			mapper.updateTournaDate(9, 16, 2);
			
			// 1-3) 2강 업데이트
			mapper.updateTournaDate(17, 24, 3);
			
			// 1-4) 준비기간 업데이트
			mapper.updateTournaDate(25, 32, 4);
			
		// 2) torec_tbl 데이터 먼저 삭제
			mapper.deleteTorecTbl();
			
		// 3) towork_tbl 데이터 삭제
			mapper.deleteToworkTbl();
		
		
	}

	
	
	
	
	
	
	
	
//	// ■ 특정 토너먼트 참여 작품 가져오기 ( 4강, 2강 )
//	@Transactional
//	@Override
//	public List<TournamentJoinVO> listTournamentWork(long to_num) {
//		int rownum = 0;
//			log.info("여기까지 동작");
//			if(to_num == 2) {
//				rownum = 4;
//			}else if(to_num == 3) {
//				rownum = 2;
//			}
//			log.info("TournamentServiceImple) 현재 rownum ->" + rownum);
//			mapper.insertNewRow(to_num, rownum);
//		return mapper.getToWorkList(to_num);
//	}
//	
//	// ■ 특정 토너먼트 참여 작품 가져오기(단순 가져오기)
//	@Override
//	public List<TournamentJoinVO> get2and4WorkList(long to_num) {
//		return mapper.get2and4WorkList(to_num);
//	}
//	
//	
//	// ■ 8강 토너먼트 참여 작품 가져오기
//	@Override
//	public List<TournamentJoinVO> listTournamentWork2() {
//		return mapper.getToWorkList2();
//	}



	









	




	
	
	

}
