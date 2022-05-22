package com.novel.paid.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;
import com.novel.paid.mapper.PaidNovelMapper;
import com.novel.paid.mapper.PaidReplyMapper;


@Service
public class PaidNovelServiceImpl implements PaidNovelService{
	
	@Autowired
	private PaidNovelMapper paidMapper;
	
	@Autowired
	private PaidReplyMapper replyMapper;

	
	@Override
	public List<PaidVO> selectList(String novelWeek) {
		return paidMapper.selectList(novelWeek);
	}

	@Override
	public PaidVO selectDetail(long paidNum, long novelNum) {
		return paidMapper.selectDetail(paidNum,novelNum);
	}

	@Override
	public PaidVO detailCon(long paidNum) {
		return paidMapper.detailCon(paidNum);
	}

	@Override
	public List<PaidVO> selectWeekList(String novelWeek) {
		return paidMapper.selectWeekList(novelWeek);
	}

	@Override
	public List<PaidVO> selectPaidList(long novelNum) {
		return paidMapper.selectPaidList(novelNum);
	}

	@Override
	public void insert(PaidVO vo) {
		paidMapper.insert(vo);
		
	}
	
	@Override
	public void delete(long paid_snum) {
		paidMapper.delete(paid_snum);
		
	}

	@Override
	public void update(PaidVO vo) {
		paidMapper.update(vo);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri, long novelNum) {
		return paidMapper.countPageNum(cri, novelNum);
	}





	
}
