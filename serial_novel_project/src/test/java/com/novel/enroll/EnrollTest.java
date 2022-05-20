package com.novel.enroll;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.enroll.domain.EnrollVO;
import com.novel.enroll.mapper.EnrollMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EnrollTest {
	
	@Autowired
	private EnrollMapper mapper;
	
	
	// ■ 전체 리스트 가져오기
	//@Test
	public void getAllListTest() {
		List<EnrollVO> voList = mapper.getAllEnrollList();
		log.info(voList);
		
	}
	
	
	// ■ 디테일 가져오기
	@Test
	public void getDetailTest() {
		log.info(mapper.getEnrollDetail(1));
	}

}
