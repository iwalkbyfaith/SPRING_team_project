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


import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/free")

public class FreeNovelController {

	@Autowired
	private FreeNovelService service;
	
	@GetMapping(value="/novel/{novelCategory}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<FreeNovelJoinVO>> novelList(@PathVariable("novelCategory") String novelCategory){
		
		ResponseEntity<List<FreeNovelJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectList(novelCategory), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
	}
		
		return entity;

	}
	@GetMapping(value="/novel/select/{novelNum}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeNovelJoinVO>> select(@PathVariable("novelNum") long novelNum){
		
		ResponseEntity<List<FreeNovelJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.select(novelNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
		
	}
	@GetMapping(value="/novel/detail/{freeSNum}/{novelNum}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeNovelJoinVO>> selectDetail(@PathVariable("freeSNum") long freeSNum
			,@PathVariable("novelNum") long novelNum){
		
		ResponseEntity<List<FreeNovelJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectDetail(freeSNum,novelNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		return entity;
	}
}

