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

import com.novel.paid.domain.PaidVO;
import com.novel.paid.service.PaidNovelService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/paid")
@Log4j
public class PaidNovelRestController {
	
	@Autowired
	private PaidNovelService paidservice;
	
	// ■ paidList에서 요일별로 출력
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

	// ■ paidDetail에서 본문 가져오기
	@GetMapping(value="/{paidnum}",
					produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<PaidVO> DetailCon(@PathVariable("paidnum") long paidnum){
		
		ResponseEntity<PaidVO> entity = null;
	try {
		entity = new ResponseEntity<PaidVO>(paidservice.detailCon(paidnum), HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	return entity;
}
	
	
}
