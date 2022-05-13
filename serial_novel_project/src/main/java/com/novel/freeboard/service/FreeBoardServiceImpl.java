package com.novel.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.freeboard.domain.Criteria;
import com.novel.freeboard.domain.FreeBoardVO;
import com.novel.freeboard.domain.SearchCriteria;
import com.novel.freeboard.mapper.FreeBoardMapper;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Autowired
	private FreeBoardMapper freeboardMapper;

	@Override
	public List<FreeBoardVO> getList(SearchCriteria cri) {
		return freeboardMapper.getList(cri);
	}

	@Override
	public void insert(FreeBoardVO vo) {
		freeboardMapper.insert(vo);
		
	}

	@Override
	public FreeBoardVO select(long free_board_num) {
		return freeboardMapper.select(free_board_num);
	}

	@Override
	public void delete(long free_board_num) {
		freeboardMapper.delete(free_board_num);
		
	}

	@Override
	public void update(FreeBoardVO vo) {
		freeboardMapper.update(vo);
		
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return freeboardMapper.countPageNum(cri);
	}
	
}
