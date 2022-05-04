package com.novel.tournament.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.mapper.TournamentMapper;

@Service
public class TournamentServiceImpl implements TournamentService{

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
