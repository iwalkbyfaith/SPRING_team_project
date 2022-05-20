package com.novel.free.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data  								  // ■ 무료 소설 연재 
public class FreeNovelVO {
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
    
    
	// 05.20 EnrollVO에 첨부파일이 있는지 확인하는 변수 추가
		// 첨부파일을 여러개 할 수 있으므로 List로 받는다.
    private List<FreeAttachVO> attachList;
    
    
}
