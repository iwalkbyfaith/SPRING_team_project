package com.novel.freeboard.controller;

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

import com.novel.freeboard.domain.ReplyVO;
import com.novel.freeboard.service.ReplyService;

@RestController
@RequestMapping("replies")
public class ReplyController {
	
	@Autowired
	private ReplyService service;
	
	// 하나의 글에서 댓글 전체 조회
	@GetMapping(value = "/all/{free_board_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
		public ResponseEntity<List<ReplyVO>> list(@PathVariable("free_board_num") long free_board_num){
			ResponseEntity<List<ReplyVO>> entity = null;
			try {
				entity = new ResponseEntity<>(service.getList(free_board_num),HttpStatus.OK);
			}catch(Exception e) {
				e.getMessage();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	
	// 댓글 등록
	@PostMapping(value = "", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> register(@RequestBody ReplyVO vo){
			ResponseEntity<String> entity = null;
			try {
				service.create(vo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	
	// 댓글 삭제
	@DeleteMapping(value = "/{repl_num}",produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> remove(@PathVariable("repl_num")long repl_num){
			ResponseEntity<String> entity = null;
			try {
				service.delete(repl_num);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
	}
	
	// 댓글 수정
	@RequestMapping(method = {RequestMethod.PUT,RequestMethod.PATCH},value = "/{repl_num}",consumes = "application/json"
								,produces = {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> modify(@RequestBody ReplyVO vo){
			ResponseEntity<String> entity = null;
			try {
				service.update(vo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
	
}
