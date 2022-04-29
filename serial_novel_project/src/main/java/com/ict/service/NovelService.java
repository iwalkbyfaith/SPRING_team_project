package com.ict.service;

import java.util.List;

import com.ict.domain.NovelVO;
import com.ict.domain.SearchCriteria;

public interface NovelService {
	
	public List<NovelVO> getList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	public NovelVO select(int novel_Num);
	
	public void insert(NovelVO vo);
	
	public void delete(int novel_Num);
	
	public void update(NovelVO vo);
}
