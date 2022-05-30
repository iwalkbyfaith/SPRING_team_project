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
	
	@Transactional
	@Override
	public void updateMember(UserVO vo) {
		
		
		// ● 회원수정 로직 - 1. auth_tbl 수정
		mapper.updateAuthUser(vo);
		
		// ● 회원수정 로직 - 2. novel_tbl 수정
		mapper.updateNovelUser(vo);
		
		// ● 회원수정 로직 - 3. enroll_tbl 수정 
		mapper.updateEnrollUser(vo);
		
		
		// ● 회원수정 로직 - 4. paid_repl_tbl 수정 
		mapper.updatePaidReplUser(vo);
		
		// ● 회원수정 로직 - 5. free_repl_tbl 수정 
		mapper.updateFreeReplUser(vo);
		
		// ● 회원수정 로직 - 6. torec_tbl 수정 
		mapper.updateTorecUser(vo);
		
		// ● 회원수정 로직 - 회원정보 수정
		mapper.updateMember(vo);

	}
	

}
