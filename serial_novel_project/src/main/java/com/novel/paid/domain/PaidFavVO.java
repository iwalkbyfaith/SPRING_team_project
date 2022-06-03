package com.novel.paid.domain;

import lombok.Data;

@Data
public class PaidFavVO {
	private long fav_num; // ◎ 선호 번호 (PK)
	private long novel_num; // ◎ 소설 (FK)
	private long user_num; // ◎ 회원번호 (FK)
}
