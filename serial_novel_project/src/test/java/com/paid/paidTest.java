package com.paid;

import java.security.Principal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.paid.domain.PaidFavVO;
import com.novel.paid.mapper.PaidNovelMapper;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class paidTest {
	
	@Autowired
	private PaidNovelMapper mapper;
	
	//@Test
	public void getxxxx(){
		String user_id = "user0";
		log.info(user_id);
		
		long user_num = mapper.getUserNumber(user_id);
		log.info(user_num);
		
		//PaidFavVO fav= mapper.favList(1, user_num);
		//log.info(fav);
		
	}

}
