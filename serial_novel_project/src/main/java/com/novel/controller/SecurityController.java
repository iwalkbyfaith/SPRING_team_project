package com.novel.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.service.SecurityService;
import com.novel.user.domain.AuthVO;
import com.novel.user.domain.UserVO;

import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/secu/*")
@Controller
public class SecurityController {
	
	// ■ 회원가입 처리
	
		@Autowired
		private SecurityService service;
		
		@Autowired
		private PasswordEncoder pwen;
	
	
		
		
		@PreAuthorize("permitAll")
		@GetMapping("/all")
		public void doAll() {
			log.info("▶ 모든 사람이 접근 가능");
		}
		
		@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_FREE_WRITER', 'ROLE_PAID_WRITER', 'ROLE_ADMIN')")
		@GetMapping("/user")
		public void doUser() {
			log.info("▶ 회원만 접근 가능");
		}
		
		@PreAuthorize("hasAnyRole('ROLE_FREE_WRITER', 'ROLE_ADMIN')")
		@GetMapping("/freewriter")
		public void doFreeWriter() {
			log.info("▶ 무료소설 작가만 접근 가능");
		}
		
		@PreAuthorize("hasAnyRole('ROLE_PAID_WRITER', 'ROLE_ADMIN')")
		@GetMapping("/paidwriter")
		public void doPaidWriter() {
			log.info("▶ 유료소설 작가만 접근 가능");
		}
		
		@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
		@GetMapping("/admin")
		public void doAdmin() {
			log.info("▶ 운영자만 접근 가능");
		}
		
		// ■ 05.11 회원가입 창 get
			@PreAuthorize("permitAll")
			@GetMapping("/join")
			public void joinForm() {
				log.info("회원가입창 접속");
			}
			
			// ■ 05.11 회원가입 창 post
			@PreAuthorize("permitAll")
			@PostMapping("/join")
			public void join(UserVO vo, String[] role) { 
				log.info("가입시 받는 데이터들 : " + vo);
				System.out.println(vo);
				
				
				// ● 권한 넣어주기
				log.info("▼ 사용자가 선택한 권한 목록 : " + role);
					// role은 참조형 변수여서 반복문으로 풀어야함
					for(String r : role) {
						log.info(r);
					}
				
			}
	

}
