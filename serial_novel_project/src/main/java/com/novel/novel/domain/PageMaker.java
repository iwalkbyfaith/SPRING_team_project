package com.novel.novel.domain;

import lombok.Data;

@Data
public class PageMaker {
	private int totalBoard;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	// 만약 페이지 하단 버튼개수를 유동적으로 가지고 싶은경우
	// displaypageNum을 선언합니다.
	private int displayPageNum;
	// Criteria에서 현재 조회중인 페이지 정보 + 한 페이지에 깔리는 글 수를 받아와야함	
	private SearchCriteria cri;
	
	
	// 필요한 모든 사항을 계산해주는 메서드
	public void calcData() {
		// 한 페이지에 하단에 깔고싶은 버튼 개수
		this.displayPageNum = 10;
		
		// 현재페이지(cri.getPageNum())을 근거로 페이지 그룹중 끝나는 페이지를 구함.
		// 끝페이지 = 올림((현재페이지 / 출력페이지, 실수)) * 출력페이지
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)displayPageNum) * displayPageNum);
		
		// 끝나는 페이지를 토대로 페이지 그룹의 시작페이지를 구함.
		// 시작페이지 = (끝페이지 – 출력페이지개수) +1;
		this.startPage = (endPage - displayPageNum) + 1;
		
		// 위의 endPage는 명목상의(단순 그룹계산으로) 끝나는 페이지이기떄문에 실질적인 글 개수를 통해 보정해줘야함
		int tempEndPage = (int)(Math.ceil(totalBoard / (double)cri.getNumber()));
		// 실 마무리 페이지 보정
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		// next, prev 버튼 여부 처리
		// prev는 startPage가 1인 경우에만 비활성화 이므로 삼항연산자로 간단히 처리합니다.
		prev = startPage == 1 ? false : true;
		
		// next는 여태까지 출력한 페이지에 속한 글 갯수보다 DB내 전체 글이 더 많은 경우에 활성화
		next = endPage * cri.getNumber() >= totalBoard ? false : true;
		
	}// calcData()
	
	
	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;	
		calcData(); // prev, next, endPage, startPage를 다 구해버림
	}
	
}
