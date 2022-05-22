package com.novel.enroll;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.novel.enroll.domain.EnrollVO;
import com.novel.enroll.mapper.EnrollMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EnrollTest {
	
	@Autowired
	private EnrollMapper mapper;
	
	
	// ■ 전체 리스트 가져오기
	//@Test
	public void getAllListTest() {
		List<EnrollVO> voList = mapper.getAllEnrollList();
		log.info(voList);
		
	}
	
	
	// ■ 디테일 가져오기
	//@Test
	public void getDetailTest() {
		log.info(mapper.getEnrollDetail(1));
	}
	
	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	@Test
	public void insertFormDateTest() {
		
		EnrollVO vo = new EnrollVO();
		
		vo.setNovel_title("test로 넣는 제목");
		vo.setNovel_writer("test로 넣는 필명");
		vo.setNovel_category("romance");
		vo.setUser_id("admin0");
		vo.setEnroll_intro("진짜 재밌는데 어케 설며앻야할쥐");
		
		mapper.insertEnrollFormData(vo);
	}
	

}
