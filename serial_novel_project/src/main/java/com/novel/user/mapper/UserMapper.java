package com.novel.user.mapper;

import com.novel.user.domain.UserVO;

public interface UserMapper {	// 시큐리티 관련 ( 나중에 com.novel.user.mapper 쪽으로 넣어야될듯 )
	
	// ■ 해당 유저 정보 가져오기
	public UserVO getUserInfo(String userId);
	public UserVO getUserInfo2(String userId);

}
