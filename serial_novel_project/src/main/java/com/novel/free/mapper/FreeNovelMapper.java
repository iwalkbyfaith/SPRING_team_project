package com.novel.free.mapper;

import java.util.List;


import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.SearchCriteria;

public interface FreeNovelMapper {
	public List<FreeNovelVO> getList(SearchCriteria cri);
	
	
	public void insert(FreeNovelVO vo);
	
	// select구문은 글 번호를 입력받아서 해당 글 "하나"에 대한 정보만 얻어올 예정이므로 
	// 리턴자료형은 글 하나를 담당할수있는 BoardVO로 해야 함.
	public FreeNovelVO select(long free_num);
	
	
	// 글 삭제는 DELETE 구문으로 하는데, 비 SELECT구문이므로 리턴자료를 void로 적습니다.
	// 하나의 글만 삭제할 예정이므로, 살제할 글 정보를 호출시 같이 입력하게 합니다.
	public void delete(long free_num);
	
	public void update(FreeNovelVO vo);
		
	public int countPageNum(SearchCriteria cri);
		
}
