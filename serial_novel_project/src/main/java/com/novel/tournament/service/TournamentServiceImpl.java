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
	
	// ■ 특정 토너먼트 참여 작품 가져오기 ( 4강, 2강 )
	@Transactional
	@Override
	public List<TournamentJoinVO> listTournamentWork(long to_num) {
		int rownum = 0;
			log.info("여기까지 동작");
			if(to_num == 2) {
				rownum = 4;
			}else if(to_num == 3) {
				rownum = 2;
			}
			log.info("TournamentServiceImple) 현재 rownum ->" + rownum);
			mapper.insertNewRow(to_num, rownum);
		return mapper.getToWorkList(to_num);
	}
	
	// ■ 특정 토너먼트 참여 작품 가져오기(단순 가져오기)
	@Override
	public List<TournamentJoinVO> get2and4WorkList(long to_num) {
		return mapper.get2and4WorkList(to_num);
	}
	
	
	// ■ 8강 토너먼트 참여 작품 가져오기
	@Override
	public List<TournamentJoinVO> listTournamentWork2() {
		return mapper.getToWorkList2();
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



	









	




	
	
	

}
