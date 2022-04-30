package com.novel.novel.domain;

import lombok.Data;

@Data
public class NovelVO {
	private long novel_num; // 소설(공통) 번호
	private String novel_writer; // 소설 글쓴이
	private String novel_title; // 소설 제목
	private long novel_tsnum; // 소설 총 회차
	private String novel_category; // 소설 장르
	private String novel_week; // 소설 연재요일
	private long novel_end; // 소설 완결유무
}
