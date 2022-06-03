package com.novel.paid.domain;

import lombok.Data;

// ■ 검색
@Data
public class SearchCriteria extends Criteria{
	private String searchType;
	private String keyword;
}
