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
	public List<NovelVO> listNovel() {
		return mapper.getList();
	}

	@Override
	public void insertNovel(NovelVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void updateNovel(NovelVO vo) {
		mapper.update(vo);
	}

	@Override
	public int countPageNum(SearchCriteria cri) {
		return mapper.countPageNum(cri);
	}
}
