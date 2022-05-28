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
		/*
		#tournament, #tournament8, #tournament4, #tournament2, #tournamentWork {
			margin: 0px 50px 40px;
		    column-gap: 40px;
		    padding-bottom: 16px;
		    grid-auto-columns: max-content;
		    display: grid;
		    grid-auto-flow: column;				/*아래X, 오른쪽으로 정렬됨*/
		    flex-wrap: wrap;
		    max-width: 100vw;
		    /*overflow: scroll hidden;*/
		    border : solid 3px black;
		    
		    text-align : center;
		}
		*/
		
		/* (변경 시도) 전체 레이아웃 이걸로 바꿈 */
		
			h3 {
				margin:0;
				padding : 0;
			}		
		
			#container{
				width : 100%;
				overflow-x: hidden;
				/*margin : 0;
				padding: 0;*/
			}
			#tournament, #tournament8, #tournament4, #tournament2, #tournamentWork{	
				text-align : center;
				padding: 10px 0px;
				overflow-x: hidden;
				width : 100%;
				background-color : whitesmoke;
			}

			.tourna-work-list{ 
				display:inline-block;  zoom:1;
				margin : 0px 30px;
				overflow-x: hidden;
				border : 1px solid black;
				width : 160px;
				background-color : white;
			}
			
			.tourna-work-list img{
				height : 190px;
				width: 165px;
				/*margin : 10px;*/
			}
			
			
			.endTournament{
				text-align : center;
			}
			

			
			
			
			
		/* 예상 우승 작품 */
			#winnerImg{
				text-align : center;
				width: 100%;
				padding:0;
			}
			#winner{
				text-align : center;
			}
			.tourna-work-winner{
				width : 100%;
				text-align : center;
			}
			
			.tourna-work-winner-title, .tourna-work-winner-writer, .tourna-work-winner-rec{
				text-align : center;
				width: 100%;
			}
			.tourna-work-winner-title{
				font-size : 30px;
			}
			.tourna-work-winner-rec{
				font-size : 25px;
			}
			
			
		/* 대회 종료 */
			.end-winner{
				text-align : center;
			}
			.end-winner-title{
				font-size : 30px;
			}
			.end-winner-rec{
				font-size : 20px;
			}
			#end a{
				text-decoration: none;
				color: black;
			}
			.end-winner-title:hover{
				color: green;
			}
			#end h1, h3{
				text-align : center;
			}
			
			
		/* 상단 네비바 */
			
			.social-part .fa{
		    	padding-right:20px;
			}
			
			ul li a{
		    	margin-right: 20px;
			}
			.header{
				height:80px;
				width:100%;
			}
			
		/* 버튼 */
	
	</style>

<meta charset="UTF-8">
<!-- 네비바 적용2) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="styleshett" href="header-navi.css"><!-- ◀ 헤더 네비바 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
<title>토너먼트 게시판</title>
</head>

<body>

	
	<!-- ■ jqueryCDN 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script> -->


	<!-- ■ 상단 네비바 : 네비바 적용3) -->
	<div class="header">
	    <nav class="navbar navbar-expand-sm   navbar-light bg-light">
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	          <span class="navbar-toggler-icon"></span>
	        </button>
	
        	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			            <li class="nav-item">
			            	<a class="nav-link" href="/">홈 <span class="sr-only">(current)</span></a>
			            </li>
			           
			            <li class="nav-item dropdown dmenu">
			           		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			              		소설 선택
			            	</a>
			            	<div class="dropdown-menu sm-menu">
			              		<a class="dropdown-item" href="/free/novelList">무료소설</a>
			              		<a class="dropdown-item" href="/paid/novelList">유료소설</a>
			              	</div>
			          	</li>
			          <li class="nav-item">
				            <a class="nav-link" href="/enroll/list">작품 신청 게시판</a>
			          </li>
			          <li class="nav-item">
				            <a class="nav-link" href="/tourna/list2">토너먼트</a>
			          </li>
			           <li class="nav-item">
			              	<a class="nav-link" href="http://localhost:8181/charge">결제</a>
		               </li>
		          </ul><!-- ul 태그 끝 -->
		          <div class="social-part">
		            <sec:authorize access="isAuthenticated()">
		            
		            <a href="/mypage/myInfo">내 정보</a></i>
		            </sec:authorize>
		            <sec:authorize access="isAnonymous()">
		            <i class="join"><a href="/secu/join">join</a></i>
					<i class="login"><a href="/customLogin">login</a></i>
					</sec:authorize>
		          </div>
	        </div><!-- div 끝 -->
	    </nav><!-- 네비바 끝 -->
     </div><!-- header 끝 --> 
          
	     <script>
	     
			  // 네비 메뉴바 마우스 호버하는 경우 (소설 선택 -> 유료/무료 소설 페이지 뜨도록)
			     $(document).ready(function () {
			     $('.navbar-light .dmenu').hover(function () {
			             $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
			         }, function () {
			             $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
			         });
			     });
	     
	     </script>
     
	 
	
	
	<!-- ■ 05.22 관리자에게만 보이도록 변경 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="endTournament">
			<button type="button" id="afterTournamentBtn" class="btn btn-success">대회 종료</button><br/>
		</div><br/>
	</sec:authorize>
	
	
	<div id="container">
		<div class="row">
			<!-- <h3 class="text-primary">예상 우승 작품 #winner</h3> -->
			<div id="winnerImg"><img src="/resources/tournament/winner.png"></div>
			<div id="winner"><!-- 리스트가 들어갈 위치 --></div>
		</div><br/><br/>
		
		
	
		
		<div class="row">
			<h3>웹소설 토너먼트 최강자 결승전</h3><!-- #tournament2 -->
			<div id="tournament2"><!-- 리스트가 들어갈 위치 --></div>
		</div><br/><br/>
		
	
		
		<div class="row">
	 		<h3>웹소설 토너먼트 최강자 8강전</h3> <!-- #tournament4 -->
			<div id="tournament4"><!-- 리스트가 들어갈 위치 --></div>
		</div><br/><br/>
		

		
		<div class="row">
	 		<h3>웹소설 토너먼트 최강자 8강전</h3><!-- #tournament8 -->
			<div id="tournament8"><!-- 리스트가 들어갈 위치 --></div>
		</div><br/><br/>
	</div>
	<div id="end"></div>
	
	
	<!-- 
	현재 로그인한 유저 정보 -> <sec:authentication property="principal.user"/>
	현재 로그인한 유저 권한 -> <sec:authentication property="principal.user.authList"/>
	 -->	
	
	
	<script>
	
	$(document).ready(function(){
	
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■ 스크립트 순서 ■■■■■■■■■■■■■■■■■■■■■■■■ -->
					<!-- ■ 변수 설정 -->
					<!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 -->
					<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 -->
					<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 -->
					<!-- ■ 추천 버튼 클릭시 +1 되는 함수 -->
					<!-- ● 8강 --><!-- ● 4강 --><!-- ● 2강 -->
					<!-- ■ 예상 우승 작품 -->
					<!-- ■ 대회 우승시 사후처리 -->
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
	
		
		<!-- ■ 변수 설정 -->
			
			// ● 로그인 아이디
			//let userInfo = "<sec:authentication property="principal.user"/>";
				//console.log("유저 정보 ▼");
				//console.log(userInfo);
				
			let id = "<sec:authentication property="principal.user.user_id"/>";
			//let id = "id012";
				console.log("변수 설정) sec로 받아온 아이디 -> " + id);
			
			// 추천한 아이디
			//let userId = "id012"; 
			
			<!-- ▣ 2. <script> 태그에서 변수로 받아준다. -->
			// ● csrf 토큰
			let token = $("meta[name='_csrf']").attr("content");
 			let header = $("meta[name='_csrf_header']").attr("content");
	 			//console.log("토큰, 헤더 ▼");
	 			//console.log(token);
	 			//console.log(header);

	 	<!-- ◈ 변경점 -->
	 		// 오늘 날짜 설정
	 		let now = new Date();
	 		
	 		// tourna_tbl에서 날짜 받아오기
	 		let sdate8;
	 		let edate8;
	 		
	 		let sdate4;
			let edate4;
			
			let sdate2;
			let edate2;
	 		
	 		
	 		// 우승자 노블 번호
	 		let winnersNovelNum = 0;

	 		
		
		<!-- ■ 05.18 함수 컨트롤러 -->
		
		function controller(){
		
			$.getJSON("/tournament/all", function(data){
				console.log("▼▼▼ controller 진입 후 '대회 준비기간' 출력")
				let controllerSdate = new Date(data[3].to_sdate);
				console.log("준비기간 시작 날짜 -> " + controllerSdate);
				
				// ◈ 변경점
				sdate8 = new Date(data[0].to_sdate);
				edate8 = new Date(data[0].to_edate);
				
				sdate4 = new Date(data[1].to_sdate);
				edate4 = new Date(data[1].to_edate);
				
				sdate2 = new Date(data[2].to_sdate);
				edate2 = new Date(data[2].to_edate);
				
				// ● 아직 대회가 진행중이라면
				if(now < controllerSdate){
					console.log("controller()진입 ) 준비 기간 시작일이 되지 않았음");
					$("#afterTournamentBtn").hide();
					
					
				 	// * 2강, 4강, 8강 불러오기
			 		getTournamentWorkList1(); // 8
					getTournament4List();	  // 4
					getTournament2List();	  // 2
					
					// * 우승작품 출력
					getWinner();
					

				// ● 대회가 끝나고 대음 대회 준비 기간이 시작되었다면
				}else if(now >= controllerSdate){
					console.log("controller()진입 ) 준비 기간 시작일이 지났음");
					$("#afterTournamentBtn").show();
					
					// * 화면 비우고 메세지 출력
						// div 태그들을 감싸는 #container를 비워줌
						$("#container").remove();
						
						// #end에 끼워넣을 태그용 변수 생성
						//let str =""
					
						// 우승 작품 데이터 가져옴
						$.getJSON("/tournament/toWork/winner", function(data){
							
							let str =""
							
							str = "<a href='http://localhost:8181/paid/List/" + data.novel_num + "'>"
									+ "<div class='end-winner' data-tno='" + data.to_num + "' data-twno='" + data.towork_num +"' data-novel-num='"+ data.novel_num +"'>"
										+    "<img src='/resources/tournament/winner.png'>"
										+	 "<div class='end-winner-title'>" + data.novel_title + "</div>"
										+ 	 "<div class='end-winner-rec'>" + data.towork_rec + "</div>"
									+ "</div><br/><br/>"
								+ "</a>";
								
							console.log("getJSON 안의 str -> " + str);
														
							
							// 메세지 출력 및 우승 작품 보여주기 
							
							$("#end").append("<h1>토너먼트가 종료되었습니다</h1><h3>다음 대회를 준비 중입니다</h3><br/><br/>");
							$("#end").append(str);
						
						});// end getJSON
						

						
						
				}// end elseif
				
			});// end getJSON
		
		}// end controller()
		controller();
		setInterval(getWinner, 1000); // 간격 : 1초
		

		<!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 -->
		function getTournamentWorkList1(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			// 0. 아이디 받아오기
			
				console.log("8강 로그인 아이디 -> " + id);
				
				// ● 버튼 초기 세팅
					// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
					let hideBtn = false;
					let deactivation = "";
				
			
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 1(8강)인 경우 데이터를 가져옴 
			$.getJSON("/tournament/checkRec/1/" + id, function(data){
				//console.log("▼ 8강 추천 기록 받아오기");
				//console.log(data);
				
				//console.log("▼ 가져온 데이터 유무");
				//console.log(data != null);
				
				// 받아온 추천 기록이 있다면 추천 버튼을 숨긴다(hideBtn을 false -> true로 만듦)
				if(data != null){
					hideBtn = true;
					console.log("hideBtn 상태 -> " + hideBtn);
				}
			});
			
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/get8list", function(data){ 
					
					let str = "";
					console.log("▼ 8강 참여 리스트");
					console.log(data);
					
					// ● 추천 버튼 비활성화 유무
						// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					//deactivation  = (hideBtn == true ? 'disabled' : '');
					
					console.log("★8★현재 시간이 8강 종료일을 지났는지?");
					console.log("edate8" + edate8);
					console.log(now > edate8);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
					
					/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리*/
					// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
					if(hideBtn == true || (now > edate8)){	
							deactivation = "disabled";
					}
					
					console.log("★8★현재 시간이 8강 시작일을 지났는지?");
					console.log("sdate8" + sdate8);
					console.log(now >= sdate8);
					
					// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
					// (나중에 주석 풀어야 함)
					if(now >= sdate8){
						$(data).each(function(){
								
								str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"' data-novel-num='" + this.novel_num +"'>"
										+ "<div class='tourna-work-list-div-img'>"+ "<a href='http://localhost:8181/free/series/" + this.novel_num + "'>" + "<img src='/resources/novel_image/" + this.novel_num + ".png'>" + "</a>" +"</div>"
										+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
										+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
										+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
										+ "<button type='button' class='button8 btn btn-light'" + deactivation +">추천</button>"
									+ "</div>";
								
							});
							
							$("#tournament8").html(str);
					}<!-- if 종료 -->
				});
			
		}<!-- □ 8강 불러오기 끝 -->
		
		
		//getTournamentWorkList1();
		

		
		<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 -->
		function getTournament4List(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 0. 아이디 받아오기
			
			console.log("4강 로그인 아이디 -> " + id);
			
			// ● 버튼 초기 세팅
				// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				let deactivation = "";
				
			
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 2(4강)인 경우 데이터를 가져옴 
			$.getJSON("/tournament/checkRec/2/" + id, function(data){
				//console.log("▼ 4강 추천 기록 받아오기");
				//console.log(data);
				
				//console.log("▼ 가져온 데이터 유무");
				//console.log(data != null);
				
				// 받아온 추천 기록이 있다면 추천 버튼을 숨긴다(hideBtn을 false -> true로 만듦)
				if(data != null){
					hideBtn = true;
					console.log("hideBtn 상태 -> " + hideBtn);
				}
			});
			
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/getList/1", function(data){
					
					let str = "";
					console.log("▼ 4강 참여 리스트");
					console.log(data);
					
					// ● 추천 버튼 비활성화 유무
					// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					//deactivation  = (hideBtn == true ? 'disabled' : '');
					
					console.log("★4★ 현재 시간이 4강 종료일을 지났는지?");
					console.log("edate4" + edate4);
					console.log(now > edate4);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
					
					/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리*/
					// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
					if(hideBtn == true || (now > edate4)){	
							deactivation = "disabled";
					}
					
					console.log("★4★ 현재 시간이 4강 시작일을 지났는지?");
					console.log("sdate4" + sdate4);
					console.log(now >= sdate4);
					
					// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
					// (나중에 주석 풀어야 함)
					if(now >= sdate4){
						$(data).each(function(){
							
							str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"' data-novel-num='" + this.novel_num +"'>"
									+ "<div class='tourna-work-list-div-img'>"+ "<a href='http://localhost:8181/free/series/" + this.novel_num + "'>" + "<img src='/resources/novel_image/" + this.novel_num + ".png'>" + "</a>" +"</div>"
									//+ "<div class='tourna-work-list-div-img'>"+ "<img src='/resources/novel_image/" + this.novel_num + ".png'>" +"</div>"
									+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
									+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
									+ "<div class='tsourna-work-list-div'>" + this.towork_rec + "</div>"
									+ "<button type='button' class='button8 btn btn-light' " + deactivation +">추천</button>"
								+ "</div>";
							
						});
						
						$("#tournament4").html(str);
					}<!-- if 종료 -->
				});
				
		}<!-- □ 4강 불러오기 끝 -->
		
		
		//getTournament4List();
		
		
		
		
		
		
		
		
		<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 -->
		function getTournament2List(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 0. 아이디 받아오기 
			
			console.log("2강 로그인 아이디 -> " + id);
			
			// ● 버튼 초기 세팅
				// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				let deactivation = "";
		
	
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 3(2강)인 경우 데이터를 가져옴 
			$.getJSON("/tournament/checkRec/3/" + id, function(data){
				//console.log("▼ 2강 추천 기록 받아오기");
				//console.log(data);
				
				//console.log("▼ 가져온 데이터 유무");
				//console.log(data != null);
				
				// 받아온 추천 기록이 있다면 추천 버튼을 숨긴다(hideBtn을 false -> true로 만듦)
				if(data != null){
					hideBtn = true;
					console.log("hideBtn 상태 -> " + hideBtn);
				}
			});
			
			
			// 3. 데이터 뿌리기
			$.getJSON("/tournament/getList/2", function(data){ // "/tournament/toWork/get/3
				
				let str = "";
				console.log("▼ 2강 참여 리스트");
				console.log(data);
				
				// ● 추천 버튼 비활성화 유무
				// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
				//deactivation  = (hideBtn == true ? 'disabled' : '');
				
				console.log("★2★ 현재 시간이 2강 종료일을 지났는지?");
				console.log("edate2" + edate2);
				console.log(now > edate2);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
				
				/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리*/
				// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
				if(hideBtn == true || (now > edate2)){	
					  deactivation = "disabled";
				}
				
				console.log("★2★ 현재 시간이 2강 시작일을 지났는지?");
				console.log("sdate2" + sdate2);
				console.log(now >= sdate2);
				
				// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
				// (나중에 주석 풀어야 함)
				if(now >= sdate2){
					$(data).each(function(){
						
						str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"' data-novel-num='" + this.novel_num +"'>"
						        + "<div class='tourna-work-list-div-img'>"+ "<a href='http://localhost:8181/free/series/" + this.novel_num + "'>" + "<img src='/resources/novel_image/" + this.novel_num + ".png'>" + "</a>" +"</div>"
						   	  //+ "<div class='tourna-work-list-div-img'>"+ "<img src='/resources/novel_image/" + this.novel_num + ".png'>" +"</div>"
								+ "<div class='tourna-work-list-div'>" + this.novel_title + "</div>"
								+ "<div class='tourna-work-list-div'>" + this.novel_writer + "</div>"
								+ "<div class='tourna-work-list-div'>" + this.towork_rec + "</div>"
								+ "<button type='button' class='button8 btn btn-light'" + deactivation +">추천</button>"
							+ "</div>";
						
					});
					
					$("#tournament2").html(str);
				}<!-- if 종료 -->
			});
			
		}<!-- □ 2강 불러오기 끝 -->
		
		//getTournament2List();
		
		
		
		
		<!-- ■ 추천 버튼 클릭시 +1 되는 함수 -->
				
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
						
						// 소설 번호
						let novelNum = $(this).parent().attr("data-novel-num");
						console.log("8강 소설 번호-> " + novelNum);
						
						// sec 태그로 받아온 아이디 확인
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
							user_id : id,
							novel_num : novelNum
						}),
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("8강 작품을 추천했습니다11");
								
								// 리스트 다시 가져오기
								getTournamentWorkList1();
								getWinner();
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
					
					// 소설 번호
					let novelNum = $(this).parent().attr("data-novel-num");
					console.log("8강 소설 번호-> " + novelNum);
					
					// sec 태그로 받아온 아이디 확인
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
							user_id : id,
							novel_num : novelNum
						}),
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("4강 작품을 추천했습니다");
								// 4강 리스트 가져오기
								getTournament4List();
								getWinner();
								
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
					
					// 소설 번호
					let novelNum = $(this).parent().attr("data-novel-num");
					console.log("8강 소설 번호-> " + novelNum);
					
					// sec 태그로 받아온 아이디 확인
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
							user_id : id,
							novel_num : novelNum
						}),
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("2강 작품을 추천했습니다");
								getTournament2List();
								getWinner();
							}
						}			
					});
				});
		

		
		
		
		<!-- ■ 예상 우승 작품 -->
		function getWinner(){
			
			$.getJSON("/tournament/toWork/winner", function(data){
				
				let str = "<div class='tourna-work-winner' data-tno='" + data.to_num + "' data-twno='" + data.towork_num +"' data-novel-num='"+ data.novel_num +"'>"
						//+ "<div class='tourna-work-list-div-img'>"+ "이미지 넣으니까 난리법석이라서 주석처리" +"</div>"
						//+ "<div class='tourna-work-list-div-img'>"+ "<img src='/resources/test_winner.png'>" +"</div>"
						+	 "<div class='tourna-work-winner-title'>" + data.novel_title + "</div>"
						//+ 	 "<div class='tourna-work-winner-writer'>" + data.novel_writer + "</div>"
						+ 	 "<div class='tourna-work-winner-rec'>" + data.towork_rec + "</div>"
						+ "</div>";
				
				$("#winner").html(str);
				
				winnersNovelNum = data.novel_num;
				console.log("예상우승작품) 우승자 노블 번호 --> " + winnersNovelNum);
			});
		}
		<!-- ● setInterval 3초에 한번씩-->
		//getWinner(); 위로 올라감
		//setInterval(getWinner, 3000);
		
		
		
		
		
		
		<!-- ■ 대회 우승시 사후처리 -->
		$("#afterTournamentBtn").on("click", function(){
	
			let sdateREADY ;
			let edateREADY ;
			
				
			if(confirm("다음 대회를 준비하시겠습니까?")){
					// 1. 대회준비(to_num=4) 시작일, 종료일을 받아옴
					$.getJSON("/tournament/all", function(data){
						
						console.log("▼▼▼▼▼▼▼▼ 전체 대회 리스트");
						console.log(data);
						console.log(data[3]);
						console.log(data[3].to_sdate);
						console.log(data[3].to_edate);
						
						sdateREADY = new Date(data[3].to_sdate);		// 대회준비 시작일 sdate
						edateREADY = new Date(data[3].to_edate);		// 대회준비 종료일 edate
						
						console.log("대회 준비 시작일 -> " + sdateREADY);
						console.log("대회 준비 종료일 -> " + edateREADY);
						
						console.log("현재 시간 -> " + now);
	
						console.log(sdateREADY >= now);
						console.log(sdateREADY == now);
						
	
					});
					
				// 2. 오늘이 대회 준비 시작일 이상이면 아래 코드 실행
				//if(sdateREADY >= now){
					console.log("▶▶▶ afterTournament 진입");
						
					$.getJSON("/tournament/after", function(data){
						console.log("▼▼▼ /after");
						console.log(data);
						
					});// end getJSON

				//}// end if
				
				$("#afterTournamentBtn").hide();
				
				// 화면 비우기? (위의 controller 함수에 있음)
				//$("#container").remove();
				//$("#end").html("<h1>다음 대회를 준비 중입니다.</h1>");
				
				
			}// end if-confirm
			
		});// end #afterTournamentBtn click
		
	});// end $(document).ready

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<%-- 		
		
		<!-- ■ 05.18 토너먼트 사후처리 -->
		function afterTournament(){
			console.log("afterTournament() 진입");
			
			$.ajax({
				
				type : 'put',
				url : '/tournament/after',
				header : {"X-HTTP-Method-Override" : "PUT"},
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("/after 완료");
					}
				}
				
			}); // end ajax
		}// end afterTournament()
		
		afterTournament();
		
		
		
		
		
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
		--%>
		
		<%-- 
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
		
		--%>
		
		<%-- 
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
		
				
		<div class="row">
	 		<h3 class="text-primary">대회 참여 리스트 #tournamentWork</h3>
			<div id="tournamentWork"><!-- 리스트가 들어갈 위치 --></div>
		</div>
	 
		
		<!-- ■ 토너먼트 전체 참여 리스트를 불러오는 함수 -->
		function getAllTournamentWorkList(){
			
			$.getJSON("/tournament/toWork2", function(data){
				
				let str = "";
				console.log("▼ 전체 대회 리스트");
				console.log(data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-work-list' data-tno='" + this.to_num + "' data-twno='" + this.towork_num +"' data-novel-num='" + this.novel_num +"'>"
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
		
		
		
			<!-- ■ 리스트가 추가될 공간 -->

 		<div class="row">
 			<h3 class="text-primary">전체 대회 리스트 #tournament</h3>
			<div id="tournament"><!-- 리스트가 들어갈 위치 --></div>
		</div>

		
		<!-- ■ 전체 리스트를 불러오는 함수 -->
		function getTournamentList(){
			
			$.getJSON("/tournament/all", function(data){
				
				let str = "";
				//console.log("전체 대회 리스트 -> " + data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-list' data-tno='" + this.to_num + "'>" + 
								this.to_name + //"! 시작일 : " + this.to_sdate + ", 종료일 : " + this.to_edate +
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
		
		
		--%>
		
		
		
	</script>
	
	
	


</body>
</html>