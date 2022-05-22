package com.novel.enroll.mapper;

import java.util.List;

import com.novel.enroll.domain.EnrollVO;

public interface EnrollMapper {
	
	// ■ 전체 리스트 가져오기
	public List<EnrollVO> getAllEnrollList();
	
	// ■ 상세 리스트 가져오기
	public EnrollVO getEnrollDetail(long enroll_num);
	
	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	public void insertEnrollFormData(EnrollVO vo);

}
