package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ict.domain.TournamentJoinVO;
import com.ict.domain.TournamentVO;
import com.ict.service.ITournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/tournament")
public class TournamentWorkController {
	
	@Autowired
	private ITournamentService service;
	
	
	// ■ 토너먼트 대회 리스트 조회
	@GetMapping(value="/all", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<TournamentVO>> tournaList(){
		
		ResponseEntity<List<TournamentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournament(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;
	}
	
	
	@GetMapping(value="/toWork", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> tournaList2(){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournamentWork(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	
}
