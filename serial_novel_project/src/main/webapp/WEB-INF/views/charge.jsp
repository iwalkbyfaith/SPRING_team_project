<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 

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
  		padding-top: 200px;
	}
	
	.itemCard{
		float: left;
		margin-left: 48px;
	}
	.itemContent p {
		font-size: 14px;
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

	<div class="header">
	
	</div>
	
	<sec:authentication property="principal.user" var="user"/>
     
    <p>아이디  : <sec:authentication property="principal.user.user_id"/></p>					
	
	<p>이름 : <sec:authentication property="principal.user.user_name"/></p>					
	
	<p>핸드폰 : <sec:authentication property="principal.user.user_pnum"/></p>					
	
	<p>이메일 : <sec:authentication property="principal.user.user_email"/></p>					
	
	<p>보유 코인 : <sec:authentication property="principal.user.user_coin"/></p>					
	
	<p>보유 쿠폰 : <sec:authentication property="principal.user.user_coupon"/></p>					
	
	<p>가입일  : <sec:authentication property="principal.user.user_rdate"/></p>	
	
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
	<div class="container2"> 
		<h1>내 결제 내역</h1>
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
</script>			
</body>
</html>