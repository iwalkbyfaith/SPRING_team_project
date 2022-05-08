package com.novel.novel.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.novel.free.domain.NovelVO;
import com.novel.novel.service.NovelService;

@RestController
@RequestMapping("/novel")
public class NovelRestController {
	
	@Autowired
	private NovelService service;
	
	@GetMapping(value="/weekList", 
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	
	public ResponseEntity<List<NovelVO>> list() {
	
		ResponseEntity<List<NovelVO>> entity = null;
	try {
		
		entity = new ResponseEntity<>(service.getMonList(), HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	return entity;
}
	
	
}
