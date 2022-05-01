package com.novel.free.domain;

import java.sql.Date;

public class FreeNovelJoinVO {

	private long free_num;            // 무료 소설 번호     
    private long novel_num; 		  // 소설 번호 (fk)
    private long free_snum; 		  // 무료 소설 회차
    private String free_title;	  	  // 무료 소설 소제목
    private String free_content;	  // 무료 소설 내용
    private Date free_rdate; 		  // 무료 소설 게시일
    private Date free_mdate; 		  // 무료 소설 수정일
    private long free_hit; 			  // 무료 소설 조회수
    private long free_rec; 			  // 무료 소설 추천수
	private String novel_writer;	// 소설 작가
    private String novel_title; 	// 소설 제목
    private long novel_tsnum; 		// 소설 연재 편수
    private String novel_category;	// 소설 장르
    private String novel_week; 		// 소설 연재 요일
    private long novel_end; 		// 소설 완결 유무 (char(1) default ‘0’)

}
