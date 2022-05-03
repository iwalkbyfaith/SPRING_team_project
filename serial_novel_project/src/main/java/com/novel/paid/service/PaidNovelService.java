package com.novel.paid.service;

import java.util.List;


import com.novel.paid.domain.PaidNovelInnerVO;
import com.novel.paid.domain.PaidNovelVO;
import com.novel.paid.domain.SearchCriteria;

public interface PaidNovelService {
	
	public List<PaidNovelVO> getList(SearchCriteria cri); // 소설 전체 목록 
	
	public int countPageNum(SearchCriteria cri); // 페이징을 위한 페이지갯수
	
	public PaidNovelInnerVO select(long paid_num); // 특정 소설 정보 
	
	public void insert(PaidNovelVO vo); // 소설 등록
	
	public void delete(long paid_num); // 소설 삭제
	
	public void update(PaidNovelVO vo); // 소설 수정
}
