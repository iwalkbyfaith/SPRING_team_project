package com.novel.freeboard.mapper;

import java.util.List;

import com.novel.freeboard.domain.Criteria;
import com.novel.freeboard.domain.FreeBoardVO;
import com.novel.freeboard.domain.SearchCriteria;

public interface FreeBoardMapper {

	// 전체 글 조회
	public List<FreeBoardVO> getList(Criteria cri);
	
	// 글 작성
	public void insert(FreeBoardVO vo);
	
	// 특정 글 조회
	public FreeBoardVO select(long free_board_num);
	
	// 글 삭제
	public void delete(long free_board_num);
	
	// 글 수정
	public void update(FreeBoardVO vo);
	
	// 전체 글 개수 얻어오기
	public int countPageNum(SearchCriteria cri);
	
	
}
