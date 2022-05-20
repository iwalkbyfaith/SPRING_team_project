package com.novel.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.freeboard.domain.ReplyVO;
import com.novel.freeboard.mapper.FreeBoardMapper;
import com.novel.freeboard.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{

	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private FreeBoardMapper freeboardMapper;
	
	@Override
	public List<ReplyVO> getList(long free_board_num) {
		return replyMapper.getList(free_board_num);
	}

	@Override
	public void create(ReplyVO vo) {
		replyMapper.create(vo);
		
	}

	@Override
	public void update(ReplyVO vo) {
		replyMapper.update(vo);
		
	}

	@Override
	public void delete(long repl_num) {
		replyMapper.delete(repl_num);
		
	}

}
