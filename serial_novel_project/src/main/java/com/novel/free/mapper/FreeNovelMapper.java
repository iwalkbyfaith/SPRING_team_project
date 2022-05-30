package com.novel.free.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.FreeRecVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.domain.SearchCriteria;
import com.novel.user.domain.FavorVO;

public interface FreeNovelMapper {
	public List<NovelVO> selectList(String novelCategory);							// 카테고리별 소설 리스트 받아오기                     
	
	public List<FreeNovelJoinVO> getJoinList(SearchCriteria cri); 					// 무료 소설 리스트 받아오기(페이징용) 
	
	
	public void insertNovel(NovelVO vo);	 										//소설 정보 입력(작가,제목 등등..)
	
	public void insertFree(FreeNovelVO vo);	 										// 무료 소설 쓰기(소제목, 내용 등등..) 
	
	public List<FreeNovelJoinVO> selectDetail(
		@Param("freeSNum")long freeSNum ,@Param("novelNum") long novelNum); 		// 원하는 작품정보 가져오기 
	
	public List<FreeNovelJoinVO> select(long novelNum); 							// 원하는 작품정보 가져오기 
	
	public List<NovelVO> selecttitle(long novelNum); 								// 원하는 작품 제목,작가만 가져오기(novel_tbl에서만 가져옴.) 
	
	public void delete(long freeNum); 												// 작품 n회차 지우기 
	
	public void update(FreeNovelVO vo); 											// 작품 수정하기
	
	public void addhit(FreeNovelVO vo); 											// 조회수 올리기.
		
	public int countPageNum(SearchCriteria cri);									// 작품 페이지 

	// ■ 무료소설 추천한 아이디 리스트 불러오기
	public List<FreeRecVO> selectRecList(long free_num);
	
	// ■ 무료소설 추천한 아이디 테이블에 저장
	public void insertRec(FreeRecVO vo);	
	
	// ■ 무료소설 추천을 하면 동시에 무료소설의 추천수가 올라야함.
	public void addRec(FreeRecVO vo);
	
	// ■ 무료소설 추천한 아이디 테이블에 삭제
	public void deleteRec(FreeRecVO vo);
	
	// ■ 무료소설 추천을 하면 동시에 무료소설의 추천수가 내려가야함.
	public void subtractRec(FreeRecVO vo);
	
		
}
