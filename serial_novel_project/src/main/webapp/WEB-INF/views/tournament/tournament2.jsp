<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	 <!-- ▣ ajax에 스프링 시큐리티 csrf 토큰 적용하기 ( 검색 키워드 : ▣ )-->
		 <!-- ▣ 1. <head>태그 사이에 아래 <meta> 태그 두 줄 추가 -->
		 <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	 	 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	
	
	<!-- ★ 부트스트랩 1. css 복붙 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- ★ 부트스트랩 2. 번들 복붙 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<style>
	
		#tournament, #tournament8, #tournament4, #tournament2, #tournamentWork, #winner{
			margin: 0px 50px 40px;
		    column-gap: 60px;
		    padding-bottom: 16px;
		    grid-auto-columns: max-content;
		    display: grid;
		    grid-auto-flow: column;				/*아래X, 오른쪽으로 정렬됨*/
		    flex-wrap: wrap;
		    max-width: 100vw;
		    /*overflow: scroll hidden;*/
		    border : solid 3px black;
		}
		
		.tourna-work-list{ background-color : whitesmoke;}
		
	
	</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	
	<!-- ■ jqueryCDN 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- ■ 리스트가 추가될 공간 -->
 	<div class="row">
 		<h3 class="text-primary">전체 대회 리스트 #tournament / (나중에)클릭시 해당 위치로 이동하게</h3>
		<div id="tournament"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
		<h3 class="text-primary">예상 우승 작품 #winner</h3>
		<div id="winner"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<%--
		<div class="row">
	 		<h3 class="text-primary">대회 참여 리스트 #tournamentWork</h3>
			<div id="tournamentWork"><!-- 리스트가 들어갈 위치 --></div>
		</div>
	 --%>  
	
	<div class="row">
		<h3 class="text-primary">대회 참여 리스트 2강(결승) #tournament2 <button type="button" id="tournament2Btn">참여하기</button> 참여하기 버튼 -> 버튼 없애고 해당하는 날짜에만 나오는 기능으로 바꿔야함(날짜 적용 완료)</h3>
		<div id="tournament2"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
 		<h3 class="text-primary">대회 참여 리스트 4강 #tournament4 <button type="button" id="tournament4Btn">참여하기</button></h3>
		<div id="tournament4"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
 		<h3 class="text-primary">대회 참여 리스트 8강 #tournament8</h3>
		<div id="tournament8"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	

	
	
	<hr/>
	현재 로그인한 유저 정보 -> <sec:authentication property="principal.user"/>
			
	
	
	<script>
	
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■ 스크립트 순서 ■■■■■■■■■■■■■■■■■■■■■■■■ -->
					<!-- ■ 변수 설정 -->
					<!-- ■ 전체 리스트를 불러오는 함수 -->
					<!-- ■ 토너먼트 전체 참여 리스트를 불러오는 함수 -->
					<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 (테이블 적재 버전)-->
					<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 (테이블 적재 버전)-->
					<!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 (코드 수정중) -->
					<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 (코드 수정중) -->
					<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 (코드 수정중) -->
					<!-- ■ 추천 버튼 클릭시 +1 되는 함수 (나중에 아이디 받아와야 함) -->
						<!-- ● 8강 --><!-- ● 4강 --><!-- ● 2강 -->
					<!-- ■ 예상 우승 작품 -->
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	
		// (나중에 주석 풀어야 함)	: 표시된 것 나중에 주석 풀기
		
		<!-- ■ 변수 설정 -->
			
			// ● 로그인 아이디
			let userInfo = "<sec:authentication property="principal.user"/>";
				console.log("유저 정보 ▼");
				console.log(userInfo);
				
			let id = "<sec:authentication property="principal.user.user_id"/>";
			//let id = "id012";
				console.log("변수 설정) sec로 받아온 아이디 -> " + id);
			
			// 추천한 아이디
			//let userId = "id012"; 
			
			<!-- ▣ 2. <script> 태그에서 변수로 받아준다. -->
			// ● csrf 토큰
			let token = $("meta[name='_csrf']").attr("content");
 			let header = $("meta[name='_csrf_header']").attr("content");
	 			console.log("토큰, 헤더 ▼");
	 			console.log(token);
	 			console.log(header);
	 			
	 		// 날짜 설정
	 		let now = new Date();
 			

		
		<!-- ■ 전체 리스트를 불러오는 함수 -->
		function getTournamentList(){
			
			$.getJSON("/tournament/all", function(data){
				
				let str = "";
				console.log("전체 대회 리스트 -> " + data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-list' data-tno='" + this.to_num + "'>" + 
								this.to_name + "! 시작일 : " + this.to_sdate + ", 종료일 : " + this.to_edate +
						   "</div>";

				/** 테스트
					// 현재시간
					let now = new Date();
						console.log("▼ 전체대회리스트) 현재 시간");
						console.log(now);
					// 각 대회별 기간
					let timestamp1 = this.to_sdate;
					let timestamp2 = this.to_edate;
					
					let startDate = new Date(timestamp1);
						console.log("▼ 전체대회리스트)" + this.to_name + "시작일");
						console.log(startDate);
					let endDate = new Date(timestamp2);
						console.log("▼ 전체대회리스트)" + this.to_name + " 종료일");
						console.log(endDate);
						
					// 날짜 비교
					console.log(now > startDate);
					console.log(now < startDate);
					*/	 
				});
				
				$("#tournament").html(str);
			});
			
		}
		
		getTournamentList();
		
		
		
		
		<!-- ■ 토너먼트 전체 참여 리스트를 불러오는 함수 -->
		function getAllTournamentWorkList(){
			
			$.getJSON("/tournament/toWork2", function(data){
				
				let str = "";
				console.log("▼ 전체 대회 리스트");
				console.log(data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"'>"
							+ "<div class='tourna-work-list-div'>나중에 이미지 넣을 자리</div>"
							+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
							+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
							+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
							+ "<button type='button'>추천</button>"
						+ "</div>";

				});
				
				$("#tournamentWork").html(str);
			});
			
		}
		
		//getAllTournamentWorkList();
		
		
		<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 (테이블 적재 버전)-->
		function getTournamentWorkList3(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 4강 기록이 있나 확인하기
			$.getJSON("/tournament/toWork/get/3", function(data){
				console.log("▼ 2강 기록이 있다면");
				console.log(data);
				console.log(data[1] == null);		// data가 DB에 없더라도 data==null이 false가 나오므로 인덱스 번호를 붙여야함
				
				if(data[1] == null){				// 기록이 없다면
					addTournamentWorkList3();		// -> 적재
				}else if(data[1] != null){			// 기록이 있다면
					getTournament2List();			// -> DB에서 불러오기
				}
				
			});
			
		}	
		
		function addTournamentWorkList3(){
			$.getJSON("/tournament/toWork/3", function(data){
				
				let str = "";
				
				console.log("▼ 2강 참여 리스트");
				console.log(data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"'>"
							+ "<div class='tourna-work-list-div'>나중에 이미지 넣을 자리</div>"
							+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
							+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
							+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
							+ "<button type='button'>추천</button>"
						+ "</div>";

				});
				
				$("#tournament2").html(str);
			});
			
		}
		
		//$("#tournament2Btn").on("click", function(){
			getTournamentWorkList3();
			// 클릭시 버튼 안 보이게
		//	let target = document.getElementById('tournament2Btn');
		//	target.style.display = "none";
		//})
		
		
		
		<!-- ■ 토너먼트 4강 참여 리스트가 DB에 없는 경우는 '적재', 있는 경우는 '가져오기'-->
			<!-- getTournamentWorkList2() & addTournamentWorkList2()-->
		
		function getTournamentWorkList2(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 4강 기록이 있나 확인하기
			$.getJSON("/tournament/toWork/get/2", function(data){
				console.log("▼ 4강 기록이 있다면");
				console.log(data);
				console.log(data[1] == null);		// data가 DB에 없더라도 data==null이 false가 나오므로 인덱스 번호를 붙여야함
				
				if(data[1] == null){				// 기록이 없다면
					addTournamentWorkList2();		// -> 적재
				}else if(data[1] != null){			// 기록이 있다면
					getTournament4List();			// -> DB에서 불러오기
				}
				
			});
		}
		
		function addTournamentWorkList2(){
			
			$.getJSON("/tournament/toWork/2", function(data){
				
				let str = "";
				
				console.log("▼ 4강 참여 리스트");
				console.log(data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"'>"
							+ "<div class='tourna-work-list-div'>나중에 이미지 넣을 자리</div>"
							+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
							+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
							+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
							+ "<button type='button'>추천</button>"
						+ "</div>";

				});
				
				$("#tournament4").html(str);
			});
		} // 함수 addTournamentWorkList2() 끝
		
		
		
		//$("#tournament4Btn").on("click", function(){
			getTournamentWorkList2();
			
			// 클릭시 버튼 안 보이게
		//	let target = document.getElementById('tournament4Btn');
			//target.disabled = true; (얘는 남아 있는 상태로 비활성화)
		//	target.style.display = "none";
		//})
		
		

		
		
		<!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournamentWorkList1(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			// 0. 아이디 받아오기
			
				console.log("8강 로그인 아이디 -> " + id);
				
				// ● 버튼 초기 세팅
					// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
					let hideBtn = false;
					let deactivation = "";
				
				// ● 8강 시작일 & 종료일
				let sdate8;
				let edate8;
				
			
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 1(8강)인 경우 데이터를 가져옴 
			$.getJSON("/tournament/checkRec/1/" + id, function(data){
				console.log("▼ 8강 추천 기록 받아오기");
				console.log(data);
				
				console.log("▼ 가져온 데이터 유무");
				console.log(data != null);
				
				// 받아온 추천 기록이 있다면 추천 버튼을 숨긴다(hideBtn을 false -> true로 만듦)
				if(data != null){
					hideBtn = true;
					console.log("hideBtn 상태 -> " + hideBtn);
				}
			});
			
			
			// 2. 현재 시간 구하기
			
			console.log("▼ 8강) 현재 시간")
			console.log(now);
			
			$.getJSON("/tournament/all", function(data){
				console.log(data);							// 모든 대회 정보
				console.log(data[0]);						// 웹소설 최강자 8강전
				console.log(data[0].to_sdate);				// 웹소설 최강자 8강전 시작일
				
				let sdate = new Date(data[0].to_sdate);		// 시작일 sdate
				sdate8 = new Date(data[0].to_sdate);
				console.log(sdate8);
				console.log(now > sdate);	 				// 오늘이 시작일을 지났으면 true
				
				edate8 = new Date(data[0].to_edate);			// 종료일 edate
				console.log(edate8);
				console.log(now < edate8);					// 오늘이 종료
				
			});
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/toWork8", function(data){
					
					let str = "";
					console.log("▼ 8강 참여 리스트");
					console.log(data);
					
					// ● 추천 버튼 비활성화 유무
						// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					//deactivation  = (hideBtn == true ? 'disabled' : '');
					
					console.log("현재 시간이 8강 종료일을 지났는지?");
					console.log(now > edate8);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
					
					/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리*/
					// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
					if(hideBtn == true || (now > edate8)){	
							deactivation = "disabled";
					}
					
					console.log("현재 시간이 8강 시작일을 지났는지?");
					console.log(now >= sdate8);
					
					// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
					// (나중에 주석 풀어야 함)
					if(now >= sdate8){
						$(data).each(function(){
								
								str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"'>"
										+ "<div class='tourna-work-list-div'>나중에 이미지 넣을 자리</div>"
										+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
										+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
										+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
										+ "<button type='button' class='button8' " + deactivation +">추천</button>"
									+ "</div>";
								
							});
							
							$("#tournament8").html(str);
					}<!-- if 종료 -->
				});
			
		}<!-- □ 8강 불러오기 끝 -->
		
		
		getTournamentWorkList1();
		
		
	
		
		<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournament4List(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 0. 아이디 받아오기
			
			console.log("4강 로그인 아이디 -> " + id);
			
			// ● 버튼 초기 세팅
				// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				let deactivation = "";
			
			// ● 8강 시작일 & 종료일
			let sdate4;
			let edate4;
				
			
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 2(4강)인 경우 데이터를 가져옴 
			$.getJSON("/tournament/checkRec/2/" + id, function(data){
				console.log("▼ 4강 추천 기록 받아오기");
				console.log(data);
				
				console.log("▼ 가져온 데이터 유무");
				console.log(data != null);
				
				// 받아온 추천 기록이 있다면 추천 버튼을 숨긴다(hideBtn을 false -> true로 만듦)
				if(data != null){
					hideBtn = true;
					console.log("hideBtn 상태 -> " + hideBtn);
				}
			});
			
			
			// 2. 현재 시간 구하기
			
			console.log("▼ 4강) 현재 시간")
			console.log(now);
			
			$.getJSON("/tournament/all", function(data){
				console.log(data);							// 모든 대회 정보
				console.log(data[1]);						// 웹소설 최강자 8강전
				console.log(data[1].to_sdate);				// 웹소설 최강자 8강전 시작일
				
				sdate4 = new Date(data[1].to_sdate);		// 시작일 sdate
				//sdate = new Date(data[1].to_sdate);
				console.log(sdate4);
				console.log(now > sdate4);	 				// 오늘이 시작일을 지났으면 true
				
				edate4 = new Date(data[1].to_edate);			// 종료일 edate
				console.log(edate4);
				console.log(now < edate4);					// 오늘이 종료
				
			});
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/toWork/get/2", function(data){
					
					let str = "";
					console.log("▼ 4강 참여 리스트");
					console.log(data);
					
					// ● 추천 버튼 비활성화 유무
					// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					//deactivation  = (hideBtn == true ? 'disabled' : '');
					
					console.log("현재 시간이 4강 종료일을 지났는지?");
					console.log(now > edate4);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
					
					/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리*/
					// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
					if(hideBtn == true || (now > edate4)){	
							deactivation = "disabled";
					}
					
					console.log("현재 시간이 4강 시작일을 지났는지?");
					console.log(now >= sdate4);
					
					// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
					// (나중에 주석 풀어야 함)
					if(now >= sdate4){
						$(data).each(function(){
							
							str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"'>"
									+ "<div class='tourna-work-list-div'>나중에 이미지 넣을 자리</div>"
									+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
									+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
									+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
									+ "<button type='button' class='button8' " + deactivation +">추천</button>"
								+ "</div>";
							
						});
						
						$("#tournament4").html(str);
					}<!-- if 종료 -->
				});
				
		}<!-- □ 4강 불러오기 끝 -->
		
		
		//getTournament4List();
		
		
		
		<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournament2List(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 0. 아이디 받아오기 
			
			console.log("2강 로그인 아이디 -> " + id);
			
			// ● 버튼 초기 세팅
				// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				let deactivation = "";
			
			// ● 2강 시작일 & 종료일
			let sdate2;
			let edate2;
		
	
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 3(2강)인 경우 데이터를 가져옴 
			$.getJSON("/tournament/checkRec/3/" + id, function(data){
				console.log("▼ 2강 추천 기록 받아오기");
				console.log(data);
				
				console.log("▼ 가져온 데이터 유무");
				console.log(data != null);
				
				// 받아온 추천 기록이 있다면 추천 버튼을 숨긴다(hideBtn을 false -> true로 만듦)
				if(data != null){
					hideBtn = true;
					console.log("hideBtn 상태 -> " + hideBtn);
				}
			});
			
			
			// 2. 현재 시간 구하기
			console.log("▼ 2강) 현재 시간")
			console.log(now);
			
			$.getJSON("/tournament/all", function(data){
				console.log(data);							// 모든 대회 정보
				console.log(data[2]);						// 웹소설 최강자 8강전
				console.log(data[2].to_sdate);				// 웹소설 최강자 8강전 시작일
				
				sdate2 = new Date(data[2].to_sdate);		// 시작일 sdate
				//sdate = new Date(data[2].to_sdate);
				console.log("2강 시작일 : " + sdate2);
				console.log(now >= sdate2);	 				// 오늘이 시작일을 지났으면 true
				
				edate2 = new Date(data[2].to_edate);			// 종료일 edate
				console.log("2강 종료일 : " + edate2);
				console.log(now < edate2);					// 오늘이 종료
				
			});
			
			// 3. 데이터 뿌리기
			$.getJSON("/tournament/toWork/get/3", function(data){
				
				let str = "";
				console.log("▼ 2강 참여 리스트");
				console.log(data);
				
				// ● 추천 버튼 비활성화 유무
				// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
				//deactivation  = (hideBtn == true ? 'disabled' : '');
				
				console.log("현재 시간이 2강 종료일을 지났는지?");
				console.log(now > edate2);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
				
				/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리*/
				// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
				if(hideBtn == true || (now > edate2)){	
					  deactivation = "disabled";
				}
				
				console.log("현재 시간이 2강 시작일을 지났는지?");
				console.log(now >= sdate2);
				
				// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
				// (나중에 주석 풀어야 함)
				if(now >= sdate2){
					$(data).each(function(){
						
						str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"'>"
								+ "<div class='tourna-work-list-div'>나중에 이미지 넣을 자리</div>"
								+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
								+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
								+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
								+ "<button type='button' class='button8' " + deactivation +">추천</button>"
							+ "</div>";
						
					});
					
					$("#tournament2").html(str);
				}<!-- if 종료 -->
			});
			
		}<!-- □ 2강 불러오기 끝 -->
		
		
		
		
		
		
		<!-- ■ 추천 버튼 클릭시 +1 되는 함수 (나중에 아이디 받아와야 함)-->
				
			<!-- ● 8강 -->
			$("#tournament8").on("click", "button", function(){
				
				//if(confirm("8강 작품) 정말 추천하시겠습니까?")){
				
					// ○ 컨트롤러의 vo로 보낼 정보 (아이디, 대회 번호, 작품 번호)
				
						// 작품 번호
						let toworkNum = $(this).parent().attr("data-twno");	
						console.log("8강 작품 대회 번호 -> " + toworkNum);
						
						// 대회 번호
						let toNum = $(this).parent().attr("data-tno");
						console.log("8강 대회 번호 -> " + toNum);
						
						// 아이디 어떻게 받을지 질문(ajax에서도 세션을 사용하는지?) -> 나중에 배움
						//let userId = "id012"; // 8강추천아이디
						//console.log("8강 추천한 아이디 -> " + userId);
						console.log("8강 추천한 아이디 -> " + id);
						
						
					$.ajax({
						type : 'post',
						url : '/tournament/up2',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						beforeSend : function(xhr){					// <!-- ▣ 3. post로 보내기 전 beforeSend를 추가해줌 -->
							xhr.setRequestHeader(header, token);
						},
						contentType: 'application/json',			// ★ post 415에러 떴을때 코드 추가 했더니 됐음
						data : JSON.stringify({ 
							towork_num : toworkNum,
							to_num : toNum,
							user_id : id
						}),
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("8강 작품을 추천했습니다11");
								
								// 리스트 다시 가져오기
								getTournamentWorkList1();
							}
						}			
					});
					
					//$(".button8").attr("disabled", true);				
				//};
				
			});
			
				
				<!-- ● 4강 -->
				$("#tournament4").on("click", "button", function(){
					
					// 작품 번호
					let toworkNum = $(this).parent().attr("data-twno");	
					console.log("4강 작품 대회 번호 -> " + toworkNum);
					
					// 대회 번호
					let toNum = $(this).parent().attr("data-tno");
					console.log("4강 대회 번호 -> " + toNum);
					
					// 아이디 어떻게 받을지 질문(ajax에서도 세션을 사용하는지?) -> 나중에 배움
					//let userId = "id012"; // 4강추천아이디
					console.log("4강 추천한 아이디 -> " + id);
					
					
					$.ajax({
						type : 'post',
						url : '/tournament/up2',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						beforeSend : function(xhr){					
							xhr.setRequestHeader(header, token);
						},
						contentType: 'application/json',			// ★ post 415에러 떴을때 코드 추가 했더니 됐음
						data : JSON.stringify({ 
							towork_num : toworkNum,
							to_num : toNum,
							user_id : id
						}),
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("4강 작품을 추천했습니다");
								// 4강 리스트 가져오기
								getTournament4List();
								
							}
						}			
					});
				});
				
				
				
				<!-- ● 2강 -->
				$("#tournament2").on("click", "button", function(){
					
					// 작품 번호
					let toworkNum = $(this).parent().attr("data-twno");	
					console.log("2강 작품 대회 번호 -> " + toworkNum);
					
					// 대회 번호
					let toNum = $(this).parent().attr("data-tno");
					console.log("2강 대회 번호 -> " + toNum);
					
					// 아이디 어떻게 받을지 질문(ajax에서도 세션을 사용하는지?) -> 나중에 배움
					//let userId = "id012"; // 2강추천아이디
					console.log("2강 추천한 아이디 -> " + id);
					
					
					$.ajax({
						type : 'post',
						url : '/tournament/up2',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						beforeSend : function(xhr){					
							xhr.setRequestHeader(header, token);
						},
						contentType: 'application/json',			// ★ post 415에러 떴을때 코드 추가 했더니 됐음
						data : JSON.stringify({ 
							towork_num : toworkNum,
							to_num : toNum,
							user_id : id
						}),
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("2강 작품을 추천했습니다");
								getTournament2List();
								// 한 번 누른 버튼 비활성화 시키기. 다른 작품들까지
							}
						}			
					});
				});
		

		
		
		
		<!-- ■ 예상 우승 작품 -->
		function getWinner(){
			
			$.getJSON("/tournament/toWork/winner", function(data){
				
				let str = "<div class='tourna-work-winner' data-tno='" + data.to_num + "' data-twno='" + data.towork_num +"'>"
						+ 	 "<div class='tourna-work-winner-div'>나중에 이미지 넣을 자리</div>"
						+	 "<div class='tourna-work-winner-div'>" + data.novel_title + "</div>"
						+ 	 "<div class='tourna-work-winner-div'>" + data.novel_writer + "</div>"
						+ 	 "<div class='tourna-work-winner-div'>" + data.towork_rec + "</div>"
						+ "</div>";
				
				$("#winner").html(str);
			});
		}
		<!-- ● setInterval 3초에 한번씩-->
		getWinner();
		setInterval(getWinner, 3000);
		
		
		
		
		
	</script>
	
	
	


</body>
</html>