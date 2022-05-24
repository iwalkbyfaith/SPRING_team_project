package com.novel.user.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.user.domain.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class UserController {
	// mypageService를 생성해서 아이디에 딸린 선호작, 책갈피 정보를 받아와야함.
	@GetMapping("/myInfo")
	public String myInfo(Principal principal,Model model){
				
		return "mypage/myInfo";}
	
	@GetMapping("/myFavor")
	public String myFavor(Principal principal,Model model){
		String user_id = principal.getName();
		
						
		
		return "mypage/myFavor";}
	
	@GetMapping("/bookmark")
	public String bookmark(Principal principal,Model model){
		
						
		
		return "mypage/bookmark";}
		

}
