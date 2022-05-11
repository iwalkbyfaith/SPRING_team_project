package com.novel.paid.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaidNovelJoinVO {
	
	private long paid_num;          	  // 무료 소설 번호     
    private long novel_num; 			  // 소설 번호 (fk)
    private String novel_writer;		  // 소설 작가
    private String novel_title; 	
	
}
