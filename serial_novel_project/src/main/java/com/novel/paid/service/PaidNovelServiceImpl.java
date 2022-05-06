package com.novel.paid.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.novel.paid.domain.PaidNovelInnerVO;
import com.novel.paid.domain.PaidNovelVO;
import com.novel.paid.domain.SearchCriteria;
import com.novel.paid.mapper.PaidNovelMapper;

@Service
public class PaidNovelServiceImpl implements PaidNovelService{
	
	@Autowired
	private PaidNovelMapper paidMapper;

	@Override
	public List<PaidNovelVO> getList(SearchCriteria cri) {
		return paidMapper.getList(cri);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return paidMapper.countPageNum(cri);
	}

	@Override
	public PaidNovelInnerVO select(long paid_num) {
		return paidMapper.select(paid_num);
	}

	@Override
	public void insert(PaidNovelVO vo) {
		paidMapper.insert(vo);
	}

	@Override
	public void delete(long paid_num) {
		paidMapper.delete(paid_num);
	}

	@Override
	public void update(PaidNovelVO vo) {
		paidMapper.update(vo);
	}
}
