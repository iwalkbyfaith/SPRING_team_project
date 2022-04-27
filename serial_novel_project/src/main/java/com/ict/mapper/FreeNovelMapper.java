package com.ict.mapper;

import java.util.List;

import com.ict.domain.FreeNovelVO;

public interface FreeNovelMapper {
	
	public List<FreeNovelVO> getList();
	
	public void insert(FreeNovelVO vo);
	
	public FreeNovelVO select(long free_board_num);
	
	public void delete(long free_board_num);
	
	public void update(FreeNovelVO vo);
	
	


}
