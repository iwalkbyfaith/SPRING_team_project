package com.novel.enroll.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.enroll.service.EnrollService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/enroll")
public class EnrollController {
	
	@Autowired
	private EnrollService service;
	
	@GetMapping("/list")
	public void showAllList() {
		
	}

}
