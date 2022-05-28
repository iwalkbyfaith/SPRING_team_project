package com.novel.enroll.mapper;

import java.util.List;

import com.novel.enroll.domain.EnrollAttachVO;

public interface EnrollAttachMapper {
	
	// ■ 첨부파일 입력
	public void insert(EnrollAttachVO vo);
	
	// ■ 첨부파일 삭제 
	public void delete(String uuid);
	
	// ■ 첨부파일을 조회 (글 번호를 입력 받아, 그 밑에 딸린 애들 줄줄이 받음)
	public List<EnrollAttachVO> findByBno(long enroll_num);

}
