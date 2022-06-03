package com.novel.charge.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.novel.charge.domain.ChargeVO;
import com.novel.charge.domain.UseVO;
import com.novel.charge.service.ChargeService;
import com.novel.user.domain.UserVO;

@Controller
public class ChargeController {
	
	@Autowired
	private ChargeService service;
	
	// 로그인 한 사용자 전용
	// ■ 유저의 결제페이지(결제 테이블을 조회해서 넘어감)
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/charge/{user_num}")
	public String pay(@PathVariable long user_num,Model model) {
		
		List<ChargeVO> chargeList =service.chargeList(user_num);
		model.addAttribute("chargeList", chargeList);
		return "charge";
	}
	
	
	// ■ 유저의 결제내역에 적재하기 (로그인 한 사용자 전용)
	@ResponseBody
	@PostMapping(value="/order", consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> orderInsert(@RequestBody ChargeVO vo){
		 service.insertPay(vo);
		 
		 return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	// ■ 결제성공시 코인 추가되는 컨트롤러
	@ResponseBody
	@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
						value="/coinAdd",
						consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> coinAdd(@RequestBody UserVO vo){
			ResponseEntity<String> entity = null;
	try {
			
			service.addCoin(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		}
	
		
		// ■ 소설결제시 코인 차감
		@ResponseBody
		@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
							value="/remove",
							consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> removeCoin(@RequestBody UserVO vo){
				ResponseEntity<String> entity = null;
		try {
				
				service.removeCoin(vo);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(
						e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
			}
		
		
		// ■ 소설 결제 내역 남기기
		@ResponseBody
		@PostMapping(value="/insertUse", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> insertUse(@RequestBody UseVO uVo){
			ResponseEntity<String> entity = null;
		try {
			service.insertUse(uVo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
		}
		
		// ■ 유저의 유료소설 구매 내역
		@GetMapping(value="/useList/{user_num}")
		public String UseList(@PathVariable long user_num,Model model){
			
			List<UseVO> useList = service.useList2(user_num);
			model.addAttribute("useList", useList);
			
		return "mypage/myUse";
		}
		
		
}
