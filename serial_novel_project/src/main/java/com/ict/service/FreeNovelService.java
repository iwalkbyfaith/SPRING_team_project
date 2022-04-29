package com.ict.service;

import java.util.List;

import com.ict.domain.FreeNovelVO;
import com.ict.domain.SearchCriteria;


public interface FreeNovelService {
	
	public List<FreeNovelVO> getList(SearchCriteria cri);
	public int countPageNum(SearchCriteria cri);
	public FreeNovelVO select(long free_num);
	public void insert(FreeNovelVO vo);
	public void delete(long free_num);
	public void update(FreeNovelVO vo);
	
}
