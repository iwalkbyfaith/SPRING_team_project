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

import com.novel.paid.domain.PaidFavVO;
import com.novel.paid.domain.PaidRecVO;
import com.novel.paid.domain.PaidVO;
import com.novel.paid.service.PaidNovelService;
import com.novel.user.domain.FavorVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/paid")
@Log4j
public class PaidNovelRestController {
	
	@Autowired
	private PaidNovelService paidservice;
	

	// ■ paidDetail에서 본문 가져오기(결제버튼 클릭시 본문내용 출력) -paidDetail.jsp
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
	
		// ■ 유료소설 추천 테이블에 적재하기 -paidDetail.jsp
		@PostMapping(value="", consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> addRec(@RequestBody PaidRecVO vo){
			ResponseEntity<String> entity = null;
			try {	
				paidservice.addRec(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
		
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		
		return entity;
		}
		
		// ■ 유료소설 추천수 올리기 -paidDetail.jsp
		@RequestMapping(method= {RequestMethod.PUT,RequestMethod.PATCH},
				value="/{paid_num}",
				consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> modify(@PathVariable long paid_num){
			ResponseEntity<String> entity = null;
			try {
				paidservice.plusRec(paid_num);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}catch(Exception e) {
				entity = new ResponseEntity<String>(
						e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}	
		
		// ■ 유료소설 선호작 등록하기 -paidDetail.jsp
		@PostMapping(value="/fav",consumes="application/json",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		public ResponseEntity<String> insertFav(
				@RequestBody PaidFavVO vo){
				
				log.info(vo);
				ResponseEntity<String> entity = null;
				try {
					paidservice.addFav(vo);	
					entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);	
				} catch(Exception e) {
					entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				}
				return entity;
			}
		
		// ■ 유료소설 선호작 삭제하기 -paidDetail.jsp
		@DeleteMapping(value="/del/{novelNum}/{userNum}",
				produces= {MediaType.TEXT_PLAIN_VALUE})
		public ResponseEntity<String> deleteFav(@PathVariable("novelNum") long novel_num, @PathVariable("userNum") long user_num){

			ResponseEntity<String> entity = null;

			try {
				paidservice.delFav(novel_num, user_num);
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} catch(Exception e) {
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
				return entity;
		}
		
}
