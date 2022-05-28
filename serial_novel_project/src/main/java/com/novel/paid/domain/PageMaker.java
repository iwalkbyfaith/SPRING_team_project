package com.novel.paid.domain;

import lombok.Data;

@Data
public class PageMaker {
	private long totalBoard;
	private long startPage;
	private long endPage;
	private boolean prev;
	private boolean next;
	
	private long displayPageNum;
	
	private SearchCriteria cri;
	
	
	
	public void calcData() {
		
		this.displayPageNum = 10;
		
		
		this.endPage = (long)(Math.ceil(cri.getPageNum() / (double)displayPageNum) * displayPageNum);
		
		
		this.startPage = (endPage - displayPageNum) + 1;
		
		
		long tempEndPage = (long)(Math.ceil(totalBoard / (double)cri.getNumber()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		
		prev = startPage == 1 ? false : true;
		
		
		next = endPage * cri.getNumber() >= totalBoard ? false : true;
		
	}// calcData()
	
	
	public void setTotalBoard(long totalBoard) {
		this.totalBoard = totalBoard;	
		calcData();
	}
	
}
