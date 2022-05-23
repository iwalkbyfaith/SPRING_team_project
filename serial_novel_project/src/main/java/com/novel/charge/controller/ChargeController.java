package com.novel.charge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.service.ChargeService;

@Controller
public class ChargeController {
	
	@Autowired
	private ChargeService service;
	
	
	@GetMapping("/charge")
	public void pay() {
		
	}
	
	@ResponseBody
	@PostMapping(value="/order", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> orderInsert(@RequestBody ChargeVO vo){
		 service.insertPay(vo);
		 
		 return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
