package com.novel.tournament.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.service.TournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/tournament")
public class TournamentWorkController {
	
	@Autowired
	private TournamentService service;
	
	
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
	
	
	// ■ 8강 토너먼트 대회 참여 작품 리스트 조회
	@GetMapping(value="/toWork8", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> tournaList2(){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournamentWork2(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	
	
	// ■ 특정 토너먼트 대회 참여 작품 리스트 가져오기
	@GetMapping(value="/toWork/{to_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> tournaWorkList(@PathVariable("to_num") long to_num){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournamentWork(to_num), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	
	
	
	// ■ 추천을 눌렀을 때, 작품의 추천수 +1 올리기
	@RequestMapping(value="/up/{towork_num}", 
					method= {RequestMethod.PUT, RequestMethod.PATCH},
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyRecUP(@PathVariable("towork_num") long towork_num){
		
		ResponseEntity<String> entity = null;
		log.info("들어온 towork_num -> "+ towork_num);
		
		try {
			
			log.info("들어온 토너먼트 작품 번호 -> " + towork_num);
			service.upRec(towork_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	// ■ 예상 우승 작품 가져오기
	@GetMapping(value="/toWork/winner", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TournamentJoinVO> getWinner(){
		
		ResponseEntity<TournamentJoinVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getWinner(), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
