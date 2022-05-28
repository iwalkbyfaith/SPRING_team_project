package com.novel.novel.mapper;

import java.util.List;

import com.novel.novel.domain.MainBestNovelVO;
import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;

public interface NovelMapper {
	
	public List<NovelVO> getNovelList(SearchCriteria cri);
	
	public NovelVO detailNovel(long novel_num);
	
	public void insertNovel(NovelVO vo);
	
	public void deleteNovel(long novel_num);
	
	public void updateNovel(NovelVO vo);
	
	public int countPageNum(SearchCriteria cri);
	
	
	// ■ 05.26 메인에 추가될 데이터들
	
		// ● 무료소설 조회수 베스트
		public List<MainBestNovelVO> getBestViewFreeData();
		
		// ● 무료소설 추천수 베스트
		public List<MainBestNovelVO> getBestRecFreeData();
		
		// ● 유료소설 조회수 베스트
		public List<MainBestNovelVO> getBestViewPaidData();
		
		// ● 유료소설 추천수 베스트
		public List<MainBestNovelVO> getBestRecPaidData();
	

	
}
