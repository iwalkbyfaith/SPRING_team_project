package com.novel.bestseller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.bestseller.domain.BestSellerVO;
import com.novel.bestseller.mapper.BestSellerMapper;
import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;
import com.novel.tournament.mapper.TournamentMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BestSellerServiceImpl implements BestSellerService{
	
	@Autowired
	private BestSellerMapper mapper;
	
	
	// ■ 카테고리별 소비자 별점 가져오기
	public List<BestSellerVO> getRankByCategory() {
		return mapper.getRankByCategory();
	}

	
	// ■ 샘플 데이터 가져오기
	@Override
	public List<BestSellerVO> getSampleData() {
		return mapper.getSampleData();
	}


	



	
	
	

}
