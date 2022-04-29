package com.novel.paid.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.paid.mapper.PaidNovelMapper;

@Service
public class PaidNovelServiceImpl implements PaidNovelService{
	
	@Autowired
	private PaidNovelMapper PaidMapper;
}
