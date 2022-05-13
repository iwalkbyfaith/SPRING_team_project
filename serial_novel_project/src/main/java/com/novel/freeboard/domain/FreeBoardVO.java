package com.novel.freeboard.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeBoardVO {

	private long free_board_num;
	private String free_board_title;
	private String free_board_content;
	private String free_board_writer;
	private Date free_board_rdate;
	private Date free_board_mdate;
	private long free_board_hit;
}
