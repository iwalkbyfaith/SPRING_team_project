package com.novel.user.domain;

import lombok.Data;

@Data
public class FavorVO {
	
	private long novel_num; 		// 소설 번호
    private String novel_writer;	// 소설 작가
    private String novel_title; 	// 소설 제목
    private long novel_tsnum; 		// 소설 연재 편수
    private String novel_category;	// 소설 장르
    private String novel_week; 		// 소설 연재 요일
    private long novel_end; 		// 소설 완결 유무 (char(1) default ‘0’)
    private String user_id;			// 유저 아이디

}
