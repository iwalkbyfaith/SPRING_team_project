package com.novel.novel.mapper;

import java.util.List;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;

public interface NovelMapper {
	
	public List<NovelVO> getNovelList(SearchCriteria cri);
	
	public NovelVO detailNovel(long novel_num);
	
	public void insertNovel(NovelVO vo);
	
	public void deleteNovel(long novel_num);
	
	public void updateNovel(NovelVO vo);
	
	public int countPageNum(SearchCriteria cri);
	

	
}
