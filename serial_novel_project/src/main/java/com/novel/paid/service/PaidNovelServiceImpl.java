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
	public List<PaidVO> getPaidList() {
		return paidMapper.getPaidList();
	}
	
}
