package com.novel.bestseller.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.tournament.service.TournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/bestseller")
public class BestSellerController {
	
	@Autowired
	private TournamentService service;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/list")
	public String gobestseller() {
		return "bestseller/bestseller";
	}
		
}
