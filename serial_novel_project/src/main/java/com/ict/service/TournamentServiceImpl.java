package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.domain.TournamentJoinVO;
import com.ict.domain.TournamentVO;
import com.ict.mapper.TournamentMapper;

@Service
public class TournamentServiceImpl implements ITournamentService{

	@Autowired
	private TournamentMapper mapper;
	
	
	// ■ 전체 리스트 가져오기
	@Override
	public List<TournamentVO> listTournament() {
		
		return mapper.getList();
	}

	// ■ 전체 토너먼트 참여 작품 가져오기
	@Override
	public List<TournamentJoinVO> listTournamentWork() {
		return mapper.getToWorkList();
	}

}
