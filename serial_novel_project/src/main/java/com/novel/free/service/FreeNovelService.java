package com.novel.free.service;

import java.util.List;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;


public interface FreeNovelService {
	public List<FreeNovelJoinVO> selectList(String novelCategory);
	
	public List<FreeNovelJoinVO> getList(SearchCriteria cri);  	// 페이징 전용 getList
	
	public int countPageNum(SearchCriteria cri);				// 페이징 숫자 			  
		
	public List<FreeNovelJoinVO> selectDetail(long freeSNum, long novelNum);	// 원하는 무료소설 디테일 선택
	
	public List<FreeNovelJoinVO> select(long novelNum);			// 원하는 무료소설 정보선택

	public void insertNovel(NovelVO vo);						// 소설 정보 입력
	
	public void insertFree(FreeNovelVO vo);						// 무료 소설 Detail입력(내용,소제목 등등)
	
	public void delete(long free_snum);							// 무료 소설 n회차 삭제 
	
	public void update(FreeNovelVO vo);							// 무료 소설 수정
	
}
