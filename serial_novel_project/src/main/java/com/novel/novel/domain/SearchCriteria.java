package com.novel.novel.domain;

import lombok.Data;

@Data
public class SearchCriteria extends Criteria{
	private String searchType;
	private String keyword;
}
