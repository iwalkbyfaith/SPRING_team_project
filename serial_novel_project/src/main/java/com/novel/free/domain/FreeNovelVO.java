package com.ict.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FreeNovelVO {
	private Long free_num;
    private Long novel_num;
    private Long free_snum; 
    private String free_title;
    private String free_content;
    private Date free_rdate; 
    private Date free_mdate; 
    private Long free_hit; 
    private Long free_rec; 
    
}
