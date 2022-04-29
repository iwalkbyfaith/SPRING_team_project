package com.ict.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.domain.FreeNovelVO;
import com.ict.domain.SearchCriteria;
import com.ict.mapper.FreeNovelMapper;

@Service
public class FreeNovelServiceImpl implements FreeNovelService{

	@Autowired
	private FreeNovelMapper freeNovelMapper;
	@Override
	public List<FreeNovelVO> getList(SearchCriteria cri) {
		
		return freeNovelMapper.getList(cri);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		
		return freeNovelMapper.countPageNum(cri);
	}

	@Override
	public FreeNovelVO select(long free_num) {

		return freeNovelMapper.select(free_num);
	}

	@Override
	public void insert(FreeNovelVO vo) {
		freeNovelMapper.insert(vo);
		
	}

	@Override
	public void delete(long free_num) {
		freeNovelMapper.delete(free_num);
		
	}

	@Override
	public void update(FreeNovelVO vo) {
		freeNovelMapper.update(vo);
		
	}

}
