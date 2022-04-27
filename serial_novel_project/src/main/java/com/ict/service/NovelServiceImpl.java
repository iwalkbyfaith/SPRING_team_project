package com.ict.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mapper.NovelMapper;

@Service
public class NovelServiceImpl implements NovelService{
	
	@Autowired
	private NovelMapper mapper;
}
