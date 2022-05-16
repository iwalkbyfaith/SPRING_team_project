<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
			.container{
				height:1000px;
			}
			.footer{
				height:150px;
			}
			#headerfLi,#headerwLi,#headerrLi,#headermLi{
				list-style-type:none;
				float:left;
				margin-left:20px;
				font-size:30px;
				outline:solid 1px;
			}
			.fantasyLi , .romanceLi , .wuxiaLi , .mysteryLi{
				list-style-type:none;
				float:left;
				margin-left:20px;
				outline:solid 1px;
			}
			.writebtn,.List,.series{
				float:right;
				margin-right:10px;
			}
			.articleInfo{
				float:right;
			}
			.articleMain{
				text-align:center;
			} 
	</style>

<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">

<title>메인 만들기 test</title>
</head>
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
			              		<a class="dropdown-item" href="/paid/novel/mon">유료소설</a>
			              	</div>
			          	</li>
			          <li class="nav-item">
				            <a class="nav-link" href="#">작가 신청 게시판</a>
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


</body>
</html>