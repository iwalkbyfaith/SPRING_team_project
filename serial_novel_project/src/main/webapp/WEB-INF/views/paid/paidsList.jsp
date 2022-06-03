<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>   
<style type="text/css">
.container{
	text-align: center;
	margin-top: 70px;
}
img {
	width:163px;
	margin:0; 
	padding:0;
	margin-left: 19px;
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
.imgTh{
	width: 230px;
	
}
table {
	font-size: 20px;
}

td p {
	font-size: 10px;
}



</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal.user" var="user"/>
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
		</div><!-- header 끝 -->
		
		<div class="container">
			
			<table class="table caption-top table-sm">
			  <tbody>
			    <tr>
			    	<th class="imgTh" rowspan="5"><img src='/resources/novel_image/${novelList.novel_num}.png' ></th>
			      <th scope="row">소설제목</th>
			      	<td>${novelList.novel_title }</td>
			      <th scope="row">작가</th>
			      	<td>${novelList.novel_writer }</td>
			    </tr>
			    <tr>
			      <th scope="row">장르</th>
			      	<td>${novelList.novel_category }</td>
			      <th scope="row">요일</th>
			      <td>${novelList.novel_week }</td>
			    </tr>
			    <tr>
			      <th scope="row">${novelList.novel_end eq true ? '완결' : '연재중'}</th>
			    <!-- fav 데이터 유무에 따라 보여주는 버튼 -->
				<c:if test="${fav eq null}">
			      <td><button id="addfavBtn" class="btn btn-outline-danger btn-lg" >♡</button></td>
				</c:if>
				<c:if test="${fav ne null}">
			      <td><button id="delfavBtn" class="btn btn-danger btn-lg">♥</button></td>
				</c:if>
			    </tr>
			  </tbody>
			</table>

			<hr>
			<table class="table table-bordered border-info">
				<tr>
					<th>회차</th>
					<th>제목</th>
					<th>조회수</th>
					<th>추천</th>
					<th>가격</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="paid" items="${paidList }">
						<tr>
							<td>${paid.paid_snum }</td>
							<td><a href="/paid/detail/${paid.novel_num }/${paid.paid_num }/${user.user_num}" >${paid.paid_title }</a></td>
							<td>${paid.paid_hit }</td>
							<td>${paid.paid_rec }</td>
							<td>${paid.paid_price } Coin</td>
							<td>${paid.paid_rdate }</td>
						</tr>
					</c:forEach>
			</table>
			<a href="/paid/novelList">요일별 목록</a><br>
			<!-- 자신이 작성한 유료소설이 아닐경우 글쓰기 버튼 미출력 -->
			<c:if test="${user.user_id eq paidList[0].user_id}">
				<a href="/paid/insertS/${novelNum}">회차 글쓰기</a>
			</c:if>
		</div>
		
		<div class="footer">
		
		</div>
		
		<script type="text/javascript">
			var userNum = ${user.user_num};
			var novelNum = ${novelList.novel_num}
			var csrfHeaderName = "${_csrf.headerName}"
			var csrfTokenValue="${_csrf.token}"
		
			// ■ 선호 버튼 클릭시
		$('#addfavBtn').on("click",function(){
			
			
			$.ajax({
				type : 'post',
				url : '/paid/fav',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				dataType : 'text',
				data : JSON.stringify({
					novel_num : novelNum,
					user_num : userNum,
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("선호작 등록완료.");
						$("#addfavBtn").hide();
						location.href = "/paid/List/${novelList.novel_num}";
					}
				}
			});
		});
		
			// 활성화 된 선호 버튼 클릭 시
		$("#delfavBtn").on("click", function(){
			
			$.ajax({
				type : 'delete',
				url : '/paid/del/' + novelNum + '/' + userNum,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				header : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert("선호작 삭제완료.");
						$("#delfavBtn").hide();
						location.href = "/paid/List/${novelList.novel_num}";
					}
				}
			});
		});
		
		// 네비 메뉴바 마우스 호버하는 경우 (소설 선택 -> 유료/무료 소설 페이지 뜨도록)
	     $(document).ready(function () {
	     $('.navbar-light .dmenu').hover(function () {
	             $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
	         }, function () {
	             $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
	         });
	     });
		
		</script>
		
		
</body>
</html>