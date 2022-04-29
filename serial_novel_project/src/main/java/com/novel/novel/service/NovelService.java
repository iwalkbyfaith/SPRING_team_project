package com.novel.novel.service;

import java.util.List;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;

public interface NovelService {
	
	public List<NovelVO> getList(SearchCriteria cri); // 소설 전체 목록 
	
	public int countPageNum(SearchCriteria cri); // 페이징을 위한 페이지갯수
	
	public NovelVO select(long novel_num); // 특정 소설 정보 
	
	public void insert(NovelVO vo); // 소설 등록
	
	public void delete(long novel_num); // 소설 삭제
	
	public void update(NovelVO vo); // 소설 수정
}
