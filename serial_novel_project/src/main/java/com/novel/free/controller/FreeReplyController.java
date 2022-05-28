package com.novel.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.novel.free.domain.FreeReplyVO;
import com.novel.free.service.FreeReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies")
public class FreeReplyController {
	
	@Autowired
	private FreeReplyService service;
	
	// ■ 댓글 가져오기.
	@GetMapping(value="detail/{free_num}", 
			produces= {MediaType.APPLICATION_ATOM_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<FreeReplyVO>> list (@PathVariable("free_num") Long free_num){
		ResponseEntity<List<FreeReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(
					service.listReply(free_num),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ■ 댓글 작성.
	@PostMapping(value="", consumes="application/json",	produces={MediaType.TEXT_PLAIN_VALUE})

	public ResponseEntity<String> register(
			@RequestBody FreeReplyVO vo){

		ResponseEntity<String> entity = null;
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);		
			
		}
		return entity;
	}
	// ■ 댓글 삭제.
	@DeleteMapping(value="/{frepl_num}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("frepl_num") Long frepl_num){

		ResponseEntity<String> entity = null;

		try {
			service.removeReply(frepl_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
			return entity;
}
	
	// ■ 댓글 수정.
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/{frepl_num}",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
		@RequestBody FreeReplyVO vo,

		@PathVariable("frepl_num") Long frepl_num){

		ResponseEntity<String> entity = null;
		try {
	log.info("frepl_num 세팅 전 vo : " + vo);
	vo.setFrepl_num(frepl_num);
	log.info("frepl_num 세팅 후 vo : " + vo);
	service.modifyReply(vo);
	
	entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
				e.printStackTrace();
					entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
				return entity;
	}
}
