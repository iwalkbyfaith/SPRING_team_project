package com.novel.enroll.controller;

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
	
	
	
	// ■ 05.24 로그인 유저의 '승인대기(enroll_result=0)' 중인 데이터가 있는지 확인하기 -> 있으면 신청 못 함.
	@GetMapping(value="/checkUsersResult0List/{user_id}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<EnrollVO> checkUsersResult0List(@PathVariable("user_id") String user_id){
		
		ResponseEntity<EnrollVO> entity = null;
		
		try {
			log.warn("/checkUsersResult0List로 들어온 user_id -> " + user_id);
			log.warn("->" + service.getEnrollResult0(user_id));
//			log.info("/checkUsersResult0List로 들어온 user_id -> " + user_id);
//			log.info("->" + service.getEnrollResult0(user_id));
			entity = new ResponseEntity<>(service.getEnrollResult0(user_id), HttpStatus.OK);
			
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	
	
	
	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	@PostMapping(value="/insertEnrollForm", 
			     consumes="application/json",
			     produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> insertEnrollForm(@RequestBody EnrollVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			// 디버깅
			log.info("/insertEnrollForm에서 들어온 vo -> " + vo);
			
			// DB에 적재
			service.insertEnrollFormData(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	// ■ 관리자 승인 버튼에 따른 enroll_result 변경 & 승인된 경우 novel_tbl에 적재
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, 
  				    value="/updateEnrollResult",
				    consumes="application/json",
				    produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateEnrollResult(@RequestBody EnrollVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			log.warn("/updateEnrollResult에서 받은 vo -> " + vo);
			
			// 1) enroll_tbl에 변경 사항을 업데이트
			service.updateEnrollResult(vo);
			
			// 2) enroll_result가 2(무료 승인)라면 novel_tbl에 free로 적재
				// 2-1) enroll_result 확인
				log.warn("/updateEnrollResult에서 가져온 결과값 -> " + vo.getEnroll_result());
				
				// 2-2) novel_tbl에 적재 if사용
				// 아직 메서드 안 만들었음
			
			// 3) enroll_result가 3(유료 승인)이라면 novel_tbl에 유료로 적재 (할지말지 고민)
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	// ■ enroll_result값에 따른 리스트 가져오기
	@GetMapping(value="/getList/{enroll_result}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<EnrollVO>> getxxList(@PathVariable("enroll_result") long enroll_result){
		
		ResponseEntity<List<EnrollVO>> entity = null;
		
		try {
			
			log.warn("/getList) 들어온 enroll_result -> " + enroll_result);
			entity = new ResponseEntity<>(service.getEnrollxxList(enroll_result), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// ■ 신청 폼 수정하기(승인 대기중인 리스트만 가능함 : 다른 리스트는 못보게 권한 설정 해놓을것)
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, 
			    	value="/updateEnrollForm",
				    consumes="application/json",
				    produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> updateEnrollForm(@RequestBody EnrollVO vo){
		
		ResponseEntity<String> entity = null;
		
		try {
			log.warn("/updateEnrollForm으로 들어온 vo -> " + vo);
			
			// DB 데이터 수정
			service.updateEnrollForm(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	// ■ 신청 폼 삭제하기(승인 대기중인 리스트만 가능함 : 다른 리스트는 못보게 권한 설정 해놓을것)
	@DeleteMapping(value="/deleteEnrollForm/{enroll_num}",
				   produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("enroll_num") long enroll_num){
		
		ResponseEntity<String> entity = null;
		
		log.info("/deleteEnrollForm에 들어온 enroll_num -> " + enroll_num);
		
		try {
			
			service.deleteEnrollForm(enroll_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
