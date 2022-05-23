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
		log.info(mapper.getEnrollDetail(8));
	}
	
	// ■ 신청 폼에 입력한 데이터를 DB에 적재하기
	//@Test
	public void insertFormDateTest() {
		
		EnrollVO vo = new EnrollVO();
		
		vo.setNovel_title("test로 넣는 제목22");
		vo.setNovel_writer("test로 넣는 필명22");
		vo.setNovel_category("romance");
		vo.setUser_id("admin0");
		vo.setEnroll_intro("진짜 재밌는데 어케 설며앻야할쥐222");
		
		mapper.insertEnrollFormData(vo);
	}
	
	// ■ 관리자 승인 버튼에 따른 enroll_result 변경
	//@Test
	public void updateEnrollResultTest() {

		EnrollVO vo = new EnrollVO();
		
		vo.setEnroll_num(8);
		vo.setEnroll_result(3);
		
		mapper.updateEnrollResult(vo);
	}
	
	
	// ■ enroll_result가 2(무료 승인)인 경우 novel_tbl에 free로 적재하기
	//@Test
	public void insertEnrollDataTest() {
		
		EnrollVO vo = new EnrollVO();
		
		// #{novel_writer}, #{user_id}, #{novel_title}, #{novel_category}
		
		vo.setNovel_writer("작가3");
		vo.setUser_id("admin0");
		vo.setNovel_title("제목3");
		vo.setNovel_category("romance");
		
		log.info("세팅된 vo -> " + vo);
		
		mapper.insertEnrollFormData(vo);
		
		
	}
	
	
	// ■ enroll_result값에 따른 리스트 가져오기
	@Test
	public void selectEnrollxxList() {
		log.info(mapper.getEnrollxxList(2));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
