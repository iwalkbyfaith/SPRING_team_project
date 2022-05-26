package com.novel.charge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.mapper.ChargeMapper;

@Service
public class ChargeServiceImpl implements ChargeService{
	
	@Autowired
	private ChargeMapper mapper;
	
	@Override
	public void insertPay(ChargeVO vo) {
		mapper.insertPay(vo);
	}

}
