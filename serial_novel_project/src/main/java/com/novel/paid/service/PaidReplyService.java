package com.novel.paid.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.paid.domain.PaidReplyVO;

public interface PaidReplyService {
	
	// ■ 댓글 리스트
	public List<PaidReplyVO> getList(@Param("novelNum")long novelNum, @Param("paidNum")long paidNum);
	
	// ■ 댓글 작성
	public void create(PaidReplyVO vo);
	
	// ■ 댓글 삭제
	public void delete(long preplNum);
	
	// ■ 댓글 수정
	public void update(PaidReplyVO vo);
	
}
