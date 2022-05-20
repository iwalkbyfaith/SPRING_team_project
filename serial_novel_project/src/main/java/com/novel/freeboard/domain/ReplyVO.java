package com.novel.freeboard.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private long repl_num;
	private long free_board_num;
	//댓글타입?
	//회차별 글번호?
	private String repl_content;
	private String repl_writer;
	private Date repl_rdate;
	private Date repl_mdate;

}
