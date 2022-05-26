<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    

<html lang="kor">
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

#modDiv{
 		width : 300px;
	 	height : 100px;
	 	background-color : windowframe;
	 	position : absolute;
	 	top : 50%;
	 	left : 50%;
	 	margin-top : -50px;	/*height의 절반(음수) 중앙위치*/
	 	margin-left : -150px; /*width의 절반(음수) 중앙위치*/
	 	padding : 10px;
	 	z-index : 1000; /*무조건 1보다 클것*/
}
</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
	<nav class="navbar navbar-expand-sm   navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="#">홈 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              소설 선택
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="#">무료소설</a>
              <a class="dropdown-item" href="#">유료소설</a>
              </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자유게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">토너먼트</a>
          </li>
           <!-- <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Dropdown link
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="#">Link 1</a>
              <a class="dropdown-item" href="#">Link 2</a>
              <a class="dropdown-item" href="#">Link 3</a>
              <a class="dropdown-item" href="#">Link 4</a>
              <a class="dropdown-item" href="#">Link 5</a>
              <a class="dropdown-item" href="#">Link 6</a>
            </div>
          </li> -->
          </ul>
          <div class="social-part">
            <i class="fa fa-facebook" aria-hidden="true"></i>
            <i class="fa fa-twitter" aria-hidden="true"></i>
            <i class="fa fa-instagram" aria-hidden="true"></i>
          </div>
        </div>
      </nav>
	</div>
	<div class="container">
	${novel}
	<hr>
	<p><sec:authentication property="principal.user" /></p>
	<sec:authentication property="principal.user" var="user"/>
	
	유저아이디 :  ${user.user_id }
	<hr>
		<h1 class="text text-info">${novel.novel_title }</h1>
		<div class="row">
			<div class="col-md-1">소제목</div>
			<div class="col-md-4">
				<input type="text" id="pTitle1" class="form-control" value="${novel.paid_title }" readonly>
			</div>
			<div class="col-md-1">글쓴이</div>
			<div class="col-md-2">
				<input type="text" class="form-control" value="${novel.novel_writer }" readonly>
			</div>
			<div class="col-md-1">조회수</div>
			<div class="col-md-1">
				<input type="text" class="form-control" value="${novel.paid_hit }" readonly>
			</div>
			<div class="col-md-1">추천</div>
			<div class="col-md-1">
				<input type="text" class="form-control" value="${novel.paid_rec }" readonly>
			</div>
		</div>
	
		<div class="row">
			<div class="col-md-1">작성일</div>
			<div class="col-md-3">
				<input type="text" class="form-control" value="${novel.paid_rdate }" readonly>
			</div>
			<div class="col-md-1">수정일</div>
			<div class="col-md-3">
				<input type="text" class="form-control" value="${novel.paid_mdate}" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1">장르</div>
			<div class="col-md-3">
				<input type="text" class="form-control" value="${novel.novel_category}" readonly>
			</div>
			<div class="col-md-1">회차</div>
			<div class="col-md-1">
				<input type="text" class="form-control" value="${novel.paid_snum }" readonly>
			</div>
			<div class="col-md-1">가격</div>
			<div class="col-md-1">
				<input type="text" class="form-control" value="${novel.paid_price }" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1">
				<a href="/paid/List/${novel.novel_num }" class="btn-sm">목록</a>
			</div>
			<div class="col-md-1">
				<button type="button">선호</button>
			</div>
			<div class="col-md-1">
				<c:if test="${user.user_id eq novel.user_id}">
					<form action="/paid/updateS" method="POST">
						<input type="hidden" name="paid_num" value="${novel.paid_num}">
						<input type="hidden" name="novel_num" value="${novel.novel_num}">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="submit" value="수정" class="btn-sm">
					</form>
				</c:if>
			</div>
			<div class="col-md-1">
				<c:if test="${user.user_id eq novel.user_id}">
					<form action="/paid/DeleteS" method="POST">
						<input type="hidden" name="paid_snum" value="${novel.paid_snum}">
						<input type="hidden" name="novel_num" value="${novel.novel_num}">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="submit" value="삭제" class="btn-sm">
					</form>
				</c:if>
			</div>
		</div>
		<hr>
		<div class="container2">
			
			<!-- 본문내용공간 -->
			<ul id="Pcon">
			
			</ul>
			
			
			
			
	<div>
		<div class="box-header">
			<h2 class="text-primary">댓글</h2>
		</div><!-- header -->
		<div class="box-body">
			<strong>Writer : </strong>
			<input type="text" id="newReplyWriter" placeholder="글쓴이" class="from-control">
			<strong>ReplyText : </strong>
			<input type="text" id="newReplyText" placeholder="댓글내용" class="from-control">
			<button type="button" class= "btn btn-success" id="replyAddBtn">댓글 추가</button>
		</div><!-- body -->
	</div>
	
	<!-- 댓글추가공간 -->
	<ul id="replies">
		<!-- 비어있는 ul -->
	</ul>
	
	<!-- mod -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="reply">
		</div>
		<div>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div> 
	
		</div><!-- container2 -->
	</div><!-- container -->
	
	
	<script type="text/javascript">
		var paidnum = ${novel.paid_num}
		var novelNum = ${novel.novel_num}
		
		var csrfHeaderName = "${_csrf.headerName}"
		var csrfTokenValue="${_csrf.token}"
		
		
		
		function getContent(){ // ■ 해당 소설의 상세 본문 가져오기
			
			var url = "/paid/" + paidnum;
			
			$.getJSON(url, function(data){
				
				var str = "";
				
				$(data).each(function(){
					
					str+= "<textarea class='form-control' readonly>"+this.paid_content1 + this.paid_content2 + "</textarea>"
					
				});
			
				$("#Pcon").html(str);
			});
		}
		getContent();
		
		
		function getAllList(){
			
			$.getJSON("/preplies/all/" + novelNum + "/" + paidnum, function(data){
		
				var str= "";
				
				$(data).each(function(){
					let timestamp = this.prepl_rdate; 
					let date = new Date(timestamp);
					
					let formattedTime = "게시일 : " + date.getFullYear() 
										+ "년" + (date.getMonth()+1) 
										+ "월" + date.getDate() + "일" 
										+ "-" + date.getHours()
										+ ":" + date.getMinutes()
										+ ":" + date.getSeconds();
				
					str += "<div class='replyLi' data-prepl_num='" + this.prepl_num + "'><strong>@"
						+ this.prepl_writer + "</strong> - " + formattedTime + "<br>"
						+ "<div class='reply'>" + this.prepl_content + "</div>"
						+ "<button type='button' class='btn btn-info'>수정/삭제</button>"
						+ "</div>";
					});
				$("#replies").html(str);
			});
		}
		getAllList();
		
		
		// 댓글 추가
		$('#replyAddBtn').on("click",function(){
			
			var preplWriter = $("#newReplyWriter").val();
			var preplContent = $("#newReplyText").val();
			
			console.log(novelNum);
			console.log(paidnum);
			console.log(preplWriter);
			console.log(preplContent);
			$.ajax({
				type : 'post',
				url : '/preplies',
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					novel_num : novelNum,
					paid_pnum : paidnum,
					prepl_writer : preplWriter,
					prepl_content : preplContent
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("댓글이 등록 되었습니다.");
						getAllList(); // 댓글 등록 성공시, 다시 목록 갱신
						// 폼 태그 비우기.
						$("#newReplyWriter").val("");
						$("#newReplyText").val("");
					}
				}
			});
		});
		
		
		// 이벤트 위임
		$("#replies").on("click", ".replyLi button", function(){
			
			var replytag = $(this).parent();
			
			// 형제 태그 .reply의 내용을 대신 가져올수있도록
			// 변수 replyContent에 선언해 거기에 저장해주세요. 
			// (hint : .siblings("요소명"); 으로 형제태그를 가져올수있습니다
			//var replyContent = $(this).prev().text();// button의 직전 태그인 .reply의 내용물 가져오기
			var replyContent = $(this).siblings(".reply").text(); // button의 형제 중 .reply의 내용물 가져오기
			//var replyContent = $(this).parent().children(".reply").text(); 
			
			var preplNum = replytag.attr("data-prepl_num");
			var reply = replytag.text();
		
			$(".modal-title").html(preplNum); // modal-title 부분에 글번호 입력 
			$("#reply").val(replyContent);  // reply 영역에 리플내용을 기입(수정삭제)
			$("#modDiv").show("slow"); // modal 열림
		});
			
		// 모달창 닫기
		$("#closeBtn").on("click",function(){ // #close버튼 클릭시
			$("#modDiv").hide("slow"); //#modDiv를 닫습니다.
		});
		
		// 삭제
		$("#replyDelBtn").on("click", function(){
			var preplNum = $(".modal-title").html();
			$.ajax({
				type : 'delete',
				url : '/preplies/' + preplNum,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				header : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert("댓글이 삭제되었습니다.");
						$("#modDiv").hide("slow");
						getAllList(); 
					}
				}
			});
		});
		
		// 수정
		$("#replyModBtn").on("click", function(){
			var preplNum = $(".modal-title").html();
			var reply = $("#reply").val();
			
			$.ajax({
				type : 'patch', 
				url : '/preplies/' + preplNum,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "PATCH" 
				},
				contentType : "application/json",
				data : JSON.stringify({
					prepl_content:reply,
					prepl_num:preplNum
				}),
				dataType : 'text',
				success : function(result){
					console.log("result : " + result);
					if(result == 'SUCCESS'){
						alert("수정 되었습니다.");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});
		});
	</script>
	<div class="footer">
	
	</div>
</body>
</html>