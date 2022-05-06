package com.novel.paid.mapper;

import java.util.List;


import com.novel.paid.domain.PaidNovelInnerVO;
import com.novel.paid.domain.PaidNovelVO;
import com.novel.paid.domain.SearchCriteria;

public interface PaidNovelMapper {
	
	public List<PaidNovelVO> getList(SearchCriteria cri);
	
	public void insert(PaidNovelVO vo);
	
	public PaidNovelInnerVO select(long paid_num);
	
	public void delete(long paid_num);
	
	public void update(PaidNovelVO vo);
	
	public int countPageNum(SearchCriteria cri);
	
	
}
