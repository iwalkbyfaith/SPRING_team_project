package com.novel.enroll.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.novel.enroll.domain.EnrollVO;
import com.novel.enroll.service.EnrollService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/enrollAjax")
public class EnrollAjaxController {
	
	@Autowired
	private EnrollService service;
	
	// ■ 전체 리스트 가져오기
	@GetMapping(value="/getAllList", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<EnrollVO>> getAllList(){
		
		ResponseEntity<List<EnrollVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getAllEnrollList(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;
		
	}
	
	// ■ 상세 리스트 가져오기
	@GetMapping(value="/getDetail/{enroll_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<EnrollVO> getDetail(@PathVariable("enroll_num") long enroll_num){
		
		ResponseEntity<EnrollVO> entity = null;
		
		try {
			
			log.info("/getDetail) 들어온 enroll_num -> " + enroll_num);
			entity = new ResponseEntity<>(service.getEnrollDetail(enroll_num), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
