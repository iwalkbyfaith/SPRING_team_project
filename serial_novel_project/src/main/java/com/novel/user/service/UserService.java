package com.novel.user.service;

import java.util.List;

import com.novel.free.domain.FreeNovelVO;
import com.novel.user.domain.FavorVO;

public interface UserService {

		public List<FavorVO> selectFavList(String user_id); 		//	선호작 모음.
		
		public List<FreeNovelVO> selectFree(long novelNum);			//  선호작에서 무료소설 디테일 가져옴.
		
		public void insertFav (FavorVO vo); 						//  선호작 등록
		
		public void deleteFav (long novel_num,long user_num); 		//  선호작 삭제
}
