package com.novel.enroll.domain;

import lombok.Data;

@Data
public class EnrollVO {	// ◀ 작가 신청 테이블
	
	private long enroll_num;			// 작가 신청 번호
	private String novel_writer;		// 작가 이름(필명)
	private String novel_title;			// 작품 제목
	private String novel_category;		// 작품 카테고리
	private String user_id;				// 유저 아이디
	private String enroll_intro;		// 작품 설명/소개
	private long enroll_result;			// 선정 결과  ( 0:승인 대기 / 1:승인 거부 / 2:무료 승인 / 3:유료 승인 ) => 3은 고민중
	private String enroll_msg;			// 선정 메세지 (관리자가 남기는 메세지. null값 허용)

}
