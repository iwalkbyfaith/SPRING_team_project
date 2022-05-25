<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 아임포트 모4듈 -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결제 창</h1>
	
<div class="itemSection">
	<div class="itemCard">
		<div class="itemTitle">
			<h2>100코인</h2>
		</div>
		<div class="itemPrice">
			<p data-price="1000">1,000원</p>
		</div>
		<div class="itemButton">
			<button class="orderBtn">주문하기</button>
		</div>
	</div>
	<div class="itemCard">
		<div class="itemTitle">
			<h2>200코인</h2>
		</div>
		<div class="itemPrice">
			<p data-price="2000">2,000원</p>
		</div>
		<div class="itemButton">
			<button class="orderBtn">주문하기</button>
		</div>
	</div>	
</div>

<button class="addBtn">코인추가</button>

<script type="text/javascript">
	// 미리 받아와야할 정보를 변수에 전역변수처름 쓰기위해 선언
	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue="${_csrf.token}"
	
	var itemPrice = 0;
	var itemTitle = "";
	var merchant_uid = "";
	var userNum = 1;
	
	var coin = 100;
	var coupon = 1;
	
	// 위임처리로 어떤 상품을 클릭했을 때 그 상품에 대한
	$(".itemSection").on("click",".orderBtn",function(){
		itemPrice = $(this).parent().siblings(".itemPrice").children().attr("data-price");
		itemTitle = $(this).parent().siblings(".itemTitle").children().text();
		d = new Date();
		merchant_uid = "order" + d.getTime();
		iamport();
	});


function iamport(){
	IMP.init('imp28027601'); //iamport 대신 자신의 "가맹점 식별코드"를 사용하시면 됩니다
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
					
							alert(itemTitle + "결제완료!");
			
					
				} // 결제 success end	
			}); // 결제 ajax end
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
}


$(".addBtn").on("click", function(){
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
				alert("수정 되었습니다.");
			}
		}
	});
});
</script>			
</body>
</html>