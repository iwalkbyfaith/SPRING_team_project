package com.novel.paid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.paid.domain.PaidReplyVO;

public interface PaidReplyMapper {
	
	public List<PaidReplyVO> getList(@Param("novelNum")long novelNum, @Param("paidNum")long paidNum);
	
	public void create(PaidReplyVO vo);
	
	public void delete(long preplNum);
	
	public void update(PaidReplyVO vo);
	
}
