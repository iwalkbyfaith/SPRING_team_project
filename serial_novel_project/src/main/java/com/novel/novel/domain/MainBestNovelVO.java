package com.novel.novel.domain;

import lombok.Data;

@Data
public class MainBestNovelVO { // ◀ 메인 화면에 뿌려줄 베스트 노블
	
	private long novel_num;			// 노블 번호
	private String novel_title;		// 노블 제목
	private long total_view;		// 총 조회수
	private long total_rec;			// 총 추천수 

}
