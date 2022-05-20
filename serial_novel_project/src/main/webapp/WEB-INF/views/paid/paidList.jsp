<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


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
#headerMonLi,#headerTueLi,#headerWenLi,#headerThuLi,#headerFriLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	font-size:30px;
	outline:solid 1px;
}
.monLi , .tueLi , .wenLi, .thuLi, .friLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	outline:solid 1px;
}
.writebtn,.List,.series,.delete,.update{
float:right;
margin-right:10px;
}
.articleInfo{
float:right;

}
 .articleMain{
text-align:center;

} 
}
	
	</style>
  <title>유료 소설</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
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

<!-- ■ 요일별 소설 분류 -->
<div class="container">
 <div class="weekheader" style="display:show;">
	<ul>
		<li id="headerMonLi"><a href="/paid/Week/Mon">월요일</a></li>
		<li id="headerTueLi"><a href="/paid/Week/Tue">화요일</a></li>
		<li id="headerWenLi"><a href="/paid/Week/Wen">수요일</a></li>
		<li id="headerThuLi"><a href="/paid/Week/Thu">목요일</a></li>
		<li id="headerFriLi"><a href="/paid/Week/Fri">금요일</a></li>
	</ul>
</div>


<br/>
<br/>
<br/>
<!-- ■ 해당 카테고리(class="categoryheader"의 자식들)를 눌렀을때 나타낼 리스트 -->
<div>
	<ul id="novellist">
	</ul>
</div>
<br/>
<!-- ■ 읽고있던 카테고리-소설의 회차목록 바로가기 버튼-->
<div class="series" style="display:none;">
</div>
<!-- ■ 읽고있던 소설에 해당하는 카테고리 목록 바로가기 버튼-->
<div class="List" style="display:none;">
</div>

<br/>
<br/>



</div>

<div class="footer"></div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
// csrf 토큰 
var csrfHeaderName ="${_csrf.headerName}";
var csrfTokenValue ="${_csrf.token}";
// 글쓰기 로직 실행시 4000바이트 제한 거는 로직
function fnChkByte1(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 2;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo1').innerText = rbyte;
     }
}
//글쓰기 로직 실행시 4000바이트 제한 거는 로직
function fnChkByte2(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 2;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo2').innerText = rbyte;
     }
}

// 대충 CSS 긁어오면서 딸려온 로직.
$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});
	// ■ 월요일 리스트 가져오기.
function getMonList(){
	  var novelWeek = "Mon";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
					
		let str = "";
		
		$(data).each(
				function(){
			
			str += "<div class='monLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
			this.novel_title + "</div>";

		});
		
		$("#novellist").html(str);
	});
	
}
	// ■ 화요일 리스트 가져오기.
function getTueList(){
	  var novelWeek = "Tue";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
		
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='tueLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
	// ■ 수요일 리스트 가져오기.
function getWenList(){
	  var novelWeek = "Wen";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
				
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='wenLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
	// ■ 목요일 리스트 가져오기.
function getThuList(){
	  var novelWeek = "Thu";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
				
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='thuLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}

	// ■ 금요일 리스트 가져오기.
function getFriList(){
	  var novelWeek = "Fri";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
				
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='friLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
// ■ 월요일을 클릭시 판타지 카테로리의 소설 리스트를 보여줌
$("#headerMonLi").on("click",function(){

	
	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getMonList();
});
//■ 화요일 클릭시 로맨스 카테로리의 소설 리스트를 보여줌
$("#headerTueLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getTueList();
});
//■ 수요일을 클릭시 무협지 카테로리의 소설 리스트를 보여줌
$("#headerWenLi").on("click",function(){

$("#novellist").empty();
$(".content").hide();
$(".table").hide();

getWenList();
	
});
//■ 목요일 클릭시 미스터리 카테고리의 소설 리스트를 보여줌
$("#headerThuLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getThuList();
		
});

//■ 목요일 클릭시 미스터리 카테고리의 소설 리스트를 보여줌
$("#headerFriLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

	getFriList();
		
});

</script>
      
</body>
</html>