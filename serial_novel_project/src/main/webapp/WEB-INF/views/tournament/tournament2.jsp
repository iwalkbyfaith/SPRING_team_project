<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	
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
		<h3 class="text-primary">대회 참여 리스트 2강(결승) #tournament2 <button type="button" id="tournament2Btn">참여하기</button> 참여하기 버튼 -> 버튼 없애고 해당하는 날짜에만 나오는 기능으로 바꿔야함</h3>
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
	
	
	

	
	
	<script>
	
			<!-- ■■■■■■■■■■■■■■■■■■■■■■■■ 스크립트 순서 ■■■■■■■■■■■■■■■■■■■■■■■■ -->
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
	
		
		<!-- ■ 변수 설정 -->
			
			// 로그인 아이디
			let id = "id012";
			
			// 추천한 아이디
			let userId = "id012"; 
		
		<!-- ■ 전체 리스트를 불러오는 함수 -->
		function getTournamentList(){
			
			$.getJSON("/tournament/all", function(data){
				
				let str = "";
				console.log("전체 대회 리스트 -> " + data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-list' data-tno='" + this.to_num + "'>" + this.to_name + "</div>";

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
		
		$("#tournament2Btn").on("click", function(){
			getTournamentWorkList3();
			// 클릭시 버튼 안 보이게
			let target = document.getElementById('tournament2Btn');
			target.style.display = "none";
		})
		
		
		
		<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 (테이블 적재 버전)-->
		function getTournamentWorkList2(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			// 1. 만약 이미 추천한 기록이 있다면, '참여하기' 버튼을 눌렀을 때 또 다시 적재하지 말아야 함. ( 그냥 데이터 불러오기만 )
			
				//let id = "id012";
			
			// 2.
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
			
		}
		
		$("#tournament4Btn").on("click", function(){
			getTournamentWorkList2();
			
			// 클릭시 버튼 안 보이게
			let target = document.getElementById('tournament4Btn');
			//target.disabled = true; (얘는 남아 있는 상태로 비활성화)
			target.style.display = "none";
		})
		
		

		
		
		<!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournamentWorkList1(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			// 0. 아이디 받아오기 (로그인한 유저가 8강을 추천한 경우 값이 존재)
			
				// (임시)나중에 로그인한 아이디 받아오기
				//let id = "id012";	   
				console.log("8강 로그인 아이디 -> " + id);
				
				// (버튼 초기 세팅)추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				
			
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
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/toWork8", function(data){
					
					let str = "";
					console.log("▼ 8강 참여 리스트");
					console.log(data);
					
					// ● 비활성화 유무
						// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					let deactivation  = (hideBtn == true ? 'disabled' : '');
					
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
				});
			
		}<!-- □ 8강 불러오기 끝 -->
		
		
		getTournamentWorkList1();
		
		
	
		
		<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournament4List(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 0. 아이디 받아오기 (로그인한 유저가 8강을 추천한 경우 값이 존재)
			
				// (임시)나중에 로그인한 아이디 받아오기
				//let id = "id012";	     	 
				console.log("4강 로그인 아이디 -> " + id);
				
				// (버튼 초기 세팅)추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				
			
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 1(8강)인 경우 데이터를 가져옴 
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
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/toWork/get/2", function(data){
					
					let str = "";
					console.log("▼ 4강 참여 리스트");
					console.log(data);
					
					// ● 비활성화 유무
						// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					let deactivation  = (hideBtn == true ? 'disabled' : '');
					
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
				});
			
		}<!-- □ 4강 불러오기 끝 -->
		
		
		//getTournament4List();
		
		
		
		<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournament2List(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			
			// 0. 아이디 받아오기 (로그인한 유저가 8강을 추천한 경우 값이 존재)
			
				// (임시)나중에 로그인한 아이디 받아오기
				//let id = "id012";
				console.log("2강 로그인 아이디 -> " + id);	
			
				// (버튼 초기 세팅)추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
		
	
			// 1. 추천 기록 받아오기 (DB) : 로그인한 id & to_num = 1(8강)인 경우 데이터를 가져옴 
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
			
			// 3. 데이터 뿌리기
			$.getJSON("/tournament/toWork/get/3", function(data){
				
				let str = "";
				console.log("▼ 2강 참여 리스트");
				console.log(data);
				
				// ● 비활성화 유무
					// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
				let deactivation  = (hideBtn == true ? 'disabled' : '');
				
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
						console.log("8강 추천한 아이디 -> " + userId);
						
						
					$.ajax({
						type : 'post',
						url : '/tournament/up2',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						contentType: 'application/json',			// ★ post 415에러 떴을때 코드 추가 했더니 됐음
						data : JSON.stringify({ 
							towork_num : toworkNum,
							to_num : toNum,
							user_id : userId
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
					console.log("4강 추천한 아이디 -> " + userId);
					
					
					$.ajax({
						type : 'post',
						url : '/tournament/up2',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						contentType: 'application/json',			// ★ post 415에러 떴을때 코드 추가 했더니 됐음
						data : JSON.stringify({ 
							towork_num : toworkNum,
							to_num : toNum,
							user_id : userId
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
					console.log("2강 추천한 아이디 -> " + userId);
					
					
					$.ajax({
						type : 'post',
						url : '/tournament/up2',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						contentType: 'application/json',			// ★ post 415에러 떴을때 코드 추가 했더니 됐음
						data : JSON.stringify({ 
							towork_num : toworkNum,
							to_num : toNum,
							user_id : userId
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