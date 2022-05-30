package com.novel.user.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.novel.free.domain.FreeNovelVO;
import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;
import com.novel.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class UserController {
	@Autowired
	private UserService service;
	
	@GetMapping("/myInfo")
	public String myInfo(Principal principal,Model model){
		log.info("마이페이지 접근");
		
		return "mypage/myInfo";}
	
	
	@GetMapping("/myFavor")
	public String myFavor(Principal principal,Model model){
		System.out.println("선호작 접근");
		
		String user_id = principal.getName();
		
		System.out.println("받아온 아이디 : " + user_id);
		
		model.addAttribute("user_id",user_id);
		 
		List<FavorVO> FavorList = service.selectFavList(user_id);
		
		model.addAttribute("FavorList",FavorList);
		
		
		System.out.println(FavorList);
						
		
		return "mypage/myFavor";
		} 
	
	
	@GetMapping("/free/{novelNum}")
	public String FavorDetail(@PathVariable long novelNum,Principal principal,Model model){
				
		service.selectFree(novelNum);
		
		List<FreeNovelVO> FreeList = service.selectFree(novelNum);
		
		model.addAttribute("FreeList",FreeList);
		
		
		
		return "mypage/free";
		}
	
	@GetMapping("/bookmark")
	public String bookmark(Principal principal,Model model){
		
		System.out.println("책갈피 접근");
		
		String user_id = principal.getName();
		
		System.out.println("받아온 아이디 : " + user_id);
		
		model.addAttribute("user_id",user_id);
		 
		List<BookmarkVO> BookmarkList = service.selectBookmarkList(user_id);
		
		model.addAttribute("BookmarkList",BookmarkList);
		
		
		System.out.println(BookmarkList);
		
		
		return "mypage/bookmark";
		}
	
	@GetMapping("/bookmarkDetail/{freeNum}/{userNum}")
	public String bookmarkDetail(@PathVariable long freeNum,@PathVariable long userNum,Principal principal,Model model){
				
		service.selectBookmarkDetail(freeNum, userNum);
		
		List<BookmarkVO> BookmarkList = service.selectBookmarkDetail(freeNum, userNum);
		
		model.addAttribute("BookmarkList",BookmarkList);
		
		
		
		return "mypage/bookmarkDetail";
		}
	
		

}
