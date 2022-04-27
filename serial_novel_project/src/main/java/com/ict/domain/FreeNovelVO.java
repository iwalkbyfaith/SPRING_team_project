package com.ict.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeNovelVO {
	  private Long free_board_num ;
	  private String free_board_title; 
	  private String free_board_content;
	  private String free_board_writer; 
	  private Date free_board_rdate; 
	  private Date free_board_mdate;
	  private Long free_board_hit; 
}
