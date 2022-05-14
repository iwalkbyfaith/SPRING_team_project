package com.novel.tournament.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.tournament.domain.TournamentWorkVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TournamentTest {
	
	@Autowired
	private TournamentMapper mapper;
	
	//@Test	// 8강 적재하기
	public void get8List(){
		
		// 8강 데이터가 있는지 확인
		List<TournamentWorkVO> record8 = mapper.getTournamentData(1);
		log.info("▼ 8강 데이터가 이미 있다면 가져옴");
		log.info(record8);
		log.info("null인가요? -> " + record8 == null);
		log.info("isEmpty인가요? -> " + record8.isEmpty());
		
		// 8강 데이터가 없다면 적재
		if(record8.isEmpty()) {
			log.info("▼ 8강 데이터가 없다면 적재");
			List<Integer> list8 = mapper.select8ToworkRecord();
			log.info(list8);
			
			for(int novel_num : list8) {
				TournamentWorkVO vo = new TournamentWorkVO();
				vo.setNovel_num(novel_num);
				vo.setTo_num(1);
				log.info("생성된 new vo");
				log.info(vo);
				mapper.insert8Towork(vo);
			}
		}
	}
	
	
	// 2강, 4강, 8강 불러오기
	//@Test
	public void getTowork2or4or8Test() {
		
		long to_num = 3;
		log.info(mapper.getTowork2or4or8(to_num));
	}
	
	// 05.14 토너먼트 2강 or 4강에 들어갈 작품 적재하기
	//@Test
	public void insertTowork2or4() {
		// 4강 적재시 to_num=1, rownum=4
			//mapper.insertTowork2or4(1, 4);
		// 2강 적재시 to_num=2, rownum=2
			//mapper.insertTowork2or4(2, 2);
		
	}
	
	
	@Test
	public void insertTowork2or4Test() {
		
		long to_num=1;
		
		
		int rownum = 0;
		if(to_num == 1) {
			rownum = 4;
		}else if(to_num ==2) {
			rownum = 2;
		}
		
		log.info("들어온 토너먼트 번호 -> " + to_num);
		log.info("들어온 rownum 번호 -> " + rownum);
		
		
	// 2 or 4강에 적재된 데이터가 있는지 확인
		List<TournamentWorkVO> record = mapper.getTournamentData(to_num+1);
		log.info("▼ 4강 혹은 2강의 데이터가 있다면");
		log.info(record);
	
	// 데이터가 없다면 적재
		if(record.isEmpty()) {
			log.info("▶ 4강 혹은 2강의 데이터가 없어서 DB에 적재");
			mapper.insertTowork2or4(to_num, rownum);
		}
	
	// 적재된 데이터 리턴
		log.info(mapper.getTowork2or4or8(to_num+1));
	}
	
	

}
