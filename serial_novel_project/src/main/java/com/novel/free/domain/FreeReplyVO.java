package com.novel.free.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeReplyVO {
	private long frepl_num;			// 무료 소설 댓글번호 
	private long novel_num;			// 소설 번호
	private long free_num;			// 무료 소설 번호 
	private String frepl_content; 	// 댓글 내용
	private String user_id;			// 댓글작성자 아이디
	private Date frepl_rdate;		// 댓글 작성일 
	private Date frepl_ㅡdate;		// 댓글 수정일 
}
