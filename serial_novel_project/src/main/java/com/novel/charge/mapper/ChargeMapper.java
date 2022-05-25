package com.novel.charge.mapper;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.domain.UseVO;
import com.novel.user.domain.UserVO;

public interface ChargeMapper {
	
	public void insertPay(ChargeVO vo);
	
	// ■ 결제 성공시 해당 유저 코인 발급
	public void addCoin(UserVO vo);
	
	// ■ 소설 결제시 해당 유저 코인 차감
	public void removeCoin(UserVO vo);
	
	// ■ 소설 결제시 use_tbl 목록 적재
	public void insertUse(UseVO uVo);
}
