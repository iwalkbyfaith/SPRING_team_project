package com.ict.controller;

import org.apache.tomcat.util.http.parser.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ict.service.ITournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/tourna")
public class TournamentController {
	
	@Autowired
	private ITournamentService service;
	
	@GetMapping(value="/list")
	public String goTournamentMain() {
		return "tournament/tournament";
	}

	@GetMapping("/list2")
	public String goTournamentMain2() {
		return "tournament/tournament2";
	}
}
