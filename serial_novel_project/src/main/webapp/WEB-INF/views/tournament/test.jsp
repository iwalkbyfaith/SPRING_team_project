<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
	<script>
	 <!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 (코드 수정중) -->
		function getTournamentWorkList1(){
			console.log("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
			// 0. 아이디 받아오기 (로그인한 유저가 8강을 추천한 경우 값이 존재)
			
			console.log("8강 로그인 아이디 -> " + id);
			
			// ● 버튼 초기 세팅
				// 추천 버튼 숨기기 = false 상태 (추천한 기록이 없기 때문에 추천 버튼은 활성화 된 상태)
				let hideBtn = false;
				let deactivation = "";
			
			// ● 8강 시작일 & 종료일
			let sdate;
			let edate;
				
			
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
				sdate = new Date(data[0].to_sdate);
				console.log(sdate);
				console.log(now > sdate);	 				// 오늘이 시작일을 지났으면 true
				
				edate = new Date(data[0].to_edate);			// 종료일 edate
				console.log(edate);
				console.log(now < edate);					// 오늘이 종료
				
			});
			
			// 3. 데이터 뿌리기
			
				$.getJSON("/tournament/toWork8", function(data){
					
					let str = "";
					console.log("▼ 8강 참여 리스트");
					console.log(data);
					
					// ● 추천 버튼 비활성화 유무
						// 해당 토너먼트의 작품을 추천한 기록(아이디)이 있다면 버튼 태그가 disabled가 되게 함
					deactivation  = (hideBtn == true ? 'disabled' : '');
					
					console.log("현재 시간이 종료일보다 어떤지");
					console.log(now > edate);				// true면 이미 대회 종료일을 지났다는 뜻 (-> 추천 버튼 비활성화)
					
					/* (나중에 주석 풀어야 함) -> 3항연산자는 주석처리
					// 추천 버튼을 눌렀거나 or 종료일이 지난 상태라면 '추천' 비활성화
					if(hideBtn == true || (now > edate)){	
							deactivation = "disabled";
					}
					*/
					console.log("현재 시간이 시작일보다 어떤지");
					console.log(now >= sdate);
					
					// ● 현재 시간이 대회의 시작 날짜보다 크거나 같아야 데이터를 화면에 뿌림
					// (나중에 주석 풀어야 함)
					//if(now >= sdate){
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
					//}<!-- if 종료 -->
				});
			
		}<!-- □ 8강 불러오기 끝 -->
		
		
		getTournamentWorkList1();
		
	</script>
	--%> 
</body>
</html>