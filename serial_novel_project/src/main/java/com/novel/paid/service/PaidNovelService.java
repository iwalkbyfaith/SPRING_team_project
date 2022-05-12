package com.novel.paid.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;

public interface PaidNovelService {
	
	public List<PaidVO> selectList(String novelWeek);
	
	public List<PaidVO> getJoinList(SearchCriteria cri);
	
	public void insertPaid(PaidVO vo);	
	
	public List<PaidVO> selectDetail(
			@Param("paidSNum")long paidSNum ,@Param("novelNum") long novelNum); 
	
	public List<PaidVO> select(long novelNum);
	
	public void delete(long paid_snum);
	
	public void update(PaidVO vo); 
	
	public int countPageNum(SearchCriteria cri);
}
