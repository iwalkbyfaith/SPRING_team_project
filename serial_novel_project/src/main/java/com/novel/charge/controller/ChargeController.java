package com.novel.charge.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.service.ChargeService;
import com.novel.user.domain.UserVO;

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
	
	// 결제성공시 코인 추가되는 컨트롤러
	@ResponseBody
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
						value="/coinAdd/{userNum}",
						consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> coinAdd(@RequestBody UserVO vo, @PathVariable("userNum") long userNum){
			ResponseEntity<String> entity = null;
	try {
		
			//vo.setRno(rno);
			//service.modifyReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		}

}
