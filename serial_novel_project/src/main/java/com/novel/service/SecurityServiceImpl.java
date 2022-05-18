package com.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.novel.user.domain.UserVO;
import com.novel.user.mapper.UserMapper;



@Service
public class SecurityServiceImpl implements SecurityService{

	@Autowired
	private UserMapper mapper;
	
	// ■ 회원가입 정보 DB에 적재
	@Transactional
	@Override
	public void insertMember(UserVO vo) {
		
		// ● 회원가입 로직 - 회원정보 기입
		mapper.insertMemberTbl(vo);
		// ● 회원가입 로직 - 권한 목록 기입
		mapper.insertMemberAuth(vo);
	}

}
