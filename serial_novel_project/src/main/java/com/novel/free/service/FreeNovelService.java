package com.novel.free.service;

import java.util.List;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;


public interface FreeNovelService {
	public List<FreeNovelJoinVO> getList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	public FreeNovelJoinVO select(long free_num);
		
	public void insertNovel(NovelVO vo);
	
	public void insertFree(FreeNovelVO vo);
	
	public void delete(long free_num);
	
	public void update(FreeNovelVO vo);
	
}
