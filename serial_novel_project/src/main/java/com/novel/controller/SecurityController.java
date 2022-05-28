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
				
				// ● 비밀번호 암호화 (평문으로 되어있던 암호를 encode를 사용하여 암호화를 시킨다)
				
					// 1. getter로 vo에 들어온 비밀번호를 조회
					String beforeCrpw = vo.getUser_pw();
					log.info("암호화 전 비밀번호-> " + beforeCrpw);
					
					// 2. setter를 사용해 암호화된 비밀번호를 vo에 넣은 후, getter를 사용해 조회한다.
					vo.setUser_pw(pwen.encode(beforeCrpw));
					log.info("암호화 후 비밀번호-> " + vo.getUser_pw());
				
				
				
				// ● 권한 넣어주기
				log.info("▼ 사용자가 선택한 권한 목록 : " + role);
					// role은 참조형 변수여서 반복문으로 풀어야함
					for(String r : role) {
						log.info(r);
					}
					
					// setter를 이용해 vo의 authList에 빈 리스트를 만들어주고
					// 그 리스트에다 들어온 권한을 반복문을 이용해서 빈 VO에 순차적으로 넣어줌
					// 권한 정보 + 어떤 유저가 가지는지도 넣어줘야함. (setAuth, setUserid 둘 다 실행)
				
					// 1. null 상태인 authList에 빈 ArrayList를 먼저 배정
					vo.setAuthList(new ArrayList<AuthVO>());
					
					// 2. authList는 List<authList>이므로 권한 개수에 맞게 넣어줘야함.
					for(int i=0; i < role.length; i++) {
						vo.getAuthList().add(new AuthVO());					
						vo.getAuthList().get(i).setAuth(role[i]);			
						vo.getAuthList().get(i).setUser_id(vo.getUser_id());	
					}
					log.info(vo.getAuthList());
				
				// ● 서비스 호출 (vo를 두 개의 매퍼 메서드를 넣어주는 서비스)
				service.insertMember(vo);
					
				
			}
	

}
