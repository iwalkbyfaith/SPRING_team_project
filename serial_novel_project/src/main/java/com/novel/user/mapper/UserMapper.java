package com.novel.user.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.novel.free.domain.FreeNovelVO;
import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;
import com.novel.user.domain.UserVO;

public interface UserMapper {	// 시큐리티 관련 ( 나중에 com.novel.user.mapper 쪽으로 넣어야될듯 )
	
	// ■ 해당 유저 정보 가져오기
	public UserVO getUserInfo(String userId);
	public UserVO getUserInfo2(String userId);
	
	// ■ 회원가입 로직 - 회원정보 기입
	public void insertMemberTbl(UserVO vo);
			
	// ■ 회원가입 로직 - 권한 목록 기입 ( ★ 다중 insert 구문은 update 태그로 처리한다 )
	public void insertMemberAuth(UserVO vo); // MemberVO 내부에 authList가 있기 때문에 MemberVO로 받는다.
	
	// ■ 회원정보 수정 로직 - 회원정보 수정
	public void updateMember(UserVO vo);

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
	
	
	// ■ 선호작 불러오기.
	public List<FavorVO> selectFavList(String user_id); 		

	// ■ 선호작에서 무료소설 디테일 불러오기.
	public List<FreeNovelVO> selectFreeList(long novelNum);
	
	// ■ 선호작 등록
	public void insertFav(FavorVO vo);
	
	// ■ 선호작 삭제
	public void deleteFav(@Param("novel_num")long novel_num,@Param("user_num")long user_num);
	
	
	// ■ 책갈피 불러오기.
	public List<BookmarkVO> selectBookmarkList(String user_id); 		

	// ■ 책갈피에서 무료소설 디테일 불러오기.
	public List<BookmarkVO> selectBookmarkDetail(@Param("free_num") long free_num, @Param("user_num") long user_num);
	
	// ■ 무료책갈피 등록
	public void insertFreeBookmark(BookmarkVO vo);
	
	// ■ 무료 책갈피 삭제
	public void deleteFreeBookmark(@Param("free_num")long free_num,@Param("user_num")long user_num);

	// ■ 결제 성공시 해당 유저 코인 발급 로직

	
	
}
