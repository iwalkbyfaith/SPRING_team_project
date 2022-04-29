package com.ict.mapper;

import java.util.List;

import com.ict.domain.FreeNovelVO;
import com.ict.domain.SearchCriteria;

public interface FreeNovelMapper {
	
		public List<FreeNovelVO> getList(SearchCriteria cri);
		
		public void insert (FreeNovelVO vo);
		
		public FreeNovelVO select(long free_num);
		
		public void delete(long free_num);
		
		public void update(FreeNovelVO vo);
		
		public int countPageNum(SearchCriteria cri);
		
		
		
}
