<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>

<!-- ▣ ajax에 스프링 시큐리티 csrf 토큰 적용하기 ( 검색 키워드 : ▣ )-->
<!-- ▣ 1. <head>태그 사이에 아래 <meta> 태그 두 줄 추가 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" />


<!-- ★ 부트스트랩 1. css 복붙 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<!-- ★ 부트스트랩 2. 번들 복붙 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<style>
#modDiv {
	width: 500px;
	height: 150px;
	background-color: whitesmoke;
	border: gray solid 1px;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -50px;
	margin-left: -250px;
	padding: 10px;
	z-index: 1000;
}
</style>

<meta charset="UTF-8">
<!-- 네비바 적용2) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>

	<!-- ■ jqueryCDN 추가 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- ■ 상단 네비바 : 네비바 적용3) -->
	<div class="header">
		<nav class="navbar navbar-expand-sm   navbar-light bg-light">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarTogglerDemo03"
				aria-controls="navbarTogglerDemo03" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item"><a class="nav-link" href="/">홈 <span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item dropdown dmenu"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> 소설 선택 </a>
						<div class="dropdown-menu sm-menu">
							<a class="dropdown-item" href="/free/novelList">무료소설</a> <a
								class="dropdown-item" href="/paid/novelList">유료소설</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="/enroll/list">작가
							신청 게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="/tourna/list2">토너먼트</a>
					</li>
				</ul>
				<!-- ul 태그 끝 -->
				<div class="social-part">
					<i class="fa fa-facebook" aria-hidden="true"></i> <i
						class="fa fa-twitter" aria-hidden="true"></i> <i
						class="fa fa-instagram" aria-hidden="true"></i>
				</div>
			</div>
			<!-- div 끝 -->
		</nav>
		<!-- 네비바 끝 -->
	</div>
	<!-- header 끝 (하단의 스크립트 태그까지 가져와야 함) -->

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

	<!-- ● 글쓰기 버튼 -->
	<button type="button" id="enrollBtn">작가 신청 '#enrollBtn'</button>


	<!-- ● 승인 대기(0) 출력하는 테이블 -->
	<div id="divResult0List">
		<h3 class="text-primary">승인대기 리스트 출력 #divResult0List</h3>
		<table class="table">
			<!-- style="display:none;"> -->
			<thead class="table-dark">
				<tr>
					<th>enroll_num</th>
					<th>장르</th>
					<th>제목</th>
					<th>유저 아이디</th>
					<th>결과값</th>
				</tr>
			</thead>
			<tbody id="0List">
				<!-- 리스트가 들어갈 위치 -->
			</tbody>
		</table>
	</div>

	<!-- ● 무료 승인(2) 출력하는 테이블 -->
	<div id="divResult2List">
		<h3 class="text-primary">무료 승인 리스트 출력 #divResult2List</h3>
		<table class="table">
			<!-- style="display:none;"> -->
			<thead class="table-dark">
				<tr>
					<th>enroll_num</th>
					<th>장르</th>
					<th>제목</th>
					<th>유저 아이디</th>
					<th>결과값</th>
				</tr>
			</thead>
			<tbody id="2List">
				<!-- 리스트가 들어갈 위치 -->
			</tbody>
		</table>
	</div>


	<!-- ● 모든 리스트 출력하는 테이블 -->
	<div id="divAllList">
		<h3 class="text-primary">모든 리스트 출력 #allList</h3>
		<table class="table">
			<!-- style="display:none;"> -->
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


	<!-- ● 승인 거부(1) 출력하는 테이블 -->
	<div id="divResult1List">
		<h3 class="text-primary">승인 거부 리스트 출력 #divResult1List</h3>
		<table class="table">
			<!-- style="display:none;"> -->
			<thead class="table-dark">
				<tr>
					<th>enroll_num</th>
					<th>장르</th>
					<th>제목</th>
					<th>유저 아이디</th>
					<th>결과값</th>
				</tr>
			</thead>
			<tbody id="1List">
				<!-- 리스트가 들어갈 위치 -->
			</tbody>
		</table>
	</div>


	<!-- ● 디테일 출력 -->
	<div class="row box-box-success" id="divDetail">
		<!-- id="detail"> test 하느라 잠깐 아래로 내림 -->
		<div class="box-header">
			<h3>여기 디테일 #detail</h3>
		</div>
		<!-- header 끝 -->
		<div>
			<button type="button" id="goAllList">리스트로 돌아가기 '#goAllList'</button>
		</div>
		<div class="box-body" id="detail">
			<!-- 디테일이 들어갈 자리 -->
		</div>
		<!-- body 끝 -->
		<div class="box-footer">
			<button type="button" id="updateForm" class="btn btn-warning">수정
				'#updateForm'</button>
			<button type="button" id="deleteForm" class="btn btn-danger">삭제
				'#deleteForm'</button>
			<button type="button" id="adminBtn" class="btn btn-dark">관리자
				버튼 '#adminBtn'</button>
		</div>
		<br /> <br /> <br /> <br />

		<!-- ※ 밑의 관리자 영역을 모달로 바꾸는 테스트 중 -->
		<div class="box-footer2">
			<div id="modDiv" style="display: none;">
				<div class="modal-title"></div>
				<div id="modBody">
					<input type="text" id="form_enroll_msg" class="form-control"
						placeholder="관리자 승인 메세지를 작성하세요" /> <select
						id="form_enroll_result" class="form-select"
						aria-label="Default select example">
						<option value="0">승인 대기</option>
						<option value="1">승인 거부</option>
						<option value="2">무료 승인</option>
						<option value="3">유료 승인</option>
					</select>
				</div>
				<br />
				<div id="modFooter">
					<button type="button" id="updateEnrollResult">선택하기</button>
					<button type="button" id="closeBtn">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<!-- ● 디테일 수정창 -->
	<div class="row box-box-success" id="divUpdateDetail">
		<!-- id="detail"> test 하느라 잠깐 아래로 내림 -->
		<div class="box-header">
			<h3>여기 디테일 수정하는 곳 #divUpdateDetail > .box-header</h3>
		</div>
		<!-- header 끝 -->
		<div>
			<button type="button" id="goAllList">리스트로 돌아가기 '#goAllList'</button>
		</div>
		<div class="box-body" id="updateDetail">
			여기는 디테일 바디인 #updateDetail => 디테일들 들어갈 자리
			<!-- 디테일이 들어갈 자리 -->
		</div>
		<!-- body 끝 -->
		<div class="box-footer">
			<button type="button" id="updateDetailBtn" class="btn btn-warning">수정완료
				'#updateDetailBtn'</button>
		</div>
	</div>


	<!-- ● 글쓰기 폼 출력 -->
	<div class="row box-box-success" id="enrollForm">
		<div class="box-header">
			<h3>여기 글쓰기 폼 #enrollForm</h3>
		</div>
		<!-- header 끝 -->
		<div class="box-body">
			<input type="text" id="insert_novel_title" placeholder="소설 제목" class="form-control" /> 
				<input type="text" id="insert_novel_writer"	placeholder="사용할 필명" class="form-control" /> 
			<select id="insert_novel_category" class="form-select" aria-label="Default select example">
				<option value="fantasy">판타지</option>
				<option value="romance">로맨스</option>
				<option value="wuxia">무협지</option>
				<option value="mystery">미스터리</option>
			</select> 
			<input type="text" id="insert_user_id" value="<sec:authentication property="principal.user.user_id"/>"
				class="form-control" readonly />
			<textarea id="insert_enroll_intro" style="width: 100%; height: 6.25em; resize: none;">시놉시스 및 예상 결말 입력</textarea>
		</div>
		<!-- body 끝 -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="enrollFormAddBtn">
				작성 완료 '#enrollFormAddBtn'</button>
		</div>
		<!-- footer 끝 -->
	</div>










	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ ▲ 위로 div 모음 ▲ ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->


	<br />
	<br />
	<br />
	<hr />
	현재 로그인한 유저 정보 ->
	<sec:authentication property="principal.user" />
	<hr />
	1. 작가신청 눌렀을때 이미 작성한 글(승인 대기중인) 있으면 안되게 하기 (현재 승인 대기중입니다 이런거 띄워도 될 듯) <br />
	2. 디테일 불러올 때, 관리자 영역 이미 실행했다면 비활성화(없애지는 말고)하기. 혹은 '이미 처리하셨습니다' 이런 메세지 띄우기? => result가 0일때만 고칠 수 있도록 <br />
	3. 자잘한 권한 설정해주기 (일반 유저들은 승인 대기만 확인할 수 있음 => 그래서 승인 대기만 수정할 수 있음)
	4. 첨부파일 넣기
	5. 폼 스타일 태그로 정리해주기
	

	<script>
		
	//$(document).ready(function(){
		
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 스크립트 순서 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<!-- ■ 변수 설정 -->
		<!-- ■ 페이지 첫 진입시 세팅할 함수 호출 -->
		
		<!-- ■ 전체 리스트 가져오기 -->
		<!-- ■ 승인 대기 리스트 가져오기 -->
		<!-- ■ 승인 거부 리스트 가져오기 -->
		<!-- ■ 무료 승인 리스트 가져오기 -->
		
		<!-- ■ 전체 리스트 디테일 가져오기 -->
		<!-- ■ 승인 대기 리스트 디테일 가져오기 -->	
		<!-- ■ 승인 거부 리스트 디테일 가져오기 -->	
		<!-- ■ 무료 승인 리스트 디테일 가져오기 -->					
		<!-- ■ 디테일에서 리스트로 돌아가는 버튼(#goAllList) 클릭 -->
		
		<!-- ■ 디테일 수정 폼으로 넘어가기 -->
		<!-- ■ 수정 완료 버튼 눌렀을 때 DB에 update 하기 -->
		<!-- ■ 삭제 버튼 눌렀을때 디테일 삭제하기 -->
		
		<!-- ■ 작가신청 버튼(#enrollBtn)을 눌러 글쓰기 폼으로 들어가기 -->
		<!-- ■ 글쓰기 폼에서 '작성완료'(#enrollFormAddBtn) 버튼을 눌러 데이터 전송하기 -->
		
		<!-- ■ 관리자 기능 모달 버튼으로 눌러서 나오게 만들기 -->
			<!-- ● 모달 열기 -->
			<!-- ● 모달 닫기 -->
			<!-- ● 모달에서 관리자가 enroll_result를 선택해 결과를 DB에 update & 무료승인(2)인 경우에는 novel_tbl에 insert 하기 하기 -->
	<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		
		
		<!-- ■ 변수 설정 -->
		
			// ● id 설정 예시
				// insert_user_id => 신청 폼에 입력
				// input_user_id  => 디테일에서 조회
				// update_user_id => 수정폼
		
			// ● 시큐리티
			let csrfHeaderName = "${_csrf.headerName}"
			let csrfTokenValue="${_csrf.token}"
			
			console.log("시큐리티 헤더-> " + csrfHeaderName);
			console.log("시큐리티 밸류-> " + csrfTokenValue);
			
			// ● sec 태그로 가져올 데이터들
			let id = "<sec:authentication property="principal.user.user_id"/>";
			console.log("sec 태그로 얻어온 아이디 -> " + id);
			
			// ● 디테일 
			let enroll_num;
			
		
		
		
		<!-- ■ 페이지 첫 진입시 세팅할 함수 호출 -->
		
			// ● 모든 리스트 보여주기
			getAllList();
			
			// ● 승인 대기(0) 리스트 보여주기
			get0List();
			
			// ● 승인 거부(1) 리스트 보여주기
			get1List();
			
			// ● 무료 승인(2) 리스트 보여주기
			get2List();
			
			// ● 디테일 페이지(#divDetail) 숨기기
			$("#divDetail").hide();
			
			// ● 글쓰기 폼 숨기기(#enrollForm)
			$("#enrollForm").hide();
			
			// ● 리스트로 돌아가는 버튼(#goAllList) 숨기기
			$("#goAllList").hide();
			
			// ●  디테일 수정창 숨기기
			$("#divUpdateDetail").hide();
		
			
		
		
		
		<!-- ■ 전체 리스트 가져오기 -->
		function getAllList(){
			
			$.getJSON("/enrollAjax/getAllList", function(data){
				
				console.log(data);
				
				// ● 테이블로 출력
				let str = "";
				
				$(data).each(function(){
					
					// ● 결과값(숫자)에 따른 의미
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
				});// end .eachs
				
				$("#allList").html(str);
				
				
			}); // end getJSON
			
		}// end getAllList()
		
		
		<!-- ■ 승인 대기 리스트 가져오기 -->
		function get0List(){
			
			$.getJSON("/enrollAjax/getList/0", function(data){
				
				console.log(data);
				
				// ● 테이블로 출력
				let str = "";
				
				$(data).each(function(){
					
					// ● 결과값(숫자)에 따른 의미
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
				});// end .eachs
				
				$("#0List").html(str);
				
				
			}); // end getJSON
			
		}// end get0List()
		
		
		<!-- ■ 승인 거부 리스트 가져오기 -->
		function get1List(){
			
			$.getJSON("/enrollAjax/getList/1", function(data){
				
				console.log(data);
				
				// ● 테이블로 출력
				let str = "";
				
				$(data).each(function(){
					
					// ● 결과값(숫자)에 따른 의미
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
				});// end .eachs
				
				$("#1List").html(str);
				
				
			}); // end getJSON
			
		}// end get1List()
		
		
		
		<!-- ■ 무료 승인 리스트 가져오기 -->
		function get2List(){
			
			$.getJSON("/enrollAjax/getList/2", function(data){
				
				console.log(data);
				
				// ● 테이블로 출력
				let str = "";
				
				$(data).each(function(){
					
					// ● 결과값(숫자)에 따른 의미
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
				});// end .eachs
				
				$("#2List").html(str);
				
				
			}); // end getJSON
			
		}// end get2List()
		
		
		
		
		
		
		<!-- ■ 전체 리스트 디테일 가져오기 -->
		
			$("#allList").on("click", (".go_to_detail"), function(){
				
				let tags ="";
				
				enroll_num = $(this).children().attr("data-enroll-num");
				console.log("제목클릭해서 얻은 넘버 -> " + enroll_num);
				
					$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
						console.log("디테일 페이지 진입 ");
						console.log(data);
						console.log(data.enroll_num);
	
						// ● 숨기기				
							// ＊ 전체 리스트 숨기기   
							$("#divAllList").hide();
	 
							// * 승인 대기 리스트 숨기기
							$("#divResult0List").hide();
							
							// * 승인 거부 리스트 숨기기
							$("#divResult1List").hide();
							
							// * 무료 승인 리스트 숨기기
							$("#divResult2List").hide();
							
							// * 작가신청 버튼 숨기기
							$("#enrollBtn").hide();
							
							// * 디테일 수정창 숨기기
							$("#divUpdateDetail").hide();
							
							
						
						// ● 보이기
							// * 디테일 보이기
							$("#divDetail").show();
						
							// * 전체 리스트로 가는 버튼 활성화
							$("#goAllList").show();
							
							
						// ● str 세팅
						let str = "";
						
						// ● 신청 결과값(정수)을 한글로
						let result = "";
					
							if(data.enroll_result == 0){
								result = "승인 대기";	
							}else if(data.enroll_result == 1){
								result = "승인 거부";	
							}else if(data.enroll_result == 2){
								result = "무료 소설";	
							}else if(data.enroll_result == 3){
								result = "유료 소설";	
							}
							
							console.log("관리자 메세지 ▼");
							console.log("메세지가 있다? " + data.enroll_msg != null);
							
					// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
						let msg;
						
							if(data.enroll_msg == null){
								msg = "";
							}else{
								msg = data.enroll_msg;
							}
						
						str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "' readonly />"
							+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "' readonly/>"
							+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "' readonly/>"
							+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "' readonly/>"
							+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "' readonly/>"
							+  "<textarea readonly id='input_enroll_intro' style='width: 100%; height: 6.25em; resize: none;' >" + data.enroll_intro + "</textarea>"
							+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "' readonly/>"
							+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "' readonly/>" ;
						
						
						$("#detail").html(str);
					
					
					}); // end getJSON			
				
			}); // click all_list
			
			
		
		<!-- ■ 승인 대기 리스트 디테일 가져오기 -->
			
			$("#0List").on("click", (".go_to_detail"), function(){
				
				let tags ="";
				
				enroll_num = $(this).children().attr("data-enroll-num");
				console.log("제목클릭해서 얻은 넘버 -> " + enroll_num);
				
					$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
						console.log("디테일 페이지 진입 ");
						console.log(data);
						console.log(data.enroll_num);
	
						// ● 숨기기				
							// ＊ 전체 리스트 숨기기   
							$("#divAllList").hide();
	 
							// * 승인 대기 리스트 숨기기
							$("#divResult0List").hide();
							
							// * 승인 거부 리스트 숨기기
							$("#divResult1List").hide();
							
							// * 무료 승인 리스트 숨기기
							$("#divResult2List").hide();
							
							// * 작가신청 버튼 숨기기
							$("#enrollBtn").hide();
							
							// * 디테일 수정창 숨기기
							$("#divUpdateDetail").hide();
							
							// * 관리자 메세지를 비워놔야하나?(일단 주석)
							//$("#input_enroll_msg").val("");
							
						
						// ● 보이기
							// * 디테일 보이기
							$("#divDetail").show();
						
							// * 전체 리스트로 가는 버튼 활성화
							$("#goAllList").show();
							
							
						// ● str 세팅
						let str = "";
						
						// ● 신청 결과값(정수)을 한글로
						let result = "";
					
							if(data.enroll_result == 0){
								result = "승인 대기";	
							}else if(data.enroll_result == 1){
								result = "승인 거부";	
							}else if(data.enroll_result == 2){
								result = "무료 소설";	
							}else if(data.enroll_result == 3){
								result = "유료 소설";	
							}
							
							console.log("관리자 메세지 ▼");
							console.log("메세지가 있다? " + data.enroll_msg != null);
							
					// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
						let msg;
						
							if(data.enroll_msg == null){
								msg = "";
							}else{
								msg = data.enroll_msg;
							}
						
						str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "' readonly/>"
							+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "' readonly/>"
							+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "' readonly/>"
							+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "' readonly/>"
							+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "' readonly/>"
							+  "<textarea id='input_enroll_intro' readonly style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
							+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "' readonly/>"
							+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "' readonly/>" ;
						
						
						$("#detail").html(str);
					
					
					}); // end getJSON			
				
			}); // click 0_list
			
			

		<!-- ■ 승인 거부 리스트 디테일 가져오기 -->
			
			$("#1List").on("click", (".go_to_detail"), function(){
				
				let tags ="";
				
				enroll_num = $(this).children().attr("data-enroll-num");
				console.log("제목클릭해서 얻은 넘버 -> " + enroll_num);
				
					$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
						console.log("디테일 페이지 진입 ");
						console.log(data);
						console.log(data.enroll_num);
	
						// ● 숨기기				
							// ＊ 전체 리스트 숨기기   
							$("#divAllList").hide();
	 
							// * 승인 대기 리스트 숨기기
							$("#divResult0List").hide();
							
							// * 승인 거부 리스트 숨기기
							$("#divResult1List").hide();
							
							// * 무료 승인 리스트 숨기기
							$("#divResult2List").hide();
							
							// * 작가신청 버튼 숨기기
							$("#enrollBtn").hide();
							
							// * 디테일 수정창 숨기기
							$("#divUpdateDetail").hide();
							
							// * 관리자 메세지를 비워놔야하나?(일단 주석)
							//$("#input_enroll_msg").val("");
							
						
						// ● 보이기
							// * 디테일 보이기
							$("#divDetail").show();
						
							// * 전체 리스트로 가는 버튼 활성화
							$("#goAllList").show();
							
							
						// ● str 세팅
						let str = "";
						
						// ● 신청 결과값(정수)을 한글로
						let result = "";
					
							if(data.enroll_result == 0){
								result = "승인 대기";	
							}else if(data.enroll_result == 1){
								result = "승인 거부";	
							}else if(data.enroll_result == 2){
								result = "무료 소설";	
							}else if(data.enroll_result == 3){
								result = "유료 소설";	
							}
							
							console.log("관리자 메세지 ▼");
							console.log("메세지가 있다? " + data.enroll_msg != null);
							
					// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
						let msg;
						
							if(data.enroll_msg == null){
								msg = "";
							}else{
								msg = data.enroll_msg;
							}
						
						str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "' readonly/>"
							+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "' readonly/>"
							+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "' readonly/>"
							+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "' readonly/>"
							+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "' readonly/>"
							+  "<textarea id='input_enroll_intro' readonly style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
							+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "' readonly/>"
							+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "' readonly/>" ;
						
						
						$("#detail").html(str);
					
					
					}); // end getJSON			
				
			}); // click 1_list
			
			
			
		<!-- ■ 무료 승인 리스트 디테일 가져오기 -->
			
			$("#2List").on("click", (".go_to_detail"), function(){
				
				let tags ="";
				
				enroll_num = $(this).children().attr("data-enroll-num");
				console.log("제목클릭해서 얻은 넘버 -> " + enroll_num);
				
					$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
						console.log("디테일 페이지 진입 ");
						console.log(data);
						console.log(data.enroll_num);
	
						// ● 숨기기				
							// ＊ 전체 리스트 숨기기   
							$("#divAllList").hide();
	 
							// * 승인 대기 리스트 숨기기
							$("#divResult0List").hide();
							
							// * 승인 거부 리스트 숨기기
							$("#divResult1List").hide();
							
							// * 무료 승인 리스트 숨기기
							$("#divResult2List").hide();
							
							// * 작가신청 버튼 숨기기
							$("#enrollBtn").hide();
							
							// * 디테일 수정창 숨기기
							$("#divUpdateDetail").hide();
							
							// * 관리자 메세지를 비워놔야하나?(일단 주석)
							//$("#input_enroll_msg").val("");
							
						
						// ● 보이기
							// * 디테일 보이기
							$("#divDetail").show();
						
							// * 전체 리스트로 가는 버튼 활성화
							$("#goAllList").show();
							
							
						// ● str 세팅
						let str = "";
						
						// ● 신청 결과값(정수)을 한글로
						let result = "";
					
							if(data.enroll_result == 0){
								result = "승인 대기";	
							}else if(data.enroll_result == 1){
								result = "승인 거부";	
							}else if(data.enroll_result == 2){
								result = "무료 소설";	
							}else if(data.enroll_result == 3){
								result = "유료 소설";	
							}
							
							console.log("관리자 메세지 ▼");
							console.log("메세지가 있다? " + data.enroll_msg != null);
							
					// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
						let msg;
						
							if(data.enroll_msg == null){
								msg = "";
							}else{
								msg = data.enroll_msg;
							}
						
						str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "' readonly/>"
							+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "' readonly/>"
							+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "' readonly/>"
							+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "' readonly/>"
							+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "'/>"
							+  "<textarea id='input_enroll_intro' readonly style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
							+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "' readonly/>"
							+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "' readonly/>" ;
						
						
						$("#detail").html(str);
					
					
					}); // end getJSON			
				
			}); // click 2_list
		
			
			
		
		<!-- ■ 디테일에서 리스트로 돌아가는 버튼(#goAllList) 클릭 -->
			$("#goAllList").on("click", function(){
				
				// ● 숨기기
					// * 디테일 숨기기
					$("#divDetail").hide();
				
					// * 글쓰기 폼은 없어야함.
					$("#enrollForm").hide();
					
					// * 디테일 수정창 숨기기
					$("#divUpdateDetail").hide();
				
				
				
				// ● 보이기
				
					// * 모든 리스트 보이기
					getAllList();
					$("#divAllList").show();
	
					// * 승인 대기 리스트 보이기
					get0List();
					$("#divResult0List").show();
					
					// * 승인 거부 리스트 보이기
					get1List();
					$("#divResult1List").show();
					
					// * 무료 승인 리스트 보이기
					get2List();
					$("#divResult2List").show();
					
					// * 작가 신청 버튼은 보여야함
					$("#enrollBtn").show();
				
				
				// ● 전체 리스트 보여주기
					// ※ 버튼을 눌렀을때 생긴 리스트를 클릭하면 아무것도 안뜨는 문제를 방지하기 위해 getJSON을 사용해 또 넣어줌
				$.getJSON("/enrollAjax/getAllList", function(data){
					
					console.log(data);
					
					// ● 테이블로 출력
					let str = "";
					
					$(data).each(function(){
						
						// ● 결과값(숫자)에 따른 의미
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
					});// end .eachs
					
					$("#allList").html(str);
					
					
				}); // end getJSON
				
				
				
			}); // end #goAllList
			
			
			
		<!-- ■ 디테일 수정 폼으로 넘어가기 -->
		$("#updateForm").on("click", function(){
			
			console.log("수정#updateForm 버튼 클릭했음");
			//console.log($(this).parent().siblings("#detail").children("#input_enroll_num").val());
			
			enroll_num = $(this).parent().siblings("#detail").children("#input_enroll_num").val();
			console.log("수정 버튼을 클릭해서 얻은 넘버 -> " + enroll_num);
			
			
			$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
				console.log("디테일 페이지 진입 ");
				console.log(data);
				console.log(data.enroll_num);

				// ● 숨기기									
					// * 디테일 #divDetail 가리기
					$("#divDetail").hide();
					
				// ● 보이기
					// * 전체 리스트로 가는 버튼 활성화
					$("#goAllList").show();
				
					// * 디테일 수정 #divUpdateDetail 보이기
					$("#divUpdateDetail").show();
									
					
				// ● str 세팅
				let str = "";
				
				// ● 신청 결과값(정수)을 한글로
				let result = "";
			
					if(data.enroll_result == 0){
						result = "승인 대기";	
					}else if(data.enroll_result == 1){
						result = "승인 거부";	
					}else if(data.enroll_result == 2){
						result = "무료 소설";	
					}else if(data.enroll_result == 3){
						result = "유료 소설";	
					}
					
					console.log("관리자 메세지 ▼");
					console.log("메세지가 있다? " + data.enroll_msg != null);
					
			// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
				let msg;
				
					if(data.enroll_msg == null){
						msg = "";
					}else{
						msg = data.enroll_msg;
					}
				
				str += "<input type='text' id='update_enroll_num' class='form-control' value='" + data.enroll_num + "' readonly />"
					+  "<input type='text' id='update_novel_title' class='form-control' value='" + data.novel_title + "'/>"
					+  "<input type='text' id='update_novel_writer' class='form-control' value='" + data.novel_writer + "'/>"
					+  "<select id='update_novel_category' class='form-select' aria-label='Default select example'>"
						+ "<option value='fantasy'>판타지</option>"
						+ "<option value='romance'>로맨스</option>"
						+ "<option value='wuxia'>무협지</option>"
						+ "<option value='mystery'>미스터리</option>"
				    + "</select>" 
					+  "<input type='text' id='update_user_id' class='form-control' value='" + id + "' readonly />"
					+  "<textarea id='update_enroll_intro' style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
					;

				$("#updateDetail").html(str);
			
			}); // end getJSON
			
			
		});//end click #updateForm
		
		
		<!-- ■ 수정 완료 버튼 눌렀을 때 DB에 update 하기 -->
		$("#updateDetailBtn").on("click", function(){
			
			console.log("수정완료 버튼 #updateDetailBtn 클릭했음");
			
			// 변수 받아서
			// 수정하고
			// 수정이 완료되면 디테일 페이지로
			
			// ● 변수 받기			
			let enroll_num = $(this).parent().siblings("#updateDetail").children("#update_enroll_num").val();
			let novel_title= $(this).parent().siblings("#updateDetail").children("#update_novel_title").val();
			let novel_writer= $(this).parent().siblings("#updateDetail").children("#update_novel_writer").val();
			let novel_category= $(this).parent().siblings("#updateDetail").children("#update_novel_category").val();
			let user_id= $(this).parent().siblings("#updateDetail").children("#update_user_id").val();
			let enroll_intro= $(this).parent().siblings("#updateDetail").children("#update_enroll_intro").val();
			
				// 디버깅
				console.log("수정완료 버튼으로 받은 enroll_num -> " + enroll_num);
				console.log("수정완료 버튼으로 받은 novel_title -> " + novel_title);
				console.log("수정완료 버튼으로 받은 novel_writer -> " + novel_writer);
				console.log("수정완료 버튼으로 받은 novel_category -> " + novel_category);
				console.log("수정완료 버튼으로 받은 user_id -> " + user_id);
				console.log("수정완료 버튼으로 받은 enroll_intro -> " + enroll_intro);
				
			// ● 수정하기
			
				// 버튼 클릭시 경고창 띄움 (-> 확인을 눌러야 진입)
				if(confirm("정말 수정하시겠습니까?")){
				
					// ● 업데이트 로직 실행
					$.ajax({
						
						type : 'put',
						url : '/enrollAjax/updateEnrollForm',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PUT"
						},
						beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						contentType : "application/json",
						data : JSON.stringify({
							enroll_intro : enroll_intro,
							enroll_num : enroll_num,
							novel_title : novel_title,
							novel_writer : novel_writer,
							novel_category : novel_category,
							user_id : user_id
						}),
						dataType : 'text',
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("수정이 완료되었습니다.");									
								
								// ● 성공시 디테일 페이지 다시 불러와야함(변경점 반영해야하니까)
								
									$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
										console.log("디테일 페이지 진입 ");
										console.log(data);
										console.log(data.enroll_num);
					
										
										// ● str 세팅
										let str = "";
										
										// ● 신청 결과값(정수)을 한글로
										let result = "";
									
											if(data.enroll_result == 0){
												result = "승인 대기";	
											}else if(data.enroll_result == 1){
												result = "승인 거부";	
											}else if(data.enroll_result == 2){
												result = "무료 승인";	
											}else if(data.enroll_result == 3){
												result = "유료 승인";	
											}
											
											console.log("관리자 메세지 ▼");
											console.log("메세지가 있다? " + data.enroll_msg != null);
											
										// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
											let msg;
											
												if(data.enroll_msg == null){
													msg = "";
												}else{
													msg = data.enroll_msg;
												}
											
											str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "'/>"
												+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "'/>"
												+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "'/>"
												+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "'/>"
												+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "'/>"
												+  "<textarea id='input_enroll_intro' style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
												+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "'/>"
												+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "'/>" ;
											
											
											$("#detail").html(str);
									
									
									}); // end getJSON	
									
									// ● 숨기기
										// * 업데이트 폼 숨기기
										$("#divUpdateDetail")
									
									// ● 보이기
										// * 디테일 보이기
										$("#divDetail").show();
									
									
							} // end ajax if	
							
						} // end success	
						
					}); // end ajax
			
				}// end confirm if	
			
		});// end click #updateDetailBtn
		
		
		
		<!-- ■ 삭제 버튼 눌렀을때 디테일 삭제하기 -->
		$("#deleteForm").on("click", function(){
			
			console.log("#deleteForm 클릭했음");
			
			// ● 변수 받기
			let enroll_num = $(this).parent().siblings("#detail").children("#input_enroll_num").val();
			console.log("#deleteForm을 클릭해서 들어온 enroll_num -> " + enroll_num);
			
			// ● 삭제로직 실행
			if(confirm("정말 삭제하시겠습니까?")){
				$.ajax({
					
					type : 'delete',
					url : '/enrollAjax/deleteEnrollForm/' + enroll_num,
					beforeSend : function(xhr){
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
					header : {
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success : function(result) {
						if(result == 'SUCCESS'){
							alert("삭제가 완료되었습니다.");
							
							// ● 숨기기
								// * 디테일 페이지 숨기기
								$("#divDetail").hide();
							
							// ● 보이기
								// * 전체 리스트 보이기
								getAllList();
								$("#divAllList").show();
					
								// * 승인 대기 리스트 보이기
								get0List();
								$("#divResult0List").show();
								
								// * 승인 거부 리스트 보이기
								get1List();
								$("#divResult1List").show();
								
								// * 무료 승인 리스트 보이기
								get2List();
								$("#divResult2List").show();
								
								// * 작가신청 버튼 보이기
								$("#enrollBtn").show();
							
							
						}//end if	
						
					}// end success
					
				});//end ajax
			
			}// end confirm if
			
		});// on click #deleteForm
		
		
		
		
		
		
		
		<!-- ■ 작가신청 버튼(#enrollBtn)을 눌러 글쓰기 폼으로 들어가기 -->
		$("#enrollBtn").on("click", function(){
			
			// ● 보이기
				// * 디테일 폼
				$("#enrollForm").show();

			
			// ● 숨기기				
				// ＊ 전체 리스트 숨기기   
				$("#divAllList").hide();
	
				// * 승인 대기 리스트 숨기기
				$("#divResult0List").hide();
				
				// * 승인 거부 리스트 숨기기
				$("#divResult1List").hide();
				
				// * 무료 승인 리스트 숨기기
				$("#divResult2List").hide();
				
				// * 작가신청 버튼 숨기기
				$("#enrollBtn").hide();
								
				// * 작가신청 버튼도 가림
				$("#enrollBtn").hide();
				
				// * 디테일 수정창 숨기기
				$("#divUpdateDetail").hide();
				
		});// end click #enrollBtn
		
		
		
		<!-- ■ 글쓰기 폼에서 '작성완료'(#enrollFormAddBtn) 버튼을 눌러 데이터 전송하기 -->
		$("#enrollFormAddBtn").on("click", function(){
			
			console.log("#enrollFormAddBtn 버튼 눌렀음");
			
			// ● 설명
			//	=> #enrollFormAddBtn의 부모(.box-footer)의 형제(.box-body)의 자식(#novel_title)의 안의 값(val())을 가져옴
			//console.log($(this).parent().siblings(".box-body").children("#novel_title").val());
			
			// ● 폼에 입력한 데이터 받아오기 
			let novel_title = $(this).parent().siblings(".box-body").children("#insert_novel_title").val();
			let novel_writer = $(this).parent().siblings(".box-body").children("#insert_novel_writer").val();
			let novel_category = $(this).parent().siblings(".box-body").children("#insert_novel_category").val();
			let user_id = $(this).parent().siblings(".box-body").children("#insert_user_id").val();
			let enroll_intro = $(this).parent().siblings(".box-body").children("#insert_enroll_intro").val();
			
			// ● 디버깅
			console.log(novel_title);
			console.log(novel_writer);
			console.log(novel_category);
			console.log(user_id);
			console.log(enroll_intro);
			
			
			// ● DB에 적재하기
			$.ajax({
				type : 'post',
				url : '/enrollAjax/insertEnrollForm',
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				beforeSend : function(xhr) {
					 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				 },
				dataType : 'text',
				contentType : 'application/json',
				data : JSON.stringify({ 
					novel_title : novel_title,
					novel_writer : novel_writer,
					novel_category : novel_category,
					user_id : user_id,
					enroll_intro : enroll_intro					
				}),
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("데이터를 DB에 넣기 성공");						
						
						// ● 숨기기
							// * 디테일 폼
							$("#enrollForm").hide();

					
						// ● 보이기				
							// ＊ 전체 리스트 보이기
							getAllList();
							$("#divAllList").show();
				
							// * 승인 대기 리스트 보이기
							get0List();
							$("#divResult0List").show();
							
							// * 승인 거부 리스트 보이기
							get1List();
							$("#divResult1List").show();
							
							// * 무료 승인 리스트 보이기
							get2List();
							$("#divResult2List").show();
							
							// * 작가신청 버튼 보이기
							$("#enrollBtn").show();
											
							
						
					}// end if
				}// end success					
			})// end ajax
		}); // end click #enrollFormAddBtn
		
		
		
		
		<!-- ■ 관리자 기능 모달 버튼으로 눌러서 나오게 만들기 -->
		
			<!-- ● 모달 열기 -->
			$("#adminBtn").on("click", function(){
				
				// 모달 열기
				$("#modDiv").show("slow");
					
			})// end click #adminBtn
			
			<!-- ● 모달 닫기 -->
			$("#closeBtn").on("click", function(){
				
				$("#modDiv").hide("slow");
				
			})// end click #closeBtn
			
			
			
			<!-- ● 모달에서 관리자가 enroll_result를 선택해 결과를 DB에 update & 무료승인(2)인 경우에는 novel_tbl에 insert 하기 하기 -->
			
			$("#updateEnrollResult").on("click", function(){
				console.log("#updateEnrollResult 버튼 클릭");
				
				// ● 관리자 승인 메세지 가져오기
					// console.log($(this).parent().siblings("#modBody").children("#form_enroll_msg").val());
					let enroll_msg = $(this).parent().siblings("#modBody").children("#form_enroll_msg").val();
					console.log("관리자 '선택' 승인 메세지 -> " + enroll_msg);
				
				
				// ● 결과값(0,1,2,3) 얻어오기
					//console.log($(this).parent().siblings("#modBody").children("#form_enroll_result").val());
					let enroll_result = $(this).parent().siblings("#modBody").children("#form_enroll_result").val();
					console.log("관리자 '선택' 결과 번호 -> " + enroll_result);
				

				
				// ● update 할 enroll_num 얻어오기
					//console.log($(this).parent().parent().parent().siblings("#detail").children("#input_enroll_num").val());
					let enroll_num =$(this).parent().parent().parent().siblings("#detail").children("#input_enroll_num").val();
					console.log("관리자 '선택' 버튼 클릭시 들어온 enroll_num -> " + enroll_num);
				
				// ● insert 할 변수들 받아오기
					let novel_title = $(this).parent().parent().parent().siblings("#detail").children("#input_novel_title").val();
					let novel_writer = $(this).parent().parent().parent().siblings("#detail").children("#input_novel_writer").val();
					let novel_category = $(this).parent().parent().parent().siblings("#detail").children("#input_novel_category").val();
					let user_id = $(this).parent().parent().parent().siblings("#detail").children("#input_user_id").val();
				
					console.log("◈ 소설 제목 -> " + novel_title);
					console.log("◈ 소설 필명 -> " + novel_writer);
					console.log("◈ 소설 카테고리 -> " + novel_category);
					console.log("◈ 유저 아이디 -> " + user_id);
					
					// 버튼 클릭시 경고창 띄움 (-> 확인을 눌러야 진입)
					if(confirm("승인처리는 한 번만 할 수 있습니다.")){
					
						// ● 업데이트 로직 실행
						$.ajax({
							
							type : 'put',
							url : '/enrollAjax/updateEnrollResult',
							header : {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "PUT"
							},
							beforeSend : function(xhr){
								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							},
							contentType : "application/json",
							data : JSON.stringify({
								enroll_msg : enroll_msg,
								enroll_result : enroll_result,
								enroll_num : enroll_num,
								
								// 밑에 들어오나 테스트(컨트롤러에서)
								novel_title : novel_title,
								novel_writer : novel_writer,
								novel_category : novel_category,
								user_id : user_id

							}),
							dataType : 'text',
							success : function(result){
								console.log("result: " + result);
								if(result == 'SUCCESS'){
									alert("관리자의 결과가 반영되었습니다");
			
									// ● 성공시 관리자 메세지 비우고
									$("#form_enroll_msg").val("");
									//$("#form_enroll_msg").attr("readonly",true);	
									//$("#form_enroll_result").attr("readonly",true);	
										// 다시 불러올때 똑같이 만들어야하고 적용된 애들만 되게 해야함.
										
									
									// ● 성공시 디테일 페이지 다시 불러와야함(변경점 반영해야하니까)
									
										$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
											console.log("디테일 페이지 진입 ");
											console.log(data);
											console.log(data.enroll_num);
						
											
											// ● str 세팅
											let str = "";
											
											// ● 신청 결과값(정수)을 한글로
											let result = "";
										
												if(data.enroll_result == 0){
													result = "승인 대기";	
												}else if(data.enroll_result == 1){
													result = "승인 거부";	
												}else if(data.enroll_result == 2){
													result = "무료 승인";	
												}else if(data.enroll_result == 3){
													result = "유료 승인";	
												}
												
												console.log("관리자 메세지 ▼");
												console.log("메세지가 있다? " + data.enroll_msg != null);
												
											// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
												let msg;
												
													if(data.enroll_msg == null){
														msg = "";
													}else{
														msg = data.enroll_msg;
													}
												
												str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "'/>"
													+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "'/>"
													+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "'/>"
													+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "'/>"
													+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "'/>"
													+  "<textarea id='input_enroll_intro' style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
													+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "'/>"
													+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "'/>" ;
												
												
												$("#detail").html(str);
										
										
										}); // end getJSON			
									
								} // end ajax if	
								
							} // end success	
							
						}); // end ajax
				
					// end confirm if	
					}else{
						
						$("#form_enroll_msg").val("");
					} // end confirm else					
		
		
			});// end click #updateEnrollResult
			
			
			
			
			
			
			
			
			
			
			<%-- 
			<!-- ■ 디테일 폼에서 관리자가 enroll_result를 선택해 DB에 update 하기 -->
			
			$("#updateEnrollResult").on("click", function(){
				console.log("#updateEnrollResult 버튼 클릭");
				
				// ● 관리자 승인 메세지 가져오기
					let enroll_msg = $(this).siblings("#form_enroll_msg").val();
					console.log("관리자 '선택' 승인 메세지 -> " + enroll_msg);
				
				
				// ● 결과값(0,1,2,3) 얻어오기
					//console.log($(this).siblings(".enroll_result").val());
					let enroll_result = $(this).siblings("#form_enroll_result").val();
					console.log("관리자 '선택' 결과 번호 -> " + enroll_result);
				

				
				// ● update 할 enroll_num 얻어오기
					//console.log($(this).parent().siblings("#detail").children("#enroll_num").val());
					let enroll_num = $(this).parent().siblings("#detail").children("#input_enroll_num").val();
					console.log("관리자 '선택' 버튼 클릭시 들어온 enroll_num -> " + enroll_num);
				
				// ● insert 할 변수들 받아오기
					let novel_title = $(this).parent().siblings("#detail").children("#input_novel_title").val();
					let novel_writer = $(this).parent().siblings("#detail").children("#input_novel_writer").val();
					let novel_category = $(this).parent().siblings("#detail").children("#input_novel_category").val();
					let user_id = $(this).parent().siblings("#detail").children("#input_user_id").val();
				
					console.log("◈ 소설 제목 -> " + novel_title);
					console.log("◈ 소설 필명 -> " + novel_writer);
					console.log("◈ 소설 카테고리 -> " + novel_category);
					console.log("◈ 유저 아이디 -> " + user_id);
				
				
				// 버튼 클릭시 경고창 띄움 (-> 확인을 눌러야 진입)
				if(confirm("승인처리는 한 번만 할 수 있습니다.")){
				
					// ● 업데이트 로직 실행
					$.ajax({
						
						type : 'put',
						url : '/enrollAjax/updateEnrollResult',
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PUT"
						},
						beforeSend : function(xhr){
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						contentType : "application/json",
						data : JSON.stringify({
							enroll_msg : enroll_msg,
							enroll_result : enroll_result,
							enroll_num : enroll_num,
							
							// 밑에 들어오나 테스트(컨트롤러에서)
							novel_title : novel_title,
							novel_writer : novel_writer,
							novel_category : novel_category,
							user_id : user_id

						}),
						dataType : 'text',
						success : function(result){
							console.log("result: " + result);
							if(result == 'SUCCESS'){
								alert("관리자의 결과가 반영되었습니다");
		
								// ● 성공시 관리자 메세지 비우고
								$("#form_enroll_msg").val("");
								//$("#form_enroll_msg").attr("readonly",true);	
								//$("#form_enroll_result").attr("readonly",true);	
									// 다시 불러올때 똑같이 만들어야하고 적용된 애들만 되게 해야함.
									
								
								// ● 성공시 디테일 페이지 다시 불러와야함(변경점 반영해야하니까)
								
									$.getJSON("/enrollAjax/getDetail/" + enroll_num, function(data){
										console.log("디테일 페이지 진입 ");
										console.log(data);
										console.log(data.enroll_num);
					
										
										// ● str 세팅
										let str = "";
										
										// ● 신청 결과값(정수)을 한글로
										let result = "";
									
											if(data.enroll_result == 0){
												result = "승인 대기";	
											}else if(data.enroll_result == 1){
												result = "승인 거부";	
											}else if(data.enroll_result == 2){
												result = "무료 승인";	
											}else if(data.enroll_result == 3){
												result = "유료 승인";	
											}
											
											console.log("관리자 메세지 ▼");
											console.log("메세지가 있다? " + data.enroll_msg != null);
											
										// ● 관리자 메세지가 없으면 ""를 넣고(이렇게 처리 안하면 null값을 출력함), 아니면 그대로 출력
											let msg;
											
												if(data.enroll_msg == null){
													msg = "";
												}else{
													msg = data.enroll_msg;
												}
											
											str += "<input type='text' id='input_enroll_num' class='form-control' value='" + data.enroll_num + "'/>"
												+  "<input type='text' id='input_novel_title' class='form-control' value='" + data.novel_title + "'/>"
												+  "<input type='text' id='input_novel_writer' class='form-control' value='" + data.novel_writer + "'/>"
												+  "<input type='text' id='input_novel_category' class='form-control' value='" + data.novel_category + "'/>"
												+  "<input type='text' id='input_user_id' class='form-control' value='" + id + "'/>"
												+  "<textarea id='input_enroll_intro' style='width: 100%; height: 6.25em; resize: none;'>" + data.enroll_intro + "</textarea>"
												+  "<input type='text' id='input_enroll_result' class='form-control' value='" + result + "'/>"
												+  "<input type='text'id='input_enroll_msg' class='form-control' value='" + msg + "'/>" ;
											
											
											$("#detail").html(str);
									
									
									}); // end getJSON			
								
							} // end ajax if	
							
						} // end success	
						
					}); // end ajax
			
				// end confirm if	
				}else{
					
					$("#form_enroll_msg").val("");
				} // end confirm else
				
			}); // end click updateEnrollResult
			
			// 여기까지 관리자 영역
			--%>
		
		
		
		
		
		
		
		
					
					
					
		
		
	//});// end $(document).ready
	
	</script>





</body>
</html>