package com.novel.bestseller;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.bestseller.domain.BestSellerVO;
import com.novel.bestseller.mapper.BestSellerMapper;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BestsellerTest {
	
	@Autowired
	private BestSellerMapper mapper;
	
	
	//@Test
	// 베스트 셀러 카테고리별 별점(리뷰 랭크)
	public void getRankByCategory() {
		List<BestSellerVO> bestSellerList = mapper.getRankByCategory();
		log.info(bestSellerList);
	}
	
	@Test
	public void getSampleData() {
		List<BestSellerVO> sampleData = mapper.getSampleData();
		log.info(sampleData);
	}

}
