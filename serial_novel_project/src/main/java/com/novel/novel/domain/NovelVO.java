package com.novel.novel.domain;

import lombok.Data;

@Data
public class NovelVO {
	private int novel_num;
	private String novel_writer;
	private String novel_title;
	private int novel_tsnum;
	private String novel_category;
	private String novel_week;
	private int novel_end;
}
