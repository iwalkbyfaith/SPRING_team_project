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
	
	
<meta charset="UTF-8">
<!-- 네비바 적용2) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<!-- ■ jqueryCDN 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
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
			            <li class="nav-item">
			              	<a class="nav-link" href="#">About</a>
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
				            <a class="nav-link" href="/enroll/list">작가 신청 게시판</a>
			          </li>
			          <li class="nav-item">
				            <a class="nav-link" href="/tourna/list2">토너먼트</a>
			          </li>
		          </ul><!-- ul 태그 끝 -->
		          <div class="social-part">
		            <i class="fa fa-facebook" aria-hidden="true"></i>
		            <i class="fa fa-twitter" aria-hidden="true"></i>
		            <i class="fa fa-instagram" aria-hidden="true"></i>
		          </div>
	        </div><!-- div 끝 -->
	    </nav><!-- 네비바 끝 -->
     </div><!-- header 끝 (하단의 스크립트 태그까지 가져와야 함) --> 
          
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

	
	
	<!-- ■ div 모음 -->
	
		<!-- ● 모든 리스트 출력하는 테이블 -->
		<div id="divAllList">
			<h3 class="text-primary">모든 리스트 출력 #allList</h3>
			<table class="table">  <!-- style="display:none;"> --> 
		  		<thead class="table-dark">
					<tr>
						<th>enroll_num</th>
						<th>장르</th>
						<th>제목</th>
						<th>유저 아이디</th>
						<th>결과값</th>						
					</tr>
				</thead>
		  		<tbody id="allList">
		   			<!-- 리스트가 들어갈 위치 -->
		  		</tbody>
			</table>
		</div>
		
		<!-- ● 디테일 출력 -->
		<div id="detail">
			<h3>여기 #detail</h3>
			<div id="enroll_num"></div>
			<div id="novel_title"></div>
			<div id="novel_writer"></div>
			<div id="novel_category"></div>
			<div id="user_id"></div>
			<div id="enroll_intro"></div>
			<div id="enroll_result"></div>
			<div id="enroll_msg"></div>
		</div>

	<br/><br/><br/>
	<hr/>
	현재 로그인한 유저 정보 -> <sec:authentication property="principal.user"/>
	
	<script>
		
	//$(document).ready(function(){
		
					<!-- ■■■■■■■■■■■■■■■■■■■■■■■■ 스크립트 순서 ■■■■■■■■■■■■■■■■■■■■■■■■ -->
							<!-- ■ 변수 설정 -->
							<!-- ■ 전체 리스트 가져오기 -->
					<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		
		
		<!-- ■ 변수 설정 -->
		
		// ● 디테일 
		let enroll_num;
		
		
			
		<!-- ■ 전체 리스트 가져오기 -->
		$.getJSON("/enrollAjax/getAllList", function(data){
			
			console.log(data);
			
			// 테이블로 출력
			let str = "";
			
			$(data).each(function(){
				
				// 결과값(숫자)에 따른 의미
				let result = "";
				
				if(this.enroll_result == 0){
					result = "승인 대기";	
				}else if(this.enroll_result == 1){
					result = "승인 거부";	
				}else if(this.enroll_result == 2){
					result = "무료 소설";	
				}else if(this.enroll_result == 3){
					result = "유료 소설";	
				}
				
				str+= "<tr class='go_to_detail'>" 
						+ "<td class='list' data-enroll-num='"+this.enroll_num+"'data-enroll-result='"+this.enroll_result+"' data-user-id='"+this.user_id+ "'>" + this.enroll_num + "</td>"
						+ "<td>"+ this.novel_category +"</td>"
						+ "<td>" + 
							  //"<a href='/enrollAjax/getDetail/" + this.enroll_num + "'>" + this.novel_title + "</a>" +
							  this.novel_title +
						  "</td>"
						+ "<td>"+ this.user_id +"</td>"
						+ "<td>"+ result +"</td>" + 
					  "</tr>"
			});// end .each
			
			$("#allList").html(str);
			
			
		}); // end getJSON
		
		
		
		<!-- ■ 디테일 가져오기 -->
		
		$("#allList").on("click", (".go_to_detail"), function(){
			
			let tags ="";
			
			enroll_num = $(this).children().attr("data-enroll-num");
			console.log("제목클릭해서 얻은 넘버 -> " + enroll_num);
			
				$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
					console.log("getDatail() 진입 ");
					console.log(data);
					console.log(data.enroll_num);
				

//				tags = "<input type='text' value='" + data.enroll_num + "'/><br/>" + 
//					   "<input type='text' value='" + data.novel_writer + "'/><br/>" + 
//					   "<input type='text' value='" + data.novel_title + "'/><br/>" + 
//					   "<input type='text' value='" + data.novel_category + "'/><br/>" + 
//					   "<input type='text' value='" + data.user_id + "'/><br/>";
//			    $("#detail").html(tags);

			
				// 전체 리스트 숨기기   
				$("#divAllList").hide();
				
				// 디테일 넣기
				$("#enroll_num").html(data.enroll_num);
				$("#enroll_intro").html(data.enroll_intro);
				$("#enroll_result").html(data.enroll_result);
				$("#enroll_msg").html(data.enroll_msg);
				$("#novel_title").html(data.novel_title);
				$("#novel_writer").html(data.novel_writer);
				$("#novel_category").html(data.novel_category);
				$("#user_id").html(data.user_id);
				
					
				}); // end getJSON			
			
		}); // click all_list_novel_title
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
					
					
					
		
		
	//});// end $(document).ready
	
	</script>





</body>
</html>