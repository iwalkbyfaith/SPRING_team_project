package com.novel.enroll.service;

import java.util.List;


import com.novel.enroll.domain.EnrollVO;

public interface EnrollService {
	
	// ■ 전체 리스트 가져오기
	public List<EnrollVO> getAllEnrollList();
	
	// ■ 상세 리스트 가져오기
	public EnrollVO getEnrollDetail(long enroll_num);

}
