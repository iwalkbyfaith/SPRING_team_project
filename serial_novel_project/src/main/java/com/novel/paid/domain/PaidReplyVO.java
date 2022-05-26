package com.novel.paid.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaidReplyVO {
	
	private long prepl_num;
	private long novel_num;
	private long paid_pnum;
	private String prepl_content;
	private String prepl_writer;
	private Date prepl_rdate;
	private Date prepl_mdate;
	
}
