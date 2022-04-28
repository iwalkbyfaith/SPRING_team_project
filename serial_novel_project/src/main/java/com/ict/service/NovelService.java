package com.ict.service;

import java.util.List;

import com.ict.domain.NovelVO;
import com.ict.domain.SearchCriteria;

public interface NovelService {
	
	
	public int countPageNum(SearchCriteria cri); 
	
	public List<NovelVO> listNovel();
	
	public void insertNovel(NovelVO vo);
	
	public void updateNovel(NovelVO vo);
}
