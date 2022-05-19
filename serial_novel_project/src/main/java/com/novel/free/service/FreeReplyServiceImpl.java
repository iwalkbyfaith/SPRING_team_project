package com.novel.free.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.free.domain.FreeReplyVO;
import com.novel.free.mapper.FreeReplyMapper;

@Service
public class FreeReplyServiceImpl implements FreeReplyService{

	@Autowired
	private FreeReplyMapper replymapper;
	
	
	
	
	@Override
	public void addReply(FreeReplyVO vo) {
		
		replymapper.create(vo);
		
	}

	@Override
	public List<FreeReplyVO> listReply(Long free_num) {
 
		return replymapper.getList(free_num);
	}

	@Override
	public void modifyReply(FreeReplyVO vo) {
		
		replymapper.update(vo);
		
	}

	@Override
	public void removeReply(Long frepl_num) {
		
		replymapper.delete(frepl_num);
		
	}

}
