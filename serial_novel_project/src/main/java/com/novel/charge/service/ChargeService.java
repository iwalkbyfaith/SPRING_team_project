package com.novel.charge.service;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.domain.UseVO;
import com.novel.user.domain.UserVO;

public interface ChargeService {
	
	public void insertPay(ChargeVO vo);
	
	// ■ 결제 성공시 해당 유저 코인 발급 로직
	public void addCoin(UserVO vo);
	
	// ■ 소설 결제시 해당 유저 코인 차감
	public void removeCoin(UserVO vo);
	
	// ■ 소설 결제시 use_tbl 목록 적재
	public void insertUse(UseVO uVo);
}
