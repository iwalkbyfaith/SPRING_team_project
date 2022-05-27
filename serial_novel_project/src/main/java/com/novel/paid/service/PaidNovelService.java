package com.novel.paid.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.paid.domain.PaidRecVO;
import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;

public interface PaidNovelService {
	
	public List<PaidVO> selectList(String novelWeek); // ■ paidList에서 쓸것 
	
	public List<PaidVO> selectWeekList(String novelWeek); // ■ paidWeek
	
	public PaidVO selectDetail(
			@Param("paidNum")long paidNum ,@Param("novelNum") long novelNum);  // ■ paidDetail로 넘어감
	
	public PaidVO detailCon(long paidNnum); // ■ paidDetail 에서 본문 가져오기
	
	public List<PaidVO> selectPaidList(long novelNum); // ■ paidList (해당요일별소설(공통)의 하위리스트(snum))
	
	public int countPageNum(@Param("cri")SearchCriteria cri, @Param("novelNum") long novelNum); // ■ 페이징을 위한 글 갯수
	
	public void insert(PaidVO vo); // ■ paid 상세 회차 작성
	
	public void delete(long paid_snum); // ■ paid 상세 회차 삭제
	
	public void update(PaidVO vo); // ■ paid 상세 회차 수정
	
	public void upHit(long paid_num); // ■ 조회수
	
	public void addRec(PaidRecVO vo); // ■ 유료추천테이블 적재
	
	public void plusRec(long paid_num); // ■ 유료소설테이블 추천수 올리기 
	
	public PaidRecVO recList(@Param("paid_num")long paid_num,@Param("user_num") long user_num); // ■ 유료소설테이블 조회
}
