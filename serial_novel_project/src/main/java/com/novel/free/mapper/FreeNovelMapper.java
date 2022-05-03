package com.novel.free.mapper;

import java.util.List;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;

public interface FreeNovelMapper {
	
	public List<FreeNovelJoinVO> getJoinList(SearchCriteria cri); // 무료 소설 리스트 받아오기 
	
	
	public void insertNovel(NovelVO vo);	 		//소설 정보 입력(작가,제목 등등..)
	
	public void insertFree(FreeNovelVO vo);	 		// 무료 소설 쓰기(소제목, 내용 등등..) 
	
	public FreeNovelJoinVO select(long free_num); 	// 원하는 작품정보 가져오기 
	
	public void delete(long free_snum); 				// 작품 n회차 지우기 
	
	public void update(FreeNovelVO vo); 			// 작품 수정하기
		
	public int countPageNum(SearchCriteria cri);	// 작품 페이지 


	
		
}
