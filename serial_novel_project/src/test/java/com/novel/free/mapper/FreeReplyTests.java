package com.novel.free.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.free.domain.FreeReplyVO;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FreeReplyTests {
	
	@Autowired
	private FreeReplyMapper mapper;
	
	@Test 
	// ■ 한 회차에 대한 댓글목록 가져오기 
	public void getReplyList() {
		long free_num = 99;
		List<FreeReplyVO> reply = mapper.getList(free_num);
		log.info(reply);
	}
	


}
