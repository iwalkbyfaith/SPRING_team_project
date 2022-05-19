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

import com.novel.free.domain.FreeReplyVO;
import com.novel.free.service.FreeReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies")
public class FreeReplyController {
	
	@Autowired
	private FreeReplyService service;
	
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

}
