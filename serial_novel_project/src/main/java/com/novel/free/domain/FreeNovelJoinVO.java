package com.novel.free.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeNovelJoinVO {
	
	     
    private long novel_num; 			  // 소설 번호 (fk)
    private String novel_writer;		  // 소설 작가
    private String novel_title; 	  	  // 소설 제목
    
}
