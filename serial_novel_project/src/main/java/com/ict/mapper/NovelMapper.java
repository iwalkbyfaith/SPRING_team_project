package com.ict.mapper;

import java.util.List;

import com.ict.domain.NovelVO;
import com.ict.domain.SearchCriteria;

public interface NovelMapper {
	
	public List<NovelVO> getList();
	
	public void insert(NovelVO vo);
	
	public void update(NovelVO vo);
	
	public int countPageNum(SearchCriteria cri);
}
