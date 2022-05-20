package com.novel.freeboard.service;

import java.util.List;

import com.novel.freeboard.domain.Criteria;
import com.novel.freeboard.domain.FreeBoardVO;
import com.novel.freeboard.domain.SearchCriteria;

public interface FreeBoardService {


		// 전체 글 조회
		public List<FreeBoardVO> getList(SearchCriteria cri);
		
		// 글 작성
		public void insert(FreeBoardVO vo);
		
		// 하나의 글만 조회
		public FreeBoardVO select(long free_board_num);
		
		// 글 삭제
		public void delete(long free_board_num);
		
		// 글 수정
		public void update(FreeBoardVO vo);
		
		//전체 글 개수를 얻어오는 countPageNum를 선언
		public int countPageNum(SearchCriteria cri);
}
