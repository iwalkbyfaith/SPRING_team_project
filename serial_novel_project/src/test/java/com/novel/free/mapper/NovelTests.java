package com.novel.free.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.free.domain.FreeReplyVO;
import com.novel.free.domain.NovelVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NovelTests {
	@Autowired
	private FreeNovelMapper mapper;
	
	@Test 
	// ■ 소설 집어넣기 
	public void insertNovelList() {
	NovelVO vo = new NovelVO(); 
		vo.setNovel_category("fantasy");
		vo.setNovel_title("바바리안 퀘스트");
		vo.setNovel_tsnum(10);
		vo.setNovel_week("free");
		vo.setNovel_writer("백수귀환");
		
		mapper.insertNovel(vo);
	}
	

}
