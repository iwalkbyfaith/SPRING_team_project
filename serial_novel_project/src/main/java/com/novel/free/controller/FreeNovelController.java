package com.novel.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.service.FreeNovelService;
import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/free")

public class FreeNovelController {

	@Autowired
	private FreeNovelService service;
	
	@GetMapping(value="/novel/{novel_category}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<FreeNovelJoinVO>> novelList(@PathVariable("novel_category") String novel_category){
		
		ResponseEntity<List<FreeNovelJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectList(novel_category), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
	}
		
		return entity;

	}
	}
	

