package com.novel.enroll.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.enroll.domain.EnrollVO;
import com.novel.enroll.mapper.EnrollMapper;

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

}
