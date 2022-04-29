package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.domain.NovelVO;
import com.ict.domain.SearchCriteria;
import com.ict.mapper.NovelMapper;

@Service
public class NovelServiceImpl implements NovelService{
	
	@Autowired
	private NovelMapper mapper;

	@Override
	public List<NovelVO> getList(SearchCriteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return mapper.countPageNum(cri);
	}

	@Override
	public NovelVO select(int novel_Num) {
		return mapper.select(novel_Num);
	}

	@Override
	public void insert(NovelVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(int novel_Num) {
		mapper.delete(novel_Num);
	}

	@Override
	public void update(NovelVO vo) {
		mapper.update(vo);
		
	}

	
}
