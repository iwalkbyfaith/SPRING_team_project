package com.novel.novel.service;

import java.util.List;

import com.novel.novel.domain.NovelVO;

public interface WeekService {
	
	public List<NovelVO> getList(int novelEnd);
	
	
}
