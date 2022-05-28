package com.novel.free.mapper;

import java.util.List;

import com.novel.free.domain.FreeReplyVO;

public interface FreeReplyMapper {

	
	public List<FreeReplyVO> getList(Long free_num);
	
	public void create(FreeReplyVO vo);
	
	public void update(FreeReplyVO vo);
	
	// 댓글 삭제시는 단일 댓글 하나만 삭제.
	public void delete(Long frepl_num);
	
	public void deleteAll(Long free_num);
	
	// public Long getBno(Long rno);  << 댓글개수 세는 로직 일단 나중에 생각
}
