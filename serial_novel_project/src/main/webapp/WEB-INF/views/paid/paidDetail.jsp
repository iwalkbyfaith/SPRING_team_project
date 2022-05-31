<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    

<html lang="kor">
<head>
<style>
	.social-part .fa{
    padding-right:20px;
}
ul li a{
    margin-right: 20px;
}
.header{
	height:100px;
}
.container{
	height:1000px;
}
.footer{
	height:150px;
}

#modDiv{
 		width : 300px;
	 	height : 100px;
	 	background-color: lightgray;
    	color: lightgray;
	 	position : absolute;
	 	top : 50%;
	 	left : 50%;
	 	margin-top : -50px;	/*height의 절반(음수) 중앙위치*/
	 	margin-left : -150px; /*width의 절반(음수) 중앙위치*/
	 	padding : 10px;
	 	z-index : 1000; /*무조건 1보다 클것*/
}

img {
	
	width:163px;
	margin-left: 24px;
	padding:0;
}

.imgTh{
	width: 230px;
	
}

table {
	font-size: 20px;
}

/*메뉴바*/
.menubar li ul {
	list-style:none;
	background: yellowgreen;
	display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
	height:auto;
	padding:0px;
	margin:0px;
	border:0px;
	position:absolute;
	width:200px;
	z-index:200;
}
.menubar li:hover ul {
	display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}		

h2 {
		font-style: italic;

	}		
</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
<title>유료 소설 게시판</title>
</head>
<body>

	
	<div class="header">
	<sec:authentication property="principal.user" var="user"/>
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
			              	<a class="nav-link" href="http://localhost:8181/charge/${user.user_num }">결제</a>
		               </li>
		          </ul><!-- ul 태그 끝 -->
				<div class="menubar">
					<ul> 	
						<li style="list-style:none;"><a href="#" id="current">내정보</a>
							<ul>
								<li><a href="/mypage/myInfo">계정정보</a></li>
								<li><a href="/mypage/myFavor">선호작</a></li>
								<li><a href="/mypage/bookmark">책갈피</a></li>
								<li><a href="/useList/${user.user_num }">구매내역</a></li>
								<li><a href="/customLogout">로그아웃</a></li>
							</ul>
						</li>
					</ul>
				</div><!-- menuar 끝 -->
	        </div><!-- div 끝 -->
	    </nav><!-- 네비바 끝 -->
	</div>
	<div class="container">
	
		<h2 class="text text-info">${novel.novel_title }</h2>
		
			<table class="table caption-top table-sm">
			  <tbody>
			    <tr>
			    	<th class="imgTh" rowspan="5"><img src='/resources/novel_image/${novel.novel_num}.png' ></th>
			      <th scope="row">회차제목</th>
			      	<td>${novel.paid_title }</td>
			      <th scope="row">작가</th>
			      	<td>${novel.novel_writer }</td>
			    </tr>
			    <tr>
			      <th scope="row">게시일</th>
			      	<td>${novel.paid_rdate }</td>
			      <th scope="row">가격</th>
			      <td>${novel.paid_price } coin</td>
			    </tr>
			  	
			  </tbody>
			</table>
			
			
		<div class="row">
			<div class="col-md-1">
				<a href="/paid/List/${novel.novel_num }" class="btn-sm"><button class="btn btn-outline-secondary">목록</button></a>
			</div>
		<!-- 유료소설추천테이블과 로그인유저의 번호 비교 추천버튼 없애기-->
		<c:if test="${rec.user_num ne user.user_num}">
			<div class="col-md-1">
				<button id="recBtn" class="btn btn-outline-secondary">추천</button>
			</div>
		</c:if>
		<!-- 유료소설결제테이블과 로그인유저의 번호 비교 결제버튼 없애기-->
		<c:if test="${use.user_num ne user.user_num}">
			<div class="col-md-1">
				<button id="chargeBtn" class="btn btn-outline-secondary">결제</button>
			</div>
		</c:if>
			<div class="col-md-1">
				<c:if test="${user.user_id eq novel.user_id}">
					<form action="/paid/updateS" method="POST">
						<input type="hidden" name="paid_num" value="${novel.paid_num}">
						<input type="hidden" name="novel_num" value="${novel.novel_num}">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="submit" value="수정" class="btn btn-outline-danger">
					</form>
				</c:if>
			</div>
			<div class="col-md-1">
				<c:if test="${user.user_id eq novel.user_id}">
					<form action="/paid/DeleteS" method="POST">
						<input type="hidden" name="paid_snum" value="${novel.paid_snum}">
						<input type="hidden" name="novel_num" value="${novel.novel_num}">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="submit" value="삭제" class="btn btn-outline-danger">
					</form>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="container2">
		<!-- 결제 내역이 없으면 본문은 보이지 않음 -->
		<c:if test="${use.user_num eq user.user_num }">
			<!-- 본문내용공간 -->
			<ul id="Pcon">
			
			</ul>
		</c:if>
			
			
			
	<div>
		<div class="box-header">
			<h2 class="text text-secondary">댓글</h2>
		</div><!-- header -->
		<div class="box-body">
			<strong>Writer : </strong>
			<input type="text" id="newReplyWriter" value="${user.user_id }" class="from-control" readonly>
			<strong>ReplyText : </strong>
			<input type="text" id="newReplyText" placeholder="댓글내용" class="from-control">
			<button type="button" class= "btn btn-outline-secondary btn-sm" id="replyAddBtn">댓글 추가</button>
		</div><!-- body -->
	</div>
	
	<!-- 댓글추가공간 -->
	<ul id="replies">
		<!-- 비어있는 ul -->
	</ul>
	
	<!-- mod -->
	<div id="modDiv" style="display:none;" >
		<div class="modal-title"></div>
		<div>
			<input type="text" id="reply" class="form-control form-control-sm">
		</div>
		<div>
			<button type="button" id="replyModBtn" class="btn btn-outline-dark btn-sm">수정</button>
			<button type="button" id="replyDelBtn" class="btn btn-outline-dark btn-sm">삭제</button>
			<button type="button" id="closeBtn" class="btn btn-outline-dark btn-sm">닫기</button>
		</div>
	</div> 
	
		</div><!-- container2 -->
	</div><!-- container -->
	
	
	<script type="text/javascript">
		var paidnum = ${novel.paid_num}
		var novelNum = ${novel.novel_num}
		
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		
		
		
		function getContent(){ // ■ 해당 소설의 상세 본문 가져오기
			
			var url = "/paid/" + paidnum;
			
			$.getJSON(url, function(data){
				
				var str = "";
				
				$(data).each(function(){
					
					str+= "<textarea class='form-control' readonly>"+this.paid_content1 + this.paid_content2 + "</textarea>"
					
				});
			
				$("#Pcon").html(str);
			});
		}
		getContent();
		
		
		function getAllList(){
			
			$.getJSON("/preplies/all/" + novelNum + "/" + paidnum, function(data){
		
				var str= "";
				
				$(data).each(function(){
					let timestamp = this.prepl_rdate; 
					let date = new Date(timestamp);
					
					let formattedTime = "게시일 : " + date.getFullYear() 
										+ "년" + (date.getMonth()+1) 
										+ "월" + date.getDate() + "일" 
										+ "-" + date.getHours()
										+ ":" + date.getMinutes()
										+ ":" + date.getSeconds();
				
					str += "<div class='replyLi' data-prepl_num='" + this.prepl_num + "'><strong>@"
						+ this.prepl_writer + "</strong> - " + formattedTime + "<br>"
						+ "<div class='reply'>" + this.prepl_content + "</div>"
						+ "<button type='button' class='btn btn-outline-secondary btn-sm'>수정/삭제</button>"
						+ "</div>";
					});
				$("#replies").html(str);
			});
		}
		getAllList();
		
		
		// 댓글 추가
		$('#replyAddBtn').on("click",function(){
			
			var preplWriter = $("#newReplyWriter").val();
			var preplContent = $("#newReplyText").val();
			
			
			console.log(novelNum);
			console.log(paidnum);
			console.log(preplWriter);
			console.log(preplContent);
			$.ajax({
				type : 'post',
				url : '/preplies',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					novel_num : novelNum,
					paid_pnum : paidnum,
					prepl_writer : preplWriter,
					prepl_content : preplContent
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("댓글이 등록 되었습니다.");
						getAllList(); // 댓글 등록 성공시, 다시 목록 갱신
						// 폼 태그 비우기.
						$("#newReplyText").val("");
					}
				}
			});
		});
		
		
		// 이벤트 위임
		$("#replies").on("click", ".replyLi button", function(){
			
			var replytag = $(this).parent();
			
			// 형제 태그 .reply의 내용을 대신 가져올수있도록
			// 변수 replyContent에 선언해 거기에 저장해주세요. 
			// (hint : .siblings("요소명"); 으로 형제태그를 가져올수있습니다
			//var replyContent = $(this).prev().text();// button의 직전 태그인 .reply의 내용물 가져오기
			var replyContent = $(this).siblings(".reply").text(); // button의 형제 중 .reply의 내용물 가져오기
			//var replyContent = $(this).parent().children(".reply").text(); 
			
			var preplNum = replytag.attr("data-prepl_num");
			var reply = replytag.text();
		
			$(".modal-title").html(preplNum); // modal-title 부분에 글번호 입력 
			$("#reply").val(replyContent);  // reply 영역에 리플내용을 기입(수정삭제)
			$("#modDiv").show("slow"); // modal 열림
		});
			
		// 모달창 닫기
		$("#closeBtn").on("click",function(){ // #close버튼 클릭시
			$("#modDiv").hide("slow"); //#modDiv를 닫습니다.
		});
		
		// 삭제
		$("#replyDelBtn").on("click", function(){
			var preplNum = $(".modal-title").html();
			$.ajax({
				type : 'delete',
				url : '/preplies/' + preplNum,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				header : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert("댓글이 삭제되었습니다.");
						$("#modDiv").hide("slow");
						getAllList(); 
					}
				}
			});
		});
		
		// 수정
		$("#replyModBtn").on("click", function(){
			var preplNum = $(".modal-title").html();
			var reply = $("#reply").val();
			
			$.ajax({
				type : 'patch', 
				url : '/preplies/' + preplNum,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH" 
				},
				contentType : "application/json",
				data : JSON.stringify({
					prepl_content:reply,
					prepl_num:preplNum
				}),
				dataType : 'text',
				success : function(result){
					console.log("result : " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});
		
		
		// ■ 결제시 코인 차감 
		$("#chargeBtn").on("click", function(){
			
			if(${user.user_coin < 100}){
				
				console.log(typeof(${user.user_coin}));
				alert("코인이 부족합니다. 충전페이지로 이동합니다");
				location.href = "/charge/${user.user_num}";
			} else{
					var coin = ${novel.paid_price}
					var userNum = ${user.user_num};
					console.log(typeof(${user.user_coin}));
					// 코인 차감
					$.ajax({
						type : 'patch', 
						url : '/remove',
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							},
						header : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "PATCH" 
						},
						contentType : "application/json",
						data : JSON.stringify({
							user_coin : coin,
							user_num : userNum
							}),
						dataType : 'text',
						success : function(result){
							if(result == 'SUCCESS'){
								addUse();
							}
						}
					});
			}
		});
		
		// ■ 구매시 use테이블(구매목록) 테이블에 넣어주기
		function addUse(){
			
			var coin = ${novel.paid_price}
			var userNum = ${user.user_num};
			var useType = '코인';
			$.ajax({
				type : 'post',
				url : '/insertUse',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				dataType : 'text',
				data : JSON.stringify({
					user_num : userNum,
					paid_num : paidnum,
					use_type : useType,
					use_count : coin
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("결제완료! 구매목록에 등록되었습니다.");
						$("#chargeBtn").hide();
						location.href = "/paid/detail/${novel.novel_num}/${novel.paid_num}/${user.user_num}";
					}
				}
			});
		}
		
		// ■ 추천버튼 클릭시 유료추천테이블 적재
		$('#recBtn').on("click",function(){
			
			var userNum = ${user.user_num};
			
			$.ajax({
				type : 'post',
				url : '/paid',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				dataType : 'text',
				data : JSON.stringify({
					user_num : userNum,
					paid_num : paidnum,
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						addRec();
					}
				}
			});
		});
		
		// ■ 추천시 추천수 올리기
		function addRec(){
			
			$.ajax({
				type : 'patch', 
				url : '/paid/' + paidnum,
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH" 
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				contentType : "application/json",
				data : JSON.stringify({paid_num : paidnum}),
				dataType : 'text',
				success : function(result){
					console.log("result : " + result);
					if(result == 'SUCCESS'){
						alert("추천되었습니다.");
						location.href = "/paid/detail/${novel.novel_num}/${novel.paid_num}/${user.user_num}";
						
					}
				}
			});
			
		}
		
		// 네비 메뉴바 마우스 호버하는 경우 (소설 선택 -> 유료/무료 소설 페이지 뜨도록)
	     $(document).ready(function () {
	     $('.navbar-light .dmenu').hover(function () {
	             $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
	         }, function () {
	             $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
	         });
	     });
	</script>
	<div class="footer">
	
	</div>
</body>
</html>