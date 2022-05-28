package com.novel.enroll.service;

import java.util.List;


import com.novel.enroll.domain.EnrollVO;

public interface EnrollService {
	
	// ■ 전체 리스트 가져오기
	public List<EnrollVO> getAllEnrollList();
	
	// ■ 상세 리스트 가져오기
	public EnrollVO getEnrollDetail(long enroll_num);
	
	// ■ 05.24 로그인 유저의 '승인대기(enroll_result=0)' 중인 데이터가 있는지 확인하기 -> 있으면 신청 못 함.
	public EnrollVO getEnrollResult0(String user_id);
	
	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	public void insertEnrollFormData(EnrollVO vo);
	
		// ● 관리자 승인 버튼에 따른 enroll_result 변경 & 승인된 경우 novel_tbl에 적재
		public void updateEnrollResult(EnrollVO vo);
	
	// ■ enroll_result값에 따른 리스트 가져오기
	public List<EnrollVO> getEnrollxxList(long enroll_result);
	
<<<<<<< HEAD
=======
	// ■ 05.27 나의 신청 결과 리스트 출력
	public List<EnrollVO> getMyResultList(String user_id);
	
>>>>>>> 5c77970f7fe19881ffa5d5d801379ec1847f78e1
	// ■ 신청 폼 수정하기(승인 대기중인 리스트만 가능함)
	public void updateEnrollForm(EnrollVO vo);
	
	// ■ 신청 폼 삭제하기(승인 대기중인 리스트만 가능함)
	public void deleteEnrollForm(long enroll_num);
	
	
	
	
	
	
//	// ■ enroll_result가 2(무료 승인)인 경우 novel_tbl에 free로 적재하기
//	//	 나중에 3(유료 승인)을 쓸 수도 있으므로 일단 결과값 받도록
//	public void insertEnrollResult(EnrollVO vo);

}
