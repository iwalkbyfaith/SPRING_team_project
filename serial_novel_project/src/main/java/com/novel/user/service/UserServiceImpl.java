package com.novel.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.novel.free.domain.FreeNovelVO;
import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;
import com.novel.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserMapper mapper;
	
	@Override
	public List<FavorVO> selectFavList(String user_id) {
		
		return mapper.selectFavList(user_id);
	}
	@Override
	public List<FreeNovelVO> selectFree(long novelNum) {
		
		return mapper.selectFreeList(novelNum);
	}
	@Override
	public void insertFav(FavorVO vo) {
		
		mapper.insertFav(vo);
		
	}
	@Override
	public void deleteFav(long novel_num,long user_num) {
		
		mapper.deleteFav(novel_num,user_num);
		
	}
	@Override
	public List<BookmarkVO> selectBookmarkList(String user_id) {
		
		return mapper.selectBookmarkList(user_id);
	}
	@Override
	public List<BookmarkVO> selectBookmarkDetail(long free_num,long user_num){
		
		return mapper.selectBookmarkDetail(free_num, user_num);
	}
	@Override
	public void insertFreeBookmark(BookmarkVO vo) {
		
		mapper.insertFreeBookmark(vo);
		
	}
	@Override
	public void deleteFreeBookmark(long free_num,long user_num) {
		
		mapper.deleteFreeBookmark(free_num,user_num);
		
	}

}
