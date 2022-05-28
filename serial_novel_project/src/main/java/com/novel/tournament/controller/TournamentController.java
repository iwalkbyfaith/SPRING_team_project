package com.novel.tournament.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.novel.tournament.service.TournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/tourna")
public class TournamentController {
	
	@Autowired
	private TournamentService service;
	

	@GetMapping("/list2")
	public String goTournamentMain2() {
		return "tournament/tournament2_test";
	}
	
}
