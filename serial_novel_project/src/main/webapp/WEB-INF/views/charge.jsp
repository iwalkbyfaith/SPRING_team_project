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


<script type="text/javascript">
	// 미리 받아와야할 정보를 변수에 전역변수처름 쓰기위해 선언
	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue="${_csrf.token}"
	
	var itemPrice = 0;
	var itemTitle = "";
	var merchant_uid = "";
	var userNum = 1;
	
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
				dataType:"text",
				data: JSON.stringify({
					itemname : itemTitle,
					charge_price : itemPrice,
					merchant_uid : merchant_uid,
					user_num : userNum
				}),
				success:function(){
					alert(itemTitle + "결제완료!");
				}	
			});
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
	});
}

</script>			
</body>
</html>