package com.novel.paid.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.novel.paid.domain.PaidVO;
import com.novel.paid.service.PaidNovelService;

@RestController
@RequestMapping("/paid")
public class PaidNovelRestController {
	
	@Autowired
	private PaidNovelService paidservice;
	
	
	@GetMapping(value="/novel/{novelWeek}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<PaidVO>> novelList(@PathVariable("novelWeek") String novelWeek){
		
		ResponseEntity<List<PaidVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(paidservice.selectList(novelWeek), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
	}
		
		return entity;

	}
	
	
	@GetMapping(value="/novel/select/{novelNum}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PaidVO>> select(@PathVariable("novelNum") long novelNum){
		
		ResponseEntity<List<PaidVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(paidservice.select(novelNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
		
	}
	
	@GetMapping(value="/novel/detail/{paidSNum}/{novelNum}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PaidVO>> selectDetail(@PathVariable("paidSNum") long paidSNum
			,@PathVariable("novelNum") long novelNum){
		
		ResponseEntity<List<PaidVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(paidservice.selectDetail(paidSNum, novelNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		return entity;
	}
	
	
	
	/*
	@GetMapping(value="/allList", 
			produces= {MediaType.APPLICATION_XML_VALUE,MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PaidVO>> paidList(){
		
		ResponseEntity<List<PaidVO>> entity = null;
	try {
		entity = new ResponseEntity<>(paidservice.getPaidList(), HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	return entity;
	} */
	
	

	@PostMapping(value="", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertPaid(@RequestBody PaidVO vo){
			
		ResponseEntity<String> entity = null;
	try {
		paidservice.insertPaid(vo);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
	
		entity = new ResponseEntity<String>(
			e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
