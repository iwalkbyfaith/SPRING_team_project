package com.novel.paid.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.mapper.PaidNovelMapper;


@Service
public class PaidNovelServiceImpl implements PaidNovelService{
	
	@Autowired
	private PaidNovelMapper paidMapper;

	
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
	public List<PaidVO> selectPaidList(String novelNum) {
		return paidMapper.selectPaidList(novelNum);
	}





	
}
