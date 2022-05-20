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

@Controller
@Service
@RequestMapping("/free")
public class FreeNovelListController {
	
	@Autowired
	private FreeNovelService service;
	@Autowired
	private SecurityService securityService;
	
	@PreAuthorize("permitAll")
	@GetMapping(value="/novelList")
	
	public String novelList() {
		
		return "free/novelList";	
	}

}
