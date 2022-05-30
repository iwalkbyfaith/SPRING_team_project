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
<style>
div.week {
	display: flex;
	justify-content: center;
}

.weekView {
	margin: 50px;
}

.listTitle {
	font-size: 31px;
	color: darkgray;
	text-align: center;
}

.work {
	padding-top: 30px;
}

.word{
	
	text-align: center;
	font-size: 15px;
	font-weight: bold;
}

img {
	width: 154px;
	height: 170px;
}


				
		
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
	<!-- ■ 상단 네비바 -->
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
				            <a class="nav-link" href="/enroll/list">작품 신청 게시판</a>
			          </li>
			          <li class="nav-item">
				            <a class="nav-link" href="/tourna/list2">토너먼트</a>
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
     
 
    <!-- ■ 유료 소설 조회수 베스트 -->
    <div class="week">
    	<sec:authentication property="principal.user" var="user"/>
     	<div class='weekView'>
     		<div class="listTitle">월요소설</div>
     		<div class="weekBody">
     			<c:forEach var="mon" items="${monList}">
     				<div class="work">
	     				<div><a href="http://localhost:8181/paid/List/${mon.novel_num}"><img src='/resources/novel_image/${mon.novel_num}.png'></a></div>
	     				<div class="word">${mon.novel_title}</div>
     				</div>
     			</c:forEach>
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/>
  
		<div class='weekView'>
     		<div class="listTitle">화요소설</div>
     		<div class="weekBody">
     			<c:forEach var="tue" items="${tueList }">
     				<div class="work">
	     				<div><a href="http://localhost:8181/paid/List/${tue.novel_num}"><img src='/resources/novel_image/${tue.novel_num}.png'></a></div>
	     				<div class="word">${tue.novel_title}</div>
     				</div>
     			</c:forEach>
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/>  
  			
     	<div class='weekView'>
     		<div class="listTitle">수요소설</div>
     		<div class="weekBody">
     			<c:forEach var="wed" items="${wedList }">
     				<div class="work">
	     				<!-- <div><a href="http://localhost:8181/paid/List/${wed.novel_num}/${user.user_num}"><img src='/resources/novel_image/${wed.novel_num}.png'></a></div> -->
	     				<div><a href="http://localhost:8181/paid/List/${wed.novel_num}"><img src='/resources/novel_image/${wed.novel_num}.png'></a></div>
	     				<div class="word">${wed.novel_title}</div>
     				</div>
     			</c:forEach>
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/>
     	
     	<div class='weekView'>
     		<div class="listTitle">목요소설</div>
     		<div class="weekBody">
     			<c:forEach var="thu" items="${thuList }">
     				<div class="work">
	     				<div><a href="http://localhost:8181/paid/List/${thu.novel_num}"><img src='/resources/novel_image/${thu.novel_num}.png'></a></div>
	     				<div class="word">${thu.novel_title}</div>
     				</div>
     			</c:forEach>
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/>
     	
     	<div class='weekView'>
     		<div class="listTitle">금요소설</div>
     		<div class="weekBody">
     			<c:forEach var="fri" items="${friList }">
     				<div class="work">
	     				<div><a href="http://localhost:8181/paid/List/${fri.novel_num}"><img src='/resources/novel_image/${fri.novel_num}.png'></a></div>
	     				<div class="word">${fri.novel_title}</div>
     				</div>
     			</c:forEach>
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/>
    </div><!-- week -->
    
    <div class="footer">
	     
	     	<div class="row">	  	
				<!-- 검색창 -->
			  	<form action="/paid/novelList" method="get">
			  		<!-- select태그를 이용해 클릭시 검색조건을 선택할수 있도록 처리합니다. -->
			  		<select name="searchType">
			  			<!-- 검색조건을 option태그를 이용해 만듭니다. -->
			  			<option value="n">-</option>
			  			<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : ''}>제목</option>
			  			<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : ''}>작가</option>
			  			<option value="tcw" ${pageMaker.cri.searchType eq 'tw' ? 'selected' : ''}>제목+작가</option>
			  		</select>
			  		<input type="text" name="keyword" placeholder="검색어" value="${pageMaker.cri.keyword }">
			  		<input type="submit" value="Search">
			  	</form>
		  	</div>
		  	
	  </div><!-- footer -->
</body>
</html>