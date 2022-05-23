package com.novel.enroll.service;

import java.util.List;


import com.novel.enroll.domain.EnrollVO;

public interface EnrollService {
	
	// ■ 전체 리스트 가져오기
	public List<EnrollVO> getAllEnrollList();
	
	// ■ 상세 리스트 가져오기
	public EnrollVO getEnrollDetail(long enroll_num);
	
	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	public void insertEnrollFormData(EnrollVO vo);
	
	// ■ 관리자 승인 버튼에 따른 enroll_result 변경 & 승인된 경우 novel_tbl에 적재
	public void updateEnrollResult(EnrollVO vo);
	
	// ■ enroll_result값에 따른 리스트 가져오기
	public List<EnrollVO> getEnrollxxList(long enroll_result);
	
	
	
	
	
	
//	// ■ enroll_result가 2(무료 승인)인 경우 novel_tbl에 free로 적재하기
//	//	 나중에 3(유료 승인)을 쓸 수도 있으므로 일단 결과값 받도록
//	public void insertEnrollResult(EnrollVO vo);

}
