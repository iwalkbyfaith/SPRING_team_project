package com.novel.freeboard.service;

import java.util.List;

import com.novel.freeboard.domain.ReplyVO;

public interface ReplyService {
	
	// 하나의 글에 달려있는 댓글 전체 조회하기
		public List<ReplyVO> getList(long free_board_num);
		
		// 댓글 작성
		public void create(ReplyVO vo);
		
		// 댓글 수정
		public void update(ReplyVO vo);
		
		// 댓글 삭제
		public void delete(long repl_num);
		
		
}
