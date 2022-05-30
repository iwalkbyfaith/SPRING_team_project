package com.novel.charge.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	
	// ■ 소설 결제시 use_tbl 목록 조회
	public UseVO useList(@Param("paid_num")long paid_num,@Param("user_num") long user_num);
	
	// ■ 유료소설 구매내역을 보여주기 위한 조회
	public List<UseVO> useList2(long user_num);
	
	// ■ 유저의 결제내역을 보여주기 위한 조회
	public List<ChargeVO> chargeList(long user_num);
}
