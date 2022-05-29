package com.novel.user.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.free.domain.FreeNovelVO;
import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;
import com.novel.user.domain.UserVO;

public interface UserService {
	// ■ 회원정보 수정을 위한 그에 따른 정보들 우선 수정 1. 권한 

	public void updateAuthUser(UserVO vo);
	
	// ■ 회원정보 수정을 위한 그에 따른 정보들 우선 수정 2. 소설  
	
	public void updateNovelUser(UserVO vo);
	
	// ■ 회원정보 수정을 위한 그에 따른 정보들 우선 수정 3. 작가신청 
	
	public void updateEnrollUser(UserVO vo);
	
	// ■ 회원정보 수정을 위한 그에 따른 정보들 우선 수정 4. 유료댓글 
	
	public void updatePaidReplUser(UserVO vo);
	
	// ■ 회원정보 수정을 위한 그에 따른 정보들 우선 수정 5. 무료댓글 
	
	public void updateFreeReplUser(UserVO vo);
	
	// ■ 회원정보 수정을 위한 그에 따른 정보들 우선 수정 6. 토너먼트 추천수 

	public void updateTorecUser(UserVO vo);	

	// 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓 ★ 여기 까지 회원 로직  ★ 〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓〓

	// ■ 선호작 모음.
	public List<FavorVO> selectFavList(String user_id); 						
	
	// ■ 선호작에서 무료소설 디테일 가져옴.	
	public List<FreeNovelVO> selectFree(long novelNum);							
	
	// ■ 선호작 등록
	public void insertFav (FavorVO vo); 										
	
	// ■ 선호작 삭제
	public void deleteFav (long novel_num,long user_num); 						
	
	// ■ 책갈피 불러오기
	public List<BookmarkVO> selectBookmarkList(String user_id); 		

	// ■ 책갈피에서 무료소설 디테일 불러오기.
	public List<BookmarkVO> selectBookmarkDetail(long free_num,long user_num);	

	// ■ 무료 책갈피 등록 
	public void insertFreeBookmark(BookmarkVO vo);								
		
	// ■ 무료 책갈피 삭제
	public void deleteFreeBookmark (long free_num,long user_num); 				
 
}
