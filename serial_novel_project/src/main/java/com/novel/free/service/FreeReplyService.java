package com.novel.free.service;

import java.util.List;



import com.novel.free.domain.FreeReplyVO;


public interface FreeReplyService {

	public void addReply(FreeReplyVO vo);
	
	public List<FreeReplyVO> listReply(Long free_num);
	
	public void modifyReply(FreeReplyVO vo);
	
	public void removeReply(Long frepl_num);
	
}
