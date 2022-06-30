package com.novel.bestseller.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.bestseller.domain.BestSellerVO;
import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;

public interface BestSellerService {
	
	// ■ 카테고리별 소비자 별점 가져오기
	public List<BestSellerVO> getRankByCategory();

	// ■ 샘플 데이터 가져오기
	public List<BestSellerVO> getSampleData();
}
