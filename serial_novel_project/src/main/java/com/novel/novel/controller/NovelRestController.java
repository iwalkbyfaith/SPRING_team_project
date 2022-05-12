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

import com.novel.novel.domain.NovelVO;
import com.novel.novel.service.NovelService;
import com.novel.novel.service.WeekService;

@RestController
@RequestMapping("/series")
public class NovelRestController {
	
	@Autowired
	private WeekService weekservice;

	@GetMapping(value="/{novelEnd}", 
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<NovelVO>> novellist(@PathVariable("novelEnd") int novelEnd){
		
		ResponseEntity<List<NovelVO>> entity = null;
		try {
			entity = new ResponseEntity<>(weekservice.getList(novelEnd), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}
