<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>    

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
	 	width : 1000px;
	 	height : 500px;
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
				<button type="button">구매</button>
			</div>
			<div class="col-md-1">
				<button type="button">선호</button>
			</div>
			<div class="col-md-1">
				<form action="/paid/updateS" method="POST">
					<input type="hidden" name="paid_num" value="${novel.paid_num}">
					<input type="hidden" name="novel_num" value="${novel.novel_num}">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<input type="submit" value="수정" class="btn-sm">
				</form>
			</div>
			<div class="col-md-1">
				<form action="/paid/DeleteS" method="POST">
					<input type="hidden" name="paid_snum" value="${novel.paid_snum}">
					<input type="hidden" name="novel_num" value="${novel.novel_num}">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<input type="submit" value="삭제" class="btn-sm">
				</form>
			</div>
		</div>
		<hr>
		<div class="container2">
			
			<ul id="Pcon">
			
			</ul>
			<!-- jquery cdn -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			
	<script type="text/javascript">
		var paidnum = ${novel.paid_num}
		
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
					
	</script>
		</div><!-- container2 -->
	</div><!-- container -->
	<div class="footer">
	
	</div>
</body>
</html>