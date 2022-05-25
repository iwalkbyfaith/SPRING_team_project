package com.novel.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.service.FreeNovelService;
import com.novel.service.SecurityService;

import lombok.extern.log4j.Log4j;

@Controller
@Service
@RequestMapping("/free")
@Log4j
public class FreeNovelListController {
	
	@Autowired
	private FreeNovelService service;
	@Autowired
	private SecurityService securityService;
	
	@PreAuthorize("permitAll")
	@GetMapping(value="/novelList")
	
	public String novelList() {
		log.info("무료소설 접근");
		return "free/novelList";	
	}

}
