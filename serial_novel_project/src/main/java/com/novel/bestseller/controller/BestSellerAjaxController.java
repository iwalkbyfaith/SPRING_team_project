package com.novel.bestseller.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.novel.bestseller.domain.BestSellerVO;
import com.novel.bestseller.service.BestSellerService;
import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;
import com.novel.tournament.service.TournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/bestsellerAjax")
public class BestSellerAjaxController {
	
	@Autowired
	private BestSellerService service;
	
	// ■ 카테고리별 별점 가져오기
	@GetMapping(value="/rank", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BestSellerVO>> getRankByCategory(){
		
		ResponseEntity<List<BestSellerVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getRankByCategory(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;
	}
	
	// ■ 샘플 데이터 10개 가져오기
		@GetMapping(value="/sampleData", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<BestSellerVO>> getSampleData(){
			
			ResponseEntity<List<BestSellerVO>> entity = null;
			
			try {
				entity = new ResponseEntity<>(service.getSampleData(), HttpStatus.OK);
				log.info("성공시 entity -> " + entity);
				
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
				log.info("실패시 entity -> " + entity);
			}
			
			return entity;
		}

	
	
	
	
}
