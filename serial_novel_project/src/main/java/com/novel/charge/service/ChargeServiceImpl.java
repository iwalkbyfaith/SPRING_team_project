package com.novel.charge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.domain.UseVO;
import com.novel.charge.mapper.ChargeMapper;
import com.novel.user.domain.UserVO;

@Service
public class ChargeServiceImpl implements ChargeService{
	
	@Autowired
	private ChargeMapper mapper;
	
	@Override
	public void insertPay(ChargeVO vo) {
		mapper.insertPay(vo);
	}

	@Override
	public void addCoin(UserVO vo) {
		mapper.addCoin(vo);
	}

	@Override
	public void removeCoin(UserVO vo) {
		mapper.removeCoin(vo);
	}

	@Override
	public void insertUse(UseVO uVo) {
		mapper.insertUse(uVo);
		
	}



}
