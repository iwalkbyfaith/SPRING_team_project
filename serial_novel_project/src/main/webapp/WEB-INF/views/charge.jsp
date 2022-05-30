<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

    
<!-- ■ 상단 네비바 추가하기 1) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<!DOCTYPE html>
<html>
<head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
	
	.container {
		text-align: center;
		display: flex;
  		justify-content: center;
  		padding-top: 25px;
	}
	.container2 {
		text-align: center;
		display: flex;
  		justify-content: center;
  		padding-top: 25px;
	}
	
	.itemCard{
		float: left;
		margin-left: 48px;
	}
	.itemContent p {
		font-size: 14px;
	}
	
	h1 {
		margin-top: 50;
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
	
	


<!-- 아임포트 모4듈 -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ■ 상단 네비바 추가하기 3)-->
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
     </div><!-- header 끝 --> 
     
     
	<h1>결제 창</h1>
	<div class="container">
		<div class="itemSection">
			<div class="itemCard">
				<div class="itemTitle">
					<h2>100코인</h2>
				</div>
				<div class="itemContent">
					<p>100코인 + 쿠폰 1장<p>
				</div>
				<div class="itemPrice">
					<p data-price="1000"></p>
				</div>
				<div class="itemButton">
					<button class="orderBtn">1,000원</button>
				</div>
			</div>
			<div class="itemCard">
				<div class="itemTitle">
					<h2>300코인</h2>
				</div>
				<div class="itemContent">
					<p>300코인 + 쿠폰 3장<p>
				</div>
				<div class="itemPrice">
					<p data-price="3000"></p>
				</div>
				<div class="itemButton">
					<button class="orderBtn">3,000원</button>
				</div>
			</div>
			<div class="itemCard">
				<div class="itemTitle">
					<h2>500코인</h2>
				</div>
				<div class="itemContent">
					<p>500코인 + 쿠폰 5장<p>
				</div>
				<div class="itemPrice">
					<p data-price="5000"></p>
				</div>
				<div class="itemButton">
					<button class="orderBtn">5,000원</button>
				</div>
			</div>
			<div class="itemCard">
				<div class="itemTitle">
					<h2>1000코인</h2>
				</div>
				<div class="itemContent">
					<p>1000코인 + 쿠폰 10장<p>
				</div>
				<div class="itemPrice">
					<p data-price="10000"></p>
				</div>
				<div class="itemButton">
					<button class="orderBtn">10,000원</button>
				</div>
			</div>
			<div class="itemCard">
				<div class="itemTitle">
					<h2>3000코인</h2>
				</div>
				<div class="itemContent">
					<p>3000코인 + 쿠폰 30장<p>
				</div>
				<div class="itemPrice">
					<p data-price="30000"></p>
				</div>
				<div class="itemButton">
					<button class="orderBtn">30,000원</button>
				</div>
			</div>
			<div class="itemCard">
				<div class="itemTitle">
					<h2>5000코인</h2>
				</div>
				<div class="itemContent">
					<p>5000코인 + 쿠폰 50장<p>
				</div>
				<div class="itemPrice">
					<p data-price="50000"></p>
				</div>
				<div class="itemButton">
					<button class="orderBtn">50,000원</button>
				</div>
			</div>
		</div><!-- itemSection -->
		
	</div><!-- container -->
	<hr>
	<h1>내 결제 내역</h1>
	<div class="container2"> 
		
    	<c:if test="${empty chargeList}">
    		<h1>결제한 내역이 없습니다.</h1>
    	</c:if>
    	<c:if test="${not empty chargeList }">
	    	<table class="table table-bordered border-info">
				<tr>
					<th>상품명</th>
					<th>결제일시</th>
					<th>결제금액</th>
				</tr>
				<c:forEach var="charge" items="${chargeList }">
					<tr>
						<td>${charge.itemname}</td>
						<td>${charge.charge_date}</td>
						<td>${charge.charge_price}원</td>
					</tr>
				</c:forEach>
			</table>
    	</c:if>
	
	</div><!-- container2 -->
	
	
<script type="text/javascript">
	// 미리 받아와야할 정보를 변수에 전역변수처름 쓰기위해 선언
	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue="${_csrf.token}"
	
	var itemPrice = 0;
	var itemTitle = "";
	var merchant_uid = "";
	var userNum = ${user.user_num};
	
	var coin = "";
	var coupon = "";
	
	// 위임처리
	$(".itemSection").on("click",".orderBtn",function(){
		itemPrice = $(this).parent().siblings(".itemPrice").children().attr("data-price");
		
		if(itemPrice == 3000){
			coupon = 3;
			coin = 300;
		}
		else if(itemPrice == 1000){
			coupon = 1;
			coin = 100;
		}
		else if(itemPrice == 5000){
			coupon = 5;
			coin = 500;
		}
		else if(itemPrice == 10000){
			coupon = 10;
			coin = 1000;
		}
		else if(itemPrice == 30000){
			coupon = 30;
			coin = 3000;
		}
		else if(itemPrice == 50000){
			coupon = 50;
			coin = 5000;
		}
		itemTitle = $(this).parent().siblings(".itemTitle").children().text();
		d = new Date();
		merchant_uid = "order" + d.getTime();
		
		iamport();
	
	});


function iamport(){
	IMP.init('imp28027601'); 
	IMP.request_pay({
		pg : 'html5_inicis',
		pay_method : 'card',
		merchant_uid : merchant_uid,
		name : itemTitle,
		amount : itemPrice,
		buyer_email : 'iamport@siot.do',
		buyer_name : '구매자',
		buyer_tel : '010-1234-5678',
		buyer_addr : '서울특별시 강남구 삼성동',
		buyer_postcode : '123-456'
	}, function(rsp) {
		if ( rsp.success ) {
			$.ajax({
				type:'post',
				url:'/order',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				contentType : "application/json",
				dataType:"text",
				data: JSON.stringify({
					itemname : itemTitle,
					charge_price : itemPrice,
					merchant_uid : merchant_uid,
					user_num : userNum
				}),
				success:function(){
						addCoin(); // ■ 코인추가를위해 addCoin 호출
				} // 결제 success end	
			}); // 결제 ajax end
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
}

//■ 코인추가를위해 addCoin 선언
function addCoin(){
	console.log(userNum)
	console.log(coin)
	console.log(coupon)
	$.ajax({
		type : 'patch', 
		url : '/coinAdd',
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
			user_coupon : coupon,
			user_num : userNum
			}),
		dataType : 'text',
		success : function(result){
			console.log("result : " + result);
			if(result == 'SUCCESS'){
				alert("결제성공! 코인이 추가되었습니다.");
				location.href = "/charge/${user.user_num}";
			}
		}
	});
};

//네비 메뉴바 마우스 호버하는 경우 (소설 선택 -> 유료/무료 소설 페이지 뜨도록)
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