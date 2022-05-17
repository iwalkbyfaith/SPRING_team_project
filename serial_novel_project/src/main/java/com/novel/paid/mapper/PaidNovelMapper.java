package com.novel.paid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;

public interface PaidNovelMapper {
	
	public List<PaidVO> selectList(String novelWeek);
	
	public List<PaidVO> getJoinList(SearchCriteria cri);
	
	public void insertPaid(PaidVO vo);	
	
	public PaidVO selectDetail(
			@Param("paidNum")long paidNum ,@Param("novelNum") long novelNum); 
	
	public List<PaidVO> select(long novelNum);
	
	public void delete(long paidnum);
	
	public void update(PaidVO vo, @Param("paidNum") long paidNum); 
	
	public int countPageNum(SearchCriteria cri);
	
	public PaidVO detailCon(long paidNnum); // paidDetail 에서 본문 가져오기
}
