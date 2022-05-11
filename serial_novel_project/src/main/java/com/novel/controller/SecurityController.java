package com.novel.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Log4j
@RequestMapping("/secu/*")
@Controller
public class SecurityController {
	
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

}
