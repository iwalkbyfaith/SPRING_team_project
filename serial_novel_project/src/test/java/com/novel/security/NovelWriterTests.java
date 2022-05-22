package com.novel.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
public class NovelWriterTests {
	@Autowired // 암호화 담당
	private PasswordEncoder pwen;
	
	@Autowired // DB접근 담당
	private DataSource ds;
	
	
	// ■ 평문 비밀번호를 전부 암호화
	//@Test
	public void testCryptDefaultDB() {
		
		String[] idList = {"user22", "free22", "paid22", "admin22"};
		
		String sql = "UPDATE users set password=? WHERE username=?";
		
		try {
			
			Connection con = ds.getConnection();
			
			for(String id : idList) {
				PreparedStatement pstmt = con.prepareStatement(sql);
					// (디버깅)로그에 찍어서 확인하고 싶다면 이런식으로 해도 됨
						// String pw = pwen.encode("pw00");
						// log.info("암호화 후 : " + pw);
						//pstmt.setString(1, pw);
				pstmt.setString(1, pwen.encode("pw22"));	// 같은 비밀번호(pw00)라도 DB로 암호화 될때는 다르게 됨 ★
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
				
	}
	
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	// ■ (커스텀DB) 테스트 코드를 이용해 데이터 넣기 (일반회원)
	//@Test
	public void testuserCustomDB() {
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO user_tbl(user_id, user_pw, user_name, user_pnum, user_email, user_num) VALUES (?, ?, ?, ?, ?, user_num.nextval)";
			
			for(int i=0; i<10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "user" + i);
				pstmt.setString(2, pwen.encode("pw" + i)); // userpw에 암호화 비번 입력
				pstmt.setString(4, "010000000" + i);
				
				
				if(i < 10) {		
					pstmt.setString(3, "일반회원" + i);
					pstmt.setString(5, i + "@gmail.com");
					
				}				
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// ■ (커스텀DB) 이름에 맞는 권한 부여하기 (ROLE_USER)
	//@Test
	public void testInsertuserAuth() {
		
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO auth_tbl(user_id, auth, auth_num) values(?, ?, auth_num.nextval)";
			
			for(int i = 0; i < 10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				if(i < 10) {
					pstmt.setString(1, "user"+i);
					pstmt.setString(2, "ROLE_USER");
				}	
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	// ■ (커스텀DB) 테스트 코드를 이용해 데이터 넣기 (무료작가)
	//@Test
	public void testFreeWriterCustomDB() {
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO user_tbl(user_id, user_pw, user_name, user_pnum, user_email, user_num) VALUES (?, ?, ?, ?, ?, user_num.nextval)";
			
			for(int i=0; i<10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "freeWriter" + i);
				pstmt.setString(2, pwen.encode("pw" + i)); // userpw에 암호화 비번 입력
				pstmt.setString(4, "010000000" + i);
				
				
				if(i < 10) {		
					pstmt.setString(3, "무료작가" + i);
					pstmt.setString(5, i + "@gmail.com");
					
				}				
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// ■ (커스텀DB) 이름에 맞는 권한 부여하기 (ROLE_FREE_WRITER)
	//@Test
	public void testInsertFreeWriterAuth() {
		
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO auth_tbl(user_id, auth, auth_num) values(?, ?, auth_num.nextval)";
			
			for(int i = 0; i < 10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				if(i < 10) {
					pstmt.setString(1, "freeWriter"+i);
					pstmt.setString(2, "ROLE_FREE_WRTIER");
				}	
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	
	
	
	// ■ (커스텀DB) 테스트 코드를 이용해 데이터 넣기 (유료작가)
	//@Test
	public void testPaidWriterCustomDB() {
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO user_tbl(user_id, user_pw, user_name, user_pnum, user_email, user_num) VALUES (?, ?, ?, ?, ?, user_num.nextval)";
			
			for(int i=0; i<10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "paidWriter" + i);
				pstmt.setString(2, pwen.encode("pw" + i)); // userpw에 암호화 비번 입력
				pstmt.setString(4, "010000000" + i);
				
				
				if(i < 10) {		
					pstmt.setString(3, "유료작가" + i);
					pstmt.setString(5, i + "@gmail.com");
					
				}				
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// ■ (커스텀DB) 이름에 맞는 권한 부여하기 (ROLE_PAID_WRITER)
	//@Test
	public void testInsertPaidWriterAuth() {
		
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO auth_tbl(user_id, auth, auth_num) values(?, ?, auth_num.nextval)";
			
			for(int i = 0; i < 10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				if(i < 10) {
					pstmt.setString(1, "paidWriter"+i);
					pstmt.setString(2, "ROLE_PAID_WRTIER");
				}	
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	// ■ (커스텀DB) 테스트 코드를 이용해 데이터 넣기 (관리자)
	//@Test
	public void testAdminCustomDB() {
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO user_tbl(user_id, user_pw, user_name, user_pnum, user_email, user_num) VALUES (?, ?, ?, ?, ?, user_num.nextval)";
			
			for(int i=0; i<10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "admin" + i);
				pstmt.setString(2, pwen.encode("pw" + i)); // userpw에 암호화 비번 입력
				pstmt.setString(4, "010000000" + i);
				
				
				if(i < 10) {		
					pstmt.setString(3, "관리자" + i);
					pstmt.setString(5, i + "@gmail.com");
					
				}				
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// ■ (커스텀DB) 이름에 맞는 권한 부여하기 (ROLE_ADMIN)
	//@Test
	public void testInsertAuth() {
		
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO auth_tbl(user_id, auth, auth_num) values(?, ?, auth_num.nextval)";
			
			for(int i = 0; i < 10; i++) {
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				if(i < 10) {
					pstmt.setString(1, "admin"+i);
					pstmt.setString(2, "ROLE_ADMIN");
				}	
				pstmt.execute();
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	

}
