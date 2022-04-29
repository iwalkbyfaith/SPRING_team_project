package com.ict.mapper;

import java.util.List;

import com.ict.domain.NovelVO;
import com.ict.domain.SearchCriteria;

public interface NovelMapper {
	
	public List<NovelVO> getList(SearchCriteria cri);
	
	public int countPageNum(SearchCriteria cri);
	
	public void insert(NovelVO vo);
	
	public NovelVO select(int novel_num);
	
	public void delete(int novel_num);
	
	public void update(NovelVO vo);
}
