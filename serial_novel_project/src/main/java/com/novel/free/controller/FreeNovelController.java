package com.novel.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import com.novel.free.domain.FreeNovelJoinVO;
import com.novel.free.domain.FreeNovelVO;
import com.novel.free.domain.FreeRecVO;
import com.novel.free.domain.NovelVO;
import com.novel.free.service.FreeNovelService;
import com.novel.service.SecurityService;
import com.novel.user.domain.BookmarkVO;
import com.novel.user.domain.FavorVO;
import com.novel.user.service.UserService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/free")

public class FreeNovelController {

	@Autowired
	private FreeNovelService service;
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping(value="/novel/{novelCategory}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<NovelVO>> novelList(@PathVariable("novelCategory") String novelCategory){
		
		ResponseEntity<List<NovelVO>> entity = null;
		
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
	@GetMapping(value="/novel/selecttitle/{novelNum}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<NovelVO>> selecttitle(@PathVariable("novelNum") long novelNum){
		
		ResponseEntity<List<NovelVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selecttitle(novelNum), HttpStatus.OK);
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
	
	@PostMapping(value="", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	// produces??? TEXT_PLAIN_VALUES??? ???????????? ??????????????? ???????????? ??????
	public ResponseEntity<String> register(
			// rest?????????????????? ?????? ???????????? ?????? 
			// @RequestBody ?????????????????? ?????????
			// consumes??? ?????????
			@RequestBody FreeNovelVO vo){
		// ??????entity??? ?????? ??????
		log.info(vo);
		ResponseEntity<String> entity = null;
		try {
			// ?????? ????????? ?????? ?????? ??? ????????? ?????????...
			service.insertFree(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch(Exception e) {
			// catch??? ?????????????????? ????????? ????????? ????????? ?????? ??????
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		// ?????? try???????????? catch???????????? ????????? entity?????? ??????
		return entity;
	}
	
	@DeleteMapping(value="/{free_num}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("free_num") Long free_num){

		ResponseEntity<String> entity = null;

		try {
			service.delete(free_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
				return entity;
}
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{freeNum}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
		@RequestBody FreeNovelVO vo,
		@PathVariable("freeNum") Long freeNum){
		ResponseEntity<String> entity = null;
		try {	
	vo.setFree_num(freeNum);
	
	service.update(vo);
	
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
}
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/hit",
			
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> addhit(
			@RequestBody FreeNovelVO vo){
		ResponseEntity<String> entity = null;
		try {	
			service.addhit(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@PostMapping(value="/novel", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	// produces??? TEXT_PLAIN_VALUES??? ???????????? ??????????????? ???????????? ??????
	public ResponseEntity<String> register(
			// rest?????????????????? ?????? ???????????? ?????? 
			// @RequestBody ?????????????????? ?????????
			// consumes??? ?????????
			@RequestBody NovelVO vo){
		// ??????entity??? ?????? ??????
		log.info(vo);
		ResponseEntity<String> entity = null;
		try {
			// ?????? ????????? ?????? ?????? ??? ????????? ?????????...
			service.insertNovel(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch(Exception e) {
			// catch??? ?????????????????? ????????? ????????? ????????? ?????? ??????
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		// ?????? try???????????? catch???????????? ????????? entity?????? ??????
		return entity;
	}
	
	@GetMapping(value="/favor/{userId}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FavorVO>> selectFavor(@PathVariable("userId") String userId){
		
		ResponseEntity<List<FavorVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(userService.selectFavList(userId), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
		
	}
	@GetMapping(value="/bookmark/{userId}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<BookmarkVO>> selectbookmark(@PathVariable("userId") String userId){
		
		log.info(userId);
		
		ResponseEntity<List<BookmarkVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(userService.selectBookmarkList(userId), HttpStatus.OK);
			
			log.info(entity);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
		
	}
	
	@GetMapping(value="/rec/{free_num}", produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeRecVO>> selectRec(@PathVariable("free_num") long free_num){
		
		ResponseEntity<List<FreeRecVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.selectRecList(free_num), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
		
	}
	
	
	@PostMapping(value="insert/rec", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insertRec(
			@RequestBody FreeRecVO vo){
		
		log.info(vo);
		ResponseEntity<String> entity = null;
		try {
		
			service.insertRec(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		} catch(Exception e) {
		
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@DeleteMapping(value="delete/rec",consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> deleteRec(@RequestBody FreeRecVO vo){

		ResponseEntity<String> entity = null;

		try {
			service.deleteRec(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
				return entity;
}
}

