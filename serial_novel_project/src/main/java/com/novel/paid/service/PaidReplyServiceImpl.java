package com.novel.paid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.paid.domain.PaidReplyVO;
import com.novel.paid.mapper.PaidReplyMapper;

@Service
public class PaidReplyServiceImpl implements PaidReplyService{
	
	@Autowired
	private PaidReplyMapper replyMapper;
	
	
	@Override
	public List<PaidReplyVO> getList(long novelNum, long paidNum) {
		return replyMapper.getList(novelNum, paidNum);
	}

	@Override
	public void create(PaidReplyVO vo) {
		replyMapper.create(vo);
	}

	@Override
	public void delete(long preplNum) {
		replyMapper.delete(preplNum);
	}

	@Override
	public void update(PaidReplyVO vo) {
		replyMapper.update(vo);	
	}

	
	
}
