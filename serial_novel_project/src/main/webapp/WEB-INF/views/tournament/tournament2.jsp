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
		    grid-auto-flow: column;				/*오른쪽으로 정렬됨*/
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
 		<h3 class="text-primary">전체 대회 리스트 #tournament</h3>
		<div id="tournament"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
		<h3 class="text-primary">예상 우승 작품 #winner</h3>
		<div id="winner"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
 		<h3 class="text-primary">대회 참여 리스트 #tournamentWork</h3>
		<div id="tournamentWork"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
		<h3 class="text-primary">대회 참여 리스트 2강(결승) #tournament2 <button type="button" id="tournament2Btn">시작</button></h3>
		<div id="tournament2"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
 		<h3 class="text-primary">대회 참여 리스트 4강 #tournament4 <button type="button" id="tournament4Btn">시작</button></h3>
		<div id="tournament4"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
 		<h3 class="text-primary">대회 참여 리스트 8강 #tournament8</h3>
		<div id="tournament8"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	
	

	
	
	<script>
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
		
		
		<!-- ■ 예상 우승 작품 -->
		function winner(){
			
		}
		
		
		
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
		
		getAllTournamentWorkList();
		
		
		<!-- ■ 토너먼트 2강 참여 리스트를 불러오는 함수 -->
		function getTournamentWorkList3(){
			
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
		})
		
		
		
		<!-- ■ 토너먼트 4강 참여 리스트를 불러오는 함수 -->
		function getTournamentWorkList2(){
			
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
		})
		
		
		
		
		<!-- ■ 토너먼트 8강 참여 리스트를 불러오는 함수 -->
		function getTournamentWorkList1(){
			
			$.getJSON("/tournament/toWork8", function(data){
				
				let str = "";
				console.log("▼ 8강 참여 리스트");
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
				
				$("#tournament8").html(str);
			});
			
		}
		
		
		getTournamentWorkList1();
		
		
		
		
		
		<!-- ■ 추천 버튼 클릭시 +1 되는 함수 -->
		$("#tournament8").on("click", "button", function(){
			
			let toworkNum = $(this).parent().attr("data-twno");
			console.log(toworkNum);
			
			
			$.ajax({
				type : 'patch',
				url : '/tournament/up/' + toworkNum,
				header : {"X-HTTP-Method-Override" : "PATCH"},
				data : JSON.stringify({towork_num:toworkNum}),
				dataType : 'text',
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("추천했습니다");
						getTournamentWorkList1();
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