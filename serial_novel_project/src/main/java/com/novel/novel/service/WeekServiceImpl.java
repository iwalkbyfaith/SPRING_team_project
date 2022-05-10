package com.novel.novel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.novel.domain.NovelVO;
import com.novel.novel.mapper.WeekMapper;

@Service
public class WeekServiceImpl implements WeekService {

	@Autowired
	private WeekMapper weekmapper;

	@Override
	public List<NovelVO> getList(int novelEnd) {
		return weekmapper.getList(novelEnd);
	}

	

}
