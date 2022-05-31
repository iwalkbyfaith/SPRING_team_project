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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
			
			
			/*여기부터 캐러셀*/
				.crsOutter{
					overflow: hidden;
					height : 300px
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
				#crsBtn1, #crsBtn2, #crsBtn3{
					color : #dcdcdc;
					padding: 0;
					height : 10px;
					width : 20px;				
				}
					
				#prev, #next{
					background-color :#c8c8c8;
					padding: 0;
					height : 10px;
					width : 20px;
				}
				
			
			
			/* 여기부터 조회수, 추천수 리스트 관련 */
				.bestTotalView, .bestTotalHit{ 
					/*background-color : whitesmoke;*/
					width : 100%;
					height : 350px;
					
				}
				.bestBody{
					background-color : whitesmoke;
					/*background-color : 	#d2d2d2;*/
					height : 320px;
					text-align : center;
					margin: 10px 0px 50px 0px;
				}
				.listtitle{
					margin: 1px 0px 0px 8px;
				}
				
				.work{
					
					border : 1px solid black;
					padding: 10px 12px;
					margin : 30px;
					/*background-color : #c8c8c8;*/
					background-color : white;

					display:inline-block;  zoom:1;
				}
				
				.work img {
					
					width: 130px;
					height: 180px;	
					margin: 10px;
				}
				.icon div{
					padding: 0;
				}
				.icon img{
					width : 20px;
					height : 20px;
					margin : 0px 5px;
				}
				.listtitle{
					font-weight : bold;
					text-align : center;
				}
				
			
				
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
<meta charset="utf-8">
<!--<link rel="styleshett" href="header-navi.css"> ◀ 헤더 네비바 css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">

<title>메인</title>
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
			              	<a class="nav-link" href="http://localhost:8181/charge">결제</a>
		               </li>
		          </ul><!-- ul 태그 끝 -->
		          <div class="social-part">
		            <sec:authorize access="isAuthenticated()">
		            <div class="menubar">
		            <ul> 	
    	  	<li style="list-style:none;"><a href="#" id="current">내정보</a>
        	 <ul>
           <li><a href="/mypage/myInfo">계정정보</a></li>
           <li><a href="/mypage/myFavor">선호작</a></li>
           <li><a href="/mypage/bookmark">책갈피</a></li>
           <li><a href="/customLogout">로그아웃</a></li>
           
     	    </ul>
   			   </li>
      			</ul>
      			</div>
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
     
     	<div class="crsOutter">
	     	<div class="carousel">
	     		<div class="innerCrs">
	     			<a href="http://localhost:8181/enroll/list"><img src="/resources/carousel/1.png"></a>
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
	    	<button id="prev" class="btn btn-light btn btn-secondary btn-sm">　</button>
	     	<button id="crsBtn1" class="btn btn-light btn btn-secondary btn-sm">　</button>
	     	<button id="crsBtn2" class="btn btn-light btn btn-secondary btn-sm">　</button>
	     	<button id ="crsBtn3" class="btn btn-light btn btn-secondary btn-sm">　</button>
			<button id ="next" class="btn btn-light btn btn-secondary btn-sm">　</button>
		</div><br/><br/>
		
		
		
		
     	<script>
     	
     	let thisPic = 1;	
     	
     		// ● crsBtn2를 누르면 transform : translate(-100vw)
	     		document.querySelector('#crsBtn2').addEventListener('click', function(){
	     			
	     			thisPic = 2;
	     			
	     			// 왼쪽으로 -100vw만큼 이동
	     			document.querySelector('.carousel').style.transform = 'translate(-100vw)';
	     		})
	     		
     		
     		
     		// ● crsBtn3를 누르면 transform : translate(-200vw)
	     		document.querySelector('#crsBtn3').addEventListener('click', function(){
	     			
	     			thisPic = 3;
	     			
	     			// 왼쪽으로 -200vw만큼 이동
	     			document.querySelector('.carousel').style.transform = 'translate(-200vw)';
	     		})
     		
     		
     		
     		// ● crsBtn1를 누르면 transform : translate(0vw)
	     		document.querySelector('#crsBtn1').addEventListener('click', function(){
	     			
	     			thisPic = 1;
	     			
	     			// 제자리로
	     			document.querySelector('.carousel').style.transform = 'translate(0vw)';
	     		})
     		
     		
     		// ● 다음 버튼
				  $('#next').on('click', function(){
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
				  
				  
				  $('#prev').on('click', function(){
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
     
  
 
    




     
     	<!-- ■ 유료 소설 조회수 베스트 -->
    	
     	<div class='bestTotalView'>
     		<h2 class="listTitle">유료소설 조회수 베스트</h2><!-- .bestTotalView -->
     		<div class="bestBody">
     			
     			<c:forEach var="view" items="${paidViewList}">
     				<div class="work">
	     				<div><a href="http://localhost:8181/paid/List/${view.novel_num}"><img src='/resources/novel_image/${view.novel_num}.png'></a></div>
	     				<div>${view.novel_title}</div>
	     				<div class="icon">
	     					<div><img src='/resources/main/view2.png'>${view.total_view}</div>
	     				</div>
     				</div>
     			</c:forEach>
     			
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/><br/>
     
     
     
     	<!-- ■ 유료 소설 추천수 베스트 -->
     	     
     	<div class='bestTotalHit'>
     		<h2 class="listTitle">유료소설 추천수 베스트</h2><!-- .bestTotalFav -->
     		<div class="bestBody">
     			
     			<c:forEach var="rec" items="${paidRecList}">
     				<div class="work">
	     				<div><a href="http://localhost:8181/paid/List/${rec.novel_num}/${user}"><img src='/resources/novel_image/${rec.novel_num}.png'></a></div>
	     				<div>${rec.novel_title}</div>
	     				<div class="icon">
	     					<div><img src='/resources/main/thumb.png'>${rec.total_rec}</div>
	     				</div>
     				</div>
     			</c:forEach>
     			
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/><br/>
     
     
     

     
     
       	<!-- ■ 무료 소설 조회수 베스트 -->
       	
     	<div class='bestTotalView'>
     		<h2 class="listTitle">무료소설 조회수 베스트</h2><!-- .bestTotalView -->
     		<div class="bestBody">
     			
     			<c:forEach var="view" items="${freeViewList}">
     				<div class="work">
	     				<div><a href="http://localhost:8181/free/series/${view.novel_num}"><img src='/resources/novel_image/${view.novel_num}.png'></a></div>
	     				<div>${view.novel_title}</div>
	     				<div class="icon">
	     					<div><img src='/resources/main/view2.png'>${view.total_view}</div>
	     				</div>
     				</div>
     			</c:forEach>
     			
     			
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/><br/>
     
		
		
		
       	<!-- ■ 무료 소설 추천수 베스트 -->		
		<div class='bestTotalHit'>
			<h2 class="listTitle">무료소설 추천수 베스트</h2><!-- .bestTotalFav -->
     		<div class="bestBody">
     			
     			<c:forEach var="rec" items="${freeRecList}">
     				<div class="work">
	     				<div><a href="http://localhost:8181/free/series/${rec.novel_num}"><img src='/resources/novel_image/${rec.novel_num}.png'></a></div>
	     				<div>${rec.novel_title}</div>
	     				<div class="icon">
	     					<div><img src='/resources/main/thumb.png'>${rec.total_rec}</div>
	     				</div>
     				</div>
     			</c:forEach>
     			
     		</div><!-- 바디 -->
     	</div><!-- 제일 바깥 --> <br/><br/><br/>





























<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>