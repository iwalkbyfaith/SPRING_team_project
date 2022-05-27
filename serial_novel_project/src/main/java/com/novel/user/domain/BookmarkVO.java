package com.novel.user.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BookmarkVO {
	private long free_num;            // 무료 소설 번호     
    private long novel_num; 		  // 소설 번호 (fk)
    private long free_snum; 		  // 무료 소설 회차
    private String free_title;	  	  // 무료 소설 소제목
    private String free_content1;	  // 무료 소설 내용1
    private String free_content2;	  // 무료 소설 내용2
    private Date free_rdate; 		  // 무료 소설 게시일
    private Date free_mdate; 		  // 무료 소설 수정일
    private long free_hit; 			  // 무료 소설 조회수
    private long free_rec; 			  // 무료 소설 추천수
	
    private long fbm_num;			  // 무료 소설 책갈피 번호 (Primarykey) 			
    
}
