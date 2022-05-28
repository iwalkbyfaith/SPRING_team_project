package com.novel.enroll.domain;

import java.util.List;

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
	
	
	// 05.20 EnrollVO에 첨부파일이 있는지 확인하는 변수 추가
		// 첨부파일을 여러개 할 수 있으므로 List로 받는다.
	private List<EnrollAttachVO> attachList;

}
