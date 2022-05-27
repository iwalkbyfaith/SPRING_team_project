package com.novel.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.free.domain.FreeNovelVO;
import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;

public interface UserService {

		public List<FavorVO> selectFavList(String user_id); 						//	선호작 모음.
		
		public List<FreeNovelVO> selectFree(long novelNum);							//  선호작에서 무료소설 디테일 가져옴.
					
		public void insertFav (FavorVO vo); 										//  선호작 등록
			
		public void deleteFav (long novel_num,long user_num); 						//  선호작 삭제
		
		
		public List<BookmarkVO> selectBookmarkList(String user_id);					//  책갈피 불러오기. 		

		
		public List<BookmarkVO> selectBookmarkDetail(long free_num,long user_num);	//  책갈피에서 무료소설 디테일 불러오기.
		
		
		public void insertFreeBookmark(BookmarkVO vo);								//  무료책갈피 등록
		
		
		public void deleteFreeBookmark(long fbm_num);								//  무료 책갈피 삭제
 
}
