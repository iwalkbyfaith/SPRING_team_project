package com.novel.novel.mapper;

import java.util.List;


import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;

public interface NovelMapper {
	
	public List<NovelVO> getList(SearchCriteria cri); //
	
	public int countPageNum(SearchCriteria cri);
	
	public void insert(NovelVO vo);
	
	public NovelVO select(long bno);
	
	public void delete(long bno);
	
	public void update(NovelVO vo);
}
