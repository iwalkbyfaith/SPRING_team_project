package com.novel.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;
import com.novel.user.service.UserService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/fav")
public class UserRestController {
	@Autowired
	private UserService service;

	@PostMapping(value="/insert",consumes="application/json",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> insertFav(
			@RequestBody FavorVO vo){
			
			log.info(vo);
			ResponseEntity<String> entity = null;
			try {
			
				service.insertFav(vo);
				
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
				
			} catch(Exception e) {

				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}

			return entity;
		}
	@DeleteMapping(value="/delete/{novelNum}/{user_num}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteFav(@PathVariable("novelNum") long novel_num, @PathVariable("user_num") long  user_num){

		ResponseEntity<String> entity = null;

		try {
			service.deleteFav( novel_num, user_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
			return entity;
}
	@PostMapping(value="/insertbookmark",consumes="application/json",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> insertBookmark(
			@RequestBody BookmarkVO vo){
		
		log.info(vo);
		ResponseEntity<String> entity = null;
		try {
			
			service.insertFreeBookmark(vo);
			
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch(Exception e) {
			
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@DeleteMapping(value="/deletebookmark/{freeNum}/{user_num}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteBookmark(@PathVariable("freeNum") long free_num, @PathVariable("user_num") long  user_num){
		
		ResponseEntity<String> entity = null;
		
		try {
			service.deleteFreeBookmark(free_num, user_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
