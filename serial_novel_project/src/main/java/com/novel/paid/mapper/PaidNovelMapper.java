package com.novel.paid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.novel.paid.domain.PaidVO;


public interface PaidNovelMapper {
	
	public List<PaidVO> selectList(String novelWeek); // ■ paidList에서 쓸것 
	
	public List<PaidVO> selectWeekList(String novelWeek); // ■ paidWeek
	
	public PaidVO selectDetail(
			@Param("paidNum")long paidNum ,@Param("novelNum") long novelNum);  // ■ paidDetail로 넘어감
	
	public PaidVO detailCon(long paidNnum); // ■ paidDetail 에서 본문 가져오기
	
	public List<PaidVO> selectPaidList(long novelNum); // ■ paidList (해당요일별소설(공통)의 하위리스트(snum)) 
}
