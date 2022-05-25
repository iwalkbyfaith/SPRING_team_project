package com.novel.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
