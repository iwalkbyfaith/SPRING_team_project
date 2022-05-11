package com.novel.paid.mapper;

import java.util.List;

import com.novel.paid.domain.PaidVO;

public interface PaidNovelMapper {
	
	public List<PaidVO> getPaidList();
	
	public void insertPaid(PaidVO vo);
	
	public void deletePaid(long paid_num);
	
	public void updatePaid(PaidVO vo);
	
	
}
