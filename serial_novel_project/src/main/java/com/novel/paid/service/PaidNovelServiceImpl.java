package com.novel.paid.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;
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
	public List<PaidVO> getJoinList(SearchCriteria cri) {
		return paidMapper.getJoinList(cri);
	}

	@Override
	public void insertPaid(PaidVO vo) {
		paidMapper.insertPaid(vo);
	}

	@Override
	public PaidVO selectDetail(long paidNum, long novelNum) {
		return paidMapper.selectDetail(paidNum,novelNum);
	}

	@Override
	public List<PaidVO> select(long novelNum) {
		return paidMapper.select(novelNum);
	}

	@Override
	public void delete(long paidnum) {
		paidMapper.delete(paidnum);
	}


	@Override
	public int countPageNum(SearchCriteria cri) {
		return paidMapper.countPageNum(cri);
	}

	@Override
	public PaidVO detailCon(long paidNum) {
		return paidMapper.detailCon(paidNum);
	}

	@Override
	public void update(PaidVO vo, long paidNum) {
		paidMapper.update(vo, paidNum);
	}
	
	
}
