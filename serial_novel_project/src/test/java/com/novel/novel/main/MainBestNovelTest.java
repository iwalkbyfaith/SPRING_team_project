package com.novel.novel.main;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.novel.domain.MainBestNovelVO;
import com.novel.novel.mapper.NovelMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MainBestNovelTest {
	
	@Autowired
	NovelMapper mapper;
	
	
	// ■ 메인화면에 무료 소설 조회수 베스트 리스트(5) 가져오기
		//@Test
		public void getBestFreeViewTest() {
			log.info(mapper.getBestViewFreeData());
			
			List<MainBestNovelVO> voList = mapper.getBestViewFreeData();
			
			for(MainBestNovelVO vo : voList) {
				log.info("vo -> " + vo);
			}
		}
		
	// ■ 메인화면에 무료 소설 추천수 베스트 리스트(5) 가져오기
		@Test
		public void getBestFreeRecTest() {
			log.info(mapper.getBestRecFreeData());
			
			List<MainBestNovelVO> voList = mapper.getBestRecFreeData();
			
			for(MainBestNovelVO vo : voList) {
				log.info("vo -> " + vo);
			}
		}
	

}
