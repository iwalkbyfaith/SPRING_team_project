package com.novel.free.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.novel.user.domain.BookmarkVO;
import com.novel.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BookmarkTests {
	@Autowired
	private UserMapper mapper;
 	
	// @Test 
	// ■ 북마크 리스트 뽑아오기 
	public void BookmarkList() {
		List<BookmarkVO> bookmarkList = mapper.selectBookmarkList("user2");
		log.info("북마크 리스트 : " + bookmarkList);
	}
	// @Test 
	// ■ 북마크 등록하기 
	public void insertBookmark() {
		BookmarkVO vo = new BookmarkVO();
		vo.setFree_num(10);
		vo.setUser_num(2);
		mapper.insertFreeBookmark(vo);
		
		List<BookmarkVO> bookmarkList = mapper.selectBookmarkList("user1");
		log.info("북마크 리스트 : " + bookmarkList);
	}
	//@Test
	// ■ 북마크 삭제하기 
	public void deleteBookmark() {
	
		mapper.deleteFreeBookmark(8, 2);
		
		List<BookmarkVO> bookmarkList = mapper.selectBookmarkList("user1");
		log.info("북마크 리스트 : " + bookmarkList);
	}
}
