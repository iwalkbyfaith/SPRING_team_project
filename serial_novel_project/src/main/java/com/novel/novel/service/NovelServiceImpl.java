package com.novel.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.domain.SearchCriteria;
import com.novel.novel.mapper.NovelMapper;

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
	public NovelVO select(long novel_num) {
		return mapper.select(novel_num);
	}

	@Override
	public void insert(NovelVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(long novel_num) {
		mapper.delete(novel_num);
	}

	@Override
	public void update(NovelVO vo) {
		mapper.update(vo);
	}

	@Override
	public List<NovelVO> getMonList() {
		return mapper.getMonList();
	}

	
	


	
}
