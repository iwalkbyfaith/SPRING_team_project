package com.novel.tournament.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.novel.tournament.domain.TournamentJoinVO;
import com.novel.tournament.domain.TournamentVO;
import com.novel.tournament.domain.TournamentWorkRecVO;
import com.novel.tournament.domain.TournamentWorkVO;
import com.novel.tournament.service.TournamentService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/tournament")
public class TournamentWorkController {
	
	@Autowired
	private TournamentService service;
	
	
	// ■ 토너먼트 대회 리스트 조회
	@GetMapping(value="/all", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<TournamentVO>> tournaList(){
		
		ResponseEntity<List<TournamentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournament(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;
	}
	
	
	// ■ 05.14 토너먼트 8강에 들어갈 작품 적재하기(없는 경우) & 가져오기
	@GetMapping(value="/get8list", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> addAndGet8list(){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			
			// 8강에 적재된 데이터가 있는지 확인
			List<TournamentWorkVO> record8 = service.getTournamentData(1);
			log.info(record8);
			
			// 8강 데이터가 없다면 적재
			if(record8.isEmpty()) {
				log.info("▼ 8강 데이터가 없다면 적재");
				List<Integer> list8 = service.select8ToworkRecord();
				log.info(list8);
				
				for(int novel_num : list8) {
					TournamentWorkVO vo = new TournamentWorkVO();
					vo.setNovel_num(novel_num);
					vo.setTo_num(1);
					log.info("생성된 new vo");
					log.info(vo);
					service.insert8Towork(vo);
				}
			}
			
			// 8강(to_num=1) 데이터 리턴
			entity = new ResponseEntity<>(service.getTowork2or4or8(1), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	
	// ■ 05.14 토너먼트 2 or 4강에 들어갈 작품 적재하기(없는 경우) & 가져오기
	@GetMapping(value="/getList/{to_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> addAndGet2or4list(@PathVariable("to_num") long to_num){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		
		try {
			// 2강, 4강인 경우 to_num과 rownum을 세팅
				// 4강 적재시 to_num=1, rownum=4 / 2강 적재시 to_num=2, rownum=2
				int rownum = 0;
				if(to_num == 1) {
					rownum = 4;
				}else if(to_num ==2) {
					rownum = 2;
				}
				
			// 2 or 4강에 적재된 데이터가 있는지 확인
				List<TournamentWorkVO> record = service.getTournamentData(to_num+1);
				log.info("▼ 4강 혹은 2강의 데이터가 있다면");
				log.info(record);
			
			// 데이터가 없다면 적재
				if(record.isEmpty()) {
					log.info("▶ 4강 혹은 2강의 데이터가 없어서 DB에 적재");
					service.insertTowork2or4(to_num, rownum);
				}
			
			// 적재된 데이터 리턴
				entity = new ResponseEntity<>(service.getTowork2or4or8(to_num+1), HttpStatus.OK);
				log.info("성공시 entity -> " + entity);
				
				
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;
	}
	
	
	
	// ■ 각 토너먼트 작품 조회 전, 이미 추천한 기록이 있는지 확인하기
	@GetMapping(value="/checkRec/{to_num}/{user_id}",
				produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TournamentWorkRecVO> checkRec(@PathVariable("user_id") String user_id, @PathVariable("to_num") long to_num){  
		
		log.info("들어온 유저 아이디 -> " + user_id);
		log.info("들어온 토너먼트 번호 -> " + to_num);
		
		
		ResponseEntity<TournamentWorkRecVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.checkRec(to_num, user_id), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
 	}
	

	
	
	// ■ 추천을 눌렀을 때, 작품의 추천수 +1 올리기(코드 변경 중) 
	@PostMapping(value="/up2",
					consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyRecUP2(@RequestBody TournamentWorkRecVO vo){
		
		ResponseEntity<String> entity = null;
		//log.info("들어온 towork_num -> "+ towork_num);
		log.info("들어온 TournamentWorkRecVO -> " + vo);
		
		try {
			
			//log.info("들어온 토너먼트 작품 번호 -> " + towork_num);
			log.info("들어온 TournamentWorkRecVO -> " + vo);
			
			// ● 추천수 +1
			service.upRec(vo.getTowork_num());
			// ● 추천 기록 테이블에 적재
			service.insertUpRecRecord(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	// ■ 예상 우승 작품 가져오기
	@GetMapping(value="/toWork/winner", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TournamentJoinVO> getWinner(){
		
		ResponseEntity<TournamentJoinVO> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.getWinner(), HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	
	
	// ■ 05.17 대회 우승시 사후처리 (novel_num, user_id)
	@GetMapping(value="/after", // /{novel_num}",
			    produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<TournamentJoinVO> afterTournament(){ // @PathVariable("novel_num")long novel_num){
		
		ResponseEntity<TournamentJoinVO> entity = null;
		
		try {
			// 자세한 변경 사항은 서비스임플에서 확인할 수 있음
			
				// 0) 우승 작품 번호
					TournamentJoinVO winner = service.getWinner();
					log.info("사후처리) 우승 작품 정보 -> " + winner);
					
					long novel_num = winner.getNovel_num();
					log.info("사후처리) 우승 작품 노블 번호 -> " + novel_num);
			
				// 1) 작품 & 작가 관련
					service.afterTowork1(novel_num);
				// 2) 대회 관련
					service.afterTowork2();

			entity = new ResponseEntity<>(winner, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	
//	// ■ 05.17 대회 우승시 사후처리 (novel_num, user_id)
//	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, 
//			 value="/after", // /{novel_num}",
//			 produces= {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> afterTournament(){ // @PathVariable("novel_num")long novel_num){
//		
//		ResponseEntity<String> entity = null;
//		
//		try {
//			// 자세한 변경 사항은 서비스임플에서 확인할 수 있음
//			
//				// 0) 우승 작품 번호
//					TournamentJoinVO winner = service.getWinner();
//					log.info("사후처리) 우승 작품 정보 -> " + winner);
//					
//					long novel_num = winner.getNovel_num();
//					log.info("사후처리) 우승 작품 노블 번호 -> " + novel_num);
//			
//				// 1) 작품 & 작가 관련
//					service.afterTowork1(novel_num);
//				// 2) 대회 관련
//					service.afterTowork2();
//
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		}catch(Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	
	
//		// ■ 05.17 우승 작품 노블 번호 얻어오기 (우승자 정보)
//		@GetMapping(value="/after/getWinnersNovelNum", produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
//		public ResponseEntity<TournamentJoinVO> getWinnersNovelNum(){
//			
//			ResponseEntity<TournamentJoinVO> entity = null;
//			
//			TournamentJoinVO vo = new TournamentJoinVO();
//			
//			log.info("우승작품 노블번호) novel_num 넣기 전 vo -> " + vo);
//			service.getWinnersNovelNum();
//			
//			try {
//				entity = new ResponseEntity<>();
//				
//			}catch(Exception e) {
//				e.printStackTrace()
//				entity = 
//			}
//			
//			return entity;
//		}
	
	
	
	
	
	
	
	
	
	
/*
	// ■ 8강 토너먼트 대회 참여 작품 리스트 조회
	@GetMapping(value="/toWork8", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> tournaList2(){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournamentWork2(), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	
		// ■ 특정 토너먼트 대회 참여 작품 리스트 가져오기 ('시작'버튼 클릭시 새로 적재하는 버전)
	@GetMapping(value="/toWork/{to_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> tournaWorkListAddVersion(@PathVariable("to_num") long to_num){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listTournamentWork(to_num), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	
	
	// ■ 05.04 특정 토너먼트 대회 참여 작품 리스트 가져오기 (적재 없이 그냥 가져오는 버전)
	@GetMapping(value="/toWork/get/{to_num}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE} )
	public ResponseEntity<List<TournamentJoinVO>> getTournaWorkList(@PathVariable("to_num") long to_num){
		
		ResponseEntity<List<TournamentJoinVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.get2and4WorkList(to_num), HttpStatus.OK);
			log.info("성공시 entity -> " + entity);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);	
			log.info("실패시 entity -> " + entity);
		}
		
		return entity;

	}
	

	
	
	
	// ■ 추천을 눌렀을 때, 작품의 추천수 +1 올리기
	@RequestMapping(value="/up/{towork_num}", 
					method= {RequestMethod.PUT, RequestMethod.PATCH},
					produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modifyRecUP(@PathVariable("towork_num") long towork_num){
		
		ResponseEntity<String> entity = null;
		log.info("들어온 towork_num -> "+ towork_num);
		
		try {
			
			log.info("들어온 토너먼트 작품 번호 -> " + towork_num);
			service.upRec(towork_num);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
*/
	
	
	
	
	
	
	
}
