package com.novel.paid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.charge.domain.UseVO;
import com.novel.paid.domain.PaidFavVO;
import com.novel.paid.domain.PaidRecVO;
import com.novel.paid.domain.PaidVO;
import com.novel.paid.domain.SearchCriteria;


public interface PaidNovelMapper {
	
	// ■ 요일별 리스트데이터 
	public List<PaidVO> selectMon(SearchCriteria cri);
	public List<PaidVO> selectTue(SearchCriteria cri);
	public List<PaidVO> selectWed(SearchCriteria cri);
	public List<PaidVO> selectThu(SearchCriteria cri);
	public List<PaidVO> selectFri(SearchCriteria cri);
	
	public List<PaidVO> selectWeekList(String novelWeek); // ■ paidWeek
	
	public PaidVO selectDetail(
			@Param("paidNum")long paidNum ,@Param("novelNum") long novelNum);  // ■ paidDetail로 넘어감
	
	public PaidVO detailCon(long paidNnum); // ■ paidDetail 에서 본문 가져오기
	
	public List<PaidVO> selectPaidList(long novelNum); // ■ paidList (해당요일별소설(공통)의 하위리스트(snum))
	
	public int countPageNum(@Param("cri")SearchCriteria cri, @Param("novelNum")long novelNum); // ■ 페이징을 위한 글 갯수
	
	public void insert(PaidVO vo); // ■ paid 상세 회차 작성
	
	public void delete(long paid_snum); // ■ paid 상세 회차 삭제
	
	public void update(PaidVO vo); // ■ paid 상세 회차 수정
	
	public void upHit(long paid_num); // ■ 조회수
	
	public void addRec(PaidRecVO vo); // ■ 유료추천테이블 적재
	
	public void plusRec(long paid_num); // ■ 유료소설테이블 추천수 올리기 
	
	public PaidRecVO recList(@Param("paid_num")long paid_num,@Param("user_num") long user_num); // ■ 유료소설테이블 조회
	
	public void addFav(PaidFavVO vo); // ■ 선호 테이블 적재
	
	public void delFav(@Param("novel_num")long novel_num,@Param("user_num")long user_num); // ■ 선호작 삭제
	
	public PaidFavVO favList(@Param("novelNum")long novelNum, @Param("user_id") String user_id); // ■ 선호작 조회
	
	// ■ 유저 아이디로 유저 번호 가져오기
	public long getUserNumber(String user_id);
	
	
}
