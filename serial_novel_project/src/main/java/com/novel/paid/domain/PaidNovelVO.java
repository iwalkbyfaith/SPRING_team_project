package com.novel.paid.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PaidNovelVO {
	private int paid_num;
	private int novel_nom;
	private int paid_snum;
	private String paid_title;
	private String paid_content;
	private Date paid_rdate;
	private Date paid_mate;
	private int paid_hit;
	private int paid_rec;
	private int paid_price;
	
}
