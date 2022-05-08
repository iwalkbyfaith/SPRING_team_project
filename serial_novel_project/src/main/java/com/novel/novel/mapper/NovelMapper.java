package com.novel.novel.mapper;

import java.util.List;


import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;

public interface NovelMapper {
	
	public List<NovelVO> getList(SearchCriteria cri); // 소설 전체 조회
	
	public int countPageNum(SearchCriteria cri); // 소설 전체 갯수
	 
	public void insert(NovelVO vo); // 소설 등록
	
	public NovelVO select(long novel_num); // 특정 소설 상세 조회
	
	public void delete(long novel_num); // 소설 삭제
	
	public void update(NovelVO vo); // 소설 수정
	
	public List<NovelVO> getMonList();
}
