package com.novel.free.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeNovelJoinVO {
	private long free_snum;					// 무료 소설 회차
    private Date free_rdate;				// 게시일
    private String free_content1; 		 	// 무료 소설 내용1
    private String free_content2; 		 	// 무료 소설 내용2
    private String free_hit; 		  		// 조회수
    private String free_rec; 		  		// 추천수
    private int novel_end;					// 완결 여부
    private String novel_writer;		  	// 소설 작가
    private long novel_num; 			  	// 소설 번호 (fk)
    private String novel_title; 	  	  	// 소설 제목
    
    
}
