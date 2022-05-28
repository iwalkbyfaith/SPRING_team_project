package com.novel.novel.mapper;

import java.util.List;

import com.novel.novel.domain.NovelVO;

public interface WeekMapper {
	
	public List<NovelVO> getList(int novelEnd);
	
	
}
