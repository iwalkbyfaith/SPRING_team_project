package com.novel.bestseller.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BestSellerVO { // ◀ 베스트 셀러
	
	private int bs_num;						// pk
	private String item_id;					// 아이템 아이디 (숫자)
	private String title;					// 제목
	private String author;					// 저자
	private String category_id;				// 카테고리 번호
	private int price;						// 가격
	private Date pub_date;					// 출판일
	private String publisher;				// 출판사
	private double customer_review_rank;	// 고객 리뷰 점수
	private int rank_num;					// 카테고리 별 랭크
	
	
	// 집계 함수용 변수
	private double rank_by_category;		// 카테고리별 랭크 (고객 리뷰 점수)
}
