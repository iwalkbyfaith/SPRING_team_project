<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<!DOCTYPE html>
<html>
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
	
			.carousel{
				width : 300vw;
				transition : transform 0.5s;
				
			}
			
			.innerCrs{
				width : 100vw;
				float : left;
			}	
			
			.innerCrs img{
				width : 100%
			}
			
			.btnList{
				 text-align: center;
			}
			
			
			
	</style>
<meta charset="UTF-8">
<meta charset="utf-8">
<!--<link rel="styleshett" href="header-navi.css"> ◀ 헤더 네비바 css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">

<!-- ● 캐러셀 
<link href="main.css" rel="stylesheet">
-->


<title>메인 만들기 test</title>
</head>
<body style="margin:0">
	
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
				            <a class="nav-link" href="/enroll/list">작가 신청 게시판</a>
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
     
     
     
     
     <!-- ● 캐러셀 시작 -->
     
     	<div style="overflow: hidden">
	     	<div class="carousel">
	     		<div class="innerCrs">
	     			<a href="#"><img src="/resources/carousel/1.png"></a>
	     		</div>
	     		<div class="innerCrs">
	     			<a href="http://localhost:8181/tourna/list2"><img src="/resources/carousel/2.png"></a>
	     		</div>
	     		<div class="innerCrs">
	     			<a href="#"><img src="/resources/carousel/3.png"></a>
	     		</div>
	     	</div>
     	</div>
     
     	<div class="btnList">
	    	<button class="prev">이전</button>
	     	<button class="crsBtn1">1</button>
	     	<button class="crsBtn2">2</button>
	     	<button class="crsBtn3">3</button>
			<button class="next">다음</button>
		</div>
		
		
		
		
     	<script>
     	
     	let thisPic = 1;	
     	
     		// ● crsBtn2를 누르면 transform : translate(-100vw)
	     		document.querySelector('.crsBtn2').addEventListener('click', function(){
	     			
	     			thisPic = 2;
	     			
	     			// 왼쪽으로 -100vw만큼 이동
	     			document.querySelector('.carousel').style.transform = 'translate(-100vw)';
	     		})
	     		
     		
     		
     		// ● crsBtn3를 누르면 transform : translate(-200vw)
	     		document.querySelector('.crsBtn3').addEventListener('click', function(){
	     			
	     			thisPic = 3;
	     			
	     			// 왼쪽으로 -200vw만큼 이동
	     			document.querySelector('.carousel').style.transform = 'translate(-200vw)';
	     		})
     		
     		
     		
     		// ● crsBtn1를 누르면 transform : translate(0vw)
	     		document.querySelector('.crsBtn1').addEventListener('click', function(){
	     			
	     			thisPic = 1;
	     			
	     			// 제자리로
	     			document.querySelector('.carousel').style.transform = 'translate(0vw)';
	     		})
     		
     		
     		// ● 다음 버튼
				  $('.next').on('click', function(){
				    if (thisPic == 1) {
				    	$('.carousel').css('transform', 'translateX(-100vw)');
				    	thisPic += 1;
				    	
				    }else if (thisPic == 2){
			    		$('.carousel').css('transform', 'translateX(-200vw)');
			        	thisPic += 1;
			        	
				    }else if(thisPic == 3){
				    	thisPic = 1;
				    	$('.carousel').css('transform', 'translateX(0vw)');
				    }
				  }) // end click .next
				  
				  
				  $('.prev').on('click', function(){
					    if (thisPic == 3) {
					    	$('.carousel').css('transform', 'translateX(-100vw)');
					    	thisPic -= 1;
					    	
					    }else if (thisPic == 2){
				    		$('.carousel').css('transform', 'translateX(0vw)');
				        	thisPic -= 1;
				        	
					    }else if(thisPic == 1){
					    	thisPic = 3;
					    	$('.carousel').css('transform', 'translateX(-200vw)');
					    }
					  }) // end click .prev
					  
					  
			  	  
					  
					  
					  
					  
					  
					  
     	
     	</script>
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     <h1> 메인 </h1>

     
    <a href="/secu/join">join</a>
	<a href="/customLogin">login</a>
    <a href="/charge">결제</a>
    

     <h3>0. 공지바(사진 바뀌는거)</h3>
     <h3>1. 무료소설 조회수 베스트</h3>
     <h3>2. 유료소설 조회수 베스트</h3>
     <h3>3. 무료소설 선호작 베스트</h3>
     <h3>4. 유료소설 선호작 베스트</h3>





























</body>
</html>