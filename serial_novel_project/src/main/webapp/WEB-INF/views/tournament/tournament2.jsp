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
	
		#tournament, #tournament8 {
			margin: 0px -18px -16px;
		    column-gap: 60px;
		    padding-bottom: 16px;
		    grid-auto-columns: max-content;
		    display: grid;
		    grid-auto-flow: column;
		    flex-wrap: wrap;
		    max-width: 100vw;
		    overflow: scroll hidden;
		    border : solid 3px black;
		}
	
	</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<!-- ■ jqueryCDN 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- ■ 리스트가 추가될 공간 -->
 	<div class="row">
 		<h3 class="text-primary">전체 대회 리스트</h3>
		<div id="tournament"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	<div class="row">
 		<h3 class="text-primary">대회 참여 리스트</h3>
		<div id="tournament8"><!-- 리스트가 들어갈 위치 --></div>
	</div>
	
	
	<script>
		<!-- ■ 전체 리스트를 불러오는 함수 -->
		function getTournamentList(){
			
			$.getJSON("/tournament/all", function(data){
				
				let str = "";
				console.log(data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-list' data-tno='" + this.to_num + "'>" + this.to_name + "</div>"
						+ "<button type='button'>추천</button>";

				});
				
				$("#tournament").html(str);
			});
			
		}
		
		getTournamentList();
		
		
		
		<!-- ■ 토너먼트 참여 리스트를 불러오는 함수 -->
		function getTournamentWorkList(){
			
			$.getJSON("/tournament/toWork", function(data){
				
				let str = "";
				console.log(data);
				
				$(data).each(function(){
					
					str += "<div class='tourna-work-list' data-tno='" + this.to_num + "'>"
						+ this.to_name		 + "/"
						+ this.towork_num	 + "/"
						+ this.novel_title	 + "/"
						+ this.novel_writer	 + "/"
						+ this.towork_rec
						+ "</div>"
						+ "<button type='button'>추천</button>";

				});
				
				$("#tournament8").html(str);
			});
			
		}
		
		getTournamentWorkList();
		
		
		
		
		
		
		
		
	</script>
	
	
	
	


</body>
</html>