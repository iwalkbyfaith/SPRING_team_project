package com.novel.enroll.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.enroll.domain.EnrollVO;
import com.novel.enroll.mapper.EnrollMapper;
import com.novel.free.domain.NovelVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class EnrollServiceImpl implements EnrollService{
	
	@Autowired
	private EnrollMapper mapper;

	// ■ 전체 리스트 가져오기
	@Override
	public List<EnrollVO> getAllEnrollList() {
		return mapper.getAllEnrollList();
	}

	// ■ 상세 리스트 가져오기
	@Override
	public EnrollVO getEnrollDetail(long enroll_num) {
		return mapper.getEnrollDetail(enroll_num);
	}

	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	@Override
	public void insertEnrollFormData(EnrollVO vo) {
		mapper.insertEnrollFormData(vo);	
	}

	// ■ 관리자 승인 버튼에 따른 enroll_result 변경 & 승인된 경우 novel_tbl에 적재
	@Override
	public void updateEnrollResult(EnrollVO vo) {
		
		// ● 업데이트 진행
		mapper.updateEnrollResult(vo);	
		
		log.warn(vo.getNovel_writer());
		log.warn(vo.getNovel_title());
		log.warn(vo.getNovel_category());
		log.warn(vo.getUser_id());
		log.warn(vo.getEnroll_result());
		
		
		// ● 승인된 경우 novel_tbl에 적재 (2 = 무료 연재 승인)하고, 유저의 권한이 ROLE_USER인 경우 -> ROLE_FREE_WRITER로 바꿔줌
		if(vo.getEnroll_result() == 2) {
			
			NovelVO novel = new NovelVO();
			
			novel.setNovel_writer(vo.getNovel_writer());
			novel.setNovel_title(vo.getNovel_title());
			novel.setNovel_category(vo.getNovel_category());
			novel.setUser_id(vo.getUser_id());
			novel.setNovel_week("free");
			
			log.warn("EnrollVO에서 NovelVO로 세팅한 vo ===> " + novel);
			
			// 적재
			mapper.insertEnrollResult(novel);
			
			// 권한 변경
			mapper.updateUserAuth(vo);
		}
	}

	
	// ■ enroll_result값에 따른 리스트 가져오기
	@Override
	public List<EnrollVO> getEnrollxxList(long enroll_result) {
		return mapper.getEnrollxxList(enroll_result);
	}

	
	// ■ 신청 폼 수정하기(승인 대기중인 리스트만 가능함)
	@Override
	public void updateEnrollForm(EnrollVO vo) {
		mapper.updateEnrollForm(vo);	
	}

	
<<<<<<< HEAD
=======
	// ■ 05.27 나의 신청 결과 리스트 출력
	@Override
	public List<EnrollVO> getMyResultList(String user_id) {
		return mapper.getMyResultList(user_id);
	}
	
	
>>>>>>> 5c77970f7fe19881ffa5d5d801379ec1847f78e1
	// ■ 신청 폼 삭제하기(승인 대기중인 리스트만 가능함)
	@Override
	public void deleteEnrollForm(long enroll_num) {
		mapper.deleteEnrollForm(enroll_num);
	}

	// ■ 05.24 로그인 유저의 '승인대기(enroll_result=0)' 중인 데이터가 있는지 확인하기 -> 있으면 신청 못 함.
	@Override
	public EnrollVO getEnrollResult0(String user_id) {
		return mapper.getEnrollResult0(user_id);
	}

<<<<<<< HEAD
=======

>>>>>>> 5c77970f7fe19881ffa5d5d801379ec1847f78e1
	
	
	

//	// ■ enroll_result가 2(무료 승인)인 경우 novel_tbl에 free로 적재하기
//	//   EnrollVO로 받은 내용들을 novelVO를 만들어서 세팅해줌
//	@Override
//	public void insertEnrollResult(EnrollVO vo) {
//		
//		
//		
//		
//	}

}
