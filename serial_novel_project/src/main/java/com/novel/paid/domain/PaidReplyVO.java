package com.novel.paid.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaidReplyVO {
	
	private long prepl_num; // ◎ 유료소설 댓글번호 (PK)
	private long novel_num; // ◎ 소설번호 (FK)
	private long paid_pnum; // ◎ 유료소설 회차번호 (FK)
	private String prepl_content; // ◎ 유료소설 댓글내용
	private String prepl_writer; // ◎ 유료소설 댓글작성자
	private Date prepl_rdate; // ◎ 유료소설 댓글 작성일 
	private Date prepl_mdate; // ◎ 유료소설 댓글 수정일
	
}
