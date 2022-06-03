package com.novel.paid.controller;

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

import com.novel.paid.domain.PaidReplyVO;
import com.novel.paid.service.PaidReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/preplies")
public class PaidReplyController {
	
	@Autowired
	private PaidReplyService service;
	
	// ■ 유료소설의 댓글리스트 - paidDetail.jsp
	@GetMapping(value="/all/{novelNum}/{paidNum}", 
			produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<PaidReplyVO>> list(@PathVariable("novelNum") long novelNum, 
														@PathVariable("paidNum") long paidNum){
		
			ResponseEntity<List<PaidReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.getList(novelNum, paidNum), HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ■ 유료소설의 댓글 추가 - paidDetail.jsp
	@PostMapping(value="", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody PaidReplyVO vo){
	
	ResponseEntity<String> entity = null;
		try {
			service.create(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
		
		entity = new ResponseEntity<String>(
				e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
	return entity;
	}
	
	// ■ 유료소설의 댓글 삭제 - paidDetail.jsp
	@DeleteMapping(value="/{preplNum}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("preplNum") long preplNum){
		ResponseEntity<String> entity = null;
		
		try {
			service.delete(preplNum);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// ■ 유료소설의 댓글 수정 - paidDetail.jsp
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
			value="/{preplNum}",
			consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody PaidReplyVO vo, @PathVariable("preplNum") long preplNum){
		ResponseEntity<String> entity = null;
		try {
	
			service.update(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
