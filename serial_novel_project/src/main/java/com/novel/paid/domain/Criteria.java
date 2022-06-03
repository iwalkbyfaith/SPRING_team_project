package com.novel.paid.domain;

import lombok.Data;
// 페이징처리를 위한 Criteria
@Data
public class Criteria {
	private long pageNum = 1;
	private long number = 10;
	
	public long getPageStart() {
		return(this.pageNum - 1) * number;
	}
	
	public long getPageEnd() {
		return(this.pageNum * number);
	}
}
