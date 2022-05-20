package com.novel.paid.mapper;

import java.util.List;

import com.novel.paid.domain.PaidAttachVO;



public interface PaidAttachMapper {
	
	// ■ 첨부파일 입력
	public void insert(PaidAttachVO vo);
	
	// ■ 첨부파일 삭제 
	public void delete(String uuid);
	
	// ■ 첨부파일을 조회 (글 번호를 입력 받아, 그 밑에 딸린 애들 줄줄이 받음)
	public List<PaidAttachVO> findByBno(long paid_num);

}
