package com.novel.security;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.novel.user.domain.UserVO;
import com.novel.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class UserMapperTest {
	
	@Autowired
	private UserMapper mapper;
	
	// ■ 계정명을 집어넣으면 계정 관련 정보가 정확하게 나오는지 테스트
	@Test
	public void testRead() {
		UserVO vo = mapper.getUserInfo("user31");
		
		log.info(vo);
		
		vo.getAuthList();
	}

}
