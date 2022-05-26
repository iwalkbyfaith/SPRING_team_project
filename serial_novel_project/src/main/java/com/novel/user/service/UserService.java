package com.novel.user.service;

import java.util.List;


import com.novel.user.domain.FavorVO;

public interface UserService {

		public List<FavorVO> selectFavList(String user_id); 		//	선호작 모음.
		
		
}
