package com.novel.paid.domain;

import lombok.Data;

@Data
public class PaidRecVO {
	private long rec_num; // ◎ 추천번호 (PK)
	private long user_num; // ◎ 유저번호 (FK)
	private long paid_num; // ◎ 유료소설번호 (FK)
}
