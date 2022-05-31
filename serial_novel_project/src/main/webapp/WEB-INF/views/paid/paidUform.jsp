<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="kor">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style type="text/css">

.container{
	margin-top: 50px;
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
</style>  
<meta charset="UTF-8">
<title>Insert title here</title>
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
	 <h2>${vo.paid_title} 수정</h2>
 	<form action="/paid/paidUpdate" method="POST">
 		<input type="hidden" name="paid_num" value="${vo.paid_num }">
 		<input type="hidden" name="novel_num" value="${vo.novel_num }">

		<div class="mb-3">
			<label>제목</label>					
			<input type="text" class="form-control col-md-5" name="paid_title" value="${vo.paid_title }">
		</div>
		<div class="mb-3">
			<label>작가</label>
				<input type="text" class="form-control col-md-3" name="paid_writer" value="${vo.novel_writer }" readonly>
			<label>회차</label>
				<input type="number" class="form-control col-md-3" name="paid_snum"  min="1"  value="${vo.paid_snum }">
			<label>가격</label>
				<input type="number" class="form-control col-md-3" name="paid_price"  min="100" value="${vo.paid_price }">
		</div>
		<div class="mb-3">
			<label>내용</label>
			<textarea class="form-control" rows="5" name="paid_content1" placeholder="수정할 내용을 입력해 주세요" ></textarea>
			<textarea class="form-control" rows="5" name="paid_content2" placeholder="수정할 내용을 입력해 주세요" ></textarea>
		</div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<div>
			<input class="btn btn-sm btn-primary" type="submit" value="수정">
			<input type="reset" class="btn btn-sm btn-primary" value="초기화">
			
		</div>
	</form>	
</div><!-- container -->

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
</body>
</html>