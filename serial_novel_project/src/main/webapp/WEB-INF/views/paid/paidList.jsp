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
  <title>무료 소설</title>
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

<!-- ■ 요일별 소설 분류 -->
<div class="container">
 <div class="weekheader" style="display:show;">
	<ul>
		<li id="headerMonLi">월요일</li>
		<li id="headerTueLi">화요일</li>
		<li id="headerWenLi">수요일</li>
		<li id="headerThuLi">목요일</li>
		<li id="headerFriLi">금요일</li>
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
<!-- ■ 읽고있던 카테고리-소설 삭제 버튼-->
<div class="delete" style="display:none;">
</div>
<!-- ■ 읽고있던 소설 수정 버튼-->
<div class="update" style="display:none;">
</div>
<!-- ■ 해당 카테고리에 해당 소설에 대한 글쓰기 (추후에 소설작가만 글쓰기 버튼을 볼수 있도록 설정할 예정) -->
<div class="writebtn" style="display:none;">
</div>
<br/>
<br/>
<!-- ■ 위에 (id="novelList")안에 들어온 리스트를 클릭시 넘어오는 게시판 형식의 해당 소설 회차목록 -->
<table class="table" style="display:none;">
  <thead class="table-dark">
	   <tr>
		   <th>글번호</th>
		   <th>글제목</th>
		   <th>글쓴이</th>
		   <th>게시일</th>
		   <th>최종수정날짜</th>
	   </tr>
  </thead>
 <tbody class="tbody">
   	
  </tbody>
</table>

<!-- ■ 위의 class="table" 내부에서 글제목 클릭시 넘어오는 해당 카테고리 소설의 n회차 디테일 페이지 (작가,게시일,소제목,내용등등 정보가 들어있음)  -->
<div class="content" style="display:none;">
<div class="section-area-viewer">
	
	<div class="articleInfo">
		
		<div class="articleWriter"></div>
		<div class="articleDate"></div>
		<div class="articleHit"><strong>조회: </strong>83	&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천:</strong> <span id="rec"></span></div>
		</div>
	<div class="articleMain">
	<div class="articleTitle"></div>
	<div class="articleContent"></div>
	</div>
</div>
</div>
				<!-- ■ 위의 class="writebtn"을 눌렀을때 나오게 되는 소설작성 페이지 (넘어오면서 novelNum을 가지고와서 기본적인 내용{작가,제목}은 받아옴.) -->
				<table  style="padding-top:50px; display:none;" align = center width=700 border=0 cellpadding=2 class="work">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <td>작가</td>
                        <td id="nWriter"></td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td id="nTitle"></td>
                        </tr>
                        
                        <tr>
                        <td>회차제목</td>
                        <td>
                        <textarea class="pTitle" style="width: 100%; height: 2.0em; resize: none;"></textarea>
                        </td>
                        </tr>
                        
                        <tr>
                        <td>n회차</td>
                        <td>
                        <input class="pSNum" type="number" min="1" value="">
                        </td>
                        </tr>
 						
 						<tr>
                        <td>가격</td>
                        <td>
                        <input class="pPrice" type="number" min="100" value="">
                        </td>
                        </tr>
                        
                        <tr>
                        <td>내용1</td>
                        <td>
                        <textarea class="contents1" onKeyUp="javascript:fnChkByte1(this,'4000')" style="width: 100%; height: 6.25em; resize: none;"></textarea>
						<span id="byteInfo1">0</span> /4000bytes
                        
                        </td>
                        </tr>
                        <tr>
                        <td>내용2</td>
                        <td>
                        <textarea class="contents2" onKeyUp="javascript:fnChkByte2(this,'4000')" style="width: 100%; height: 6.25em; resize: none;"></textarea>
						<span id="byteInfo2">0</span> /4000bytes
                        
                        </td>
                        </tr>
 						
 						<tr>
 						<td id="nBtn">
 						
 						</td>
 						</tr>
                        
                     </table>
 
                </td>
                </tr>
        </table>







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
					
					str += "<div class='monLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
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
					
					str += "<div class='monLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
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
					
					str += "<div class='monLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
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
					
					str += "<div class='monLi' data-novelNum='" + this.novel_num + "' data-paidNum='"+this.paid_num +"'>" + 
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

// ■ 월요일의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌 
$("#novellist").on("click",".monLi", function(){
var novelNum = $(this).attr("data-novelNum");
var paidNum = $(this).attr("data-paidNum");
var novelWeek = "Mon";
console.log(novelNum);

	$("#novellist").empty();
	
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.paid_rdate;
				let timestamp2 = this.paid_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.paid_snum+"</td>"
				+ "<td><a href = '/paid/detail/" + (novelNum) + "/" + (paidNum) + "'>" + this.novel_title+ "</a></td>" 
				+ "<td>"+this.novel_writer+"</td>"
				+ "<td>"+formattedTime1+"</td>"
				+ "<td>"+formattedTime2+"</td></tr>"
				
				
				$(".tbody").html(str);
	
		});
});
	$(".table").show("slow");
	$(".writebtn").show("slow");
	$(".List").show("slow");
});

//■ 화요일의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".tueLi", function(){
var novelNum = $(this).attr("data-novelNum");
var paidNum = $(this).attr("data-paidNum");
var novelWeek = "Tue";
console.log(novelNum);

	$("#novellist").empty();
	
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.paid_rdate;
				let timestamp2 = this.paid_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.paid_snum+"</td>"
				+ "<td><a href = '/paid/detail/" + (novelNum) + "/" + (paidNum) + "'>" + this.novel_title+ "</a></td>" 
				+ "<td>"+this.novel_writer+"</td>"
				+ "<td>"+formattedTime1+"</td>"
				+ "<td>"+formattedTime2+"</td></tr>"
				
				
				$(".tbody").html(str);
				
});		
});
	$(".table").show("slow");
	$(".writebtn").show("slow");
	$(".List").show("slow");
	
});

//■ 수요일의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".wenLi", function(){
var novelNum = $(this).attr("data-novelNum");
var paidNum = $(this).attr("data-paidNum");
var novelWeek = "Wen";
console.log(novelNum);

	$("#novellist").empty();
		
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 ="";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.paid_rdate;
				let timestamp2 = this.paid_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.paid_snum+"</td>"
				+ "<td><a href = '/paid/detail/" + (novelNum) + "/" + (paidNum) + "'>" + this.novel_title+ "</a></td>" 
				+ "<td>"+this.novel_writer+"</td>"
				+ "<td>"+formattedTime1+"</td>"
				+ "<td>"+formattedTime2+"</td></tr>"
					
				console.log(this);
					
				
				$(".tbody").html(str);
});
});
	$(".table").show("slow");
	$(".writebtn").show("slow");
	$(".List").show("slow");
});

//■ 목요일의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".thuLi", function(){
	var novelNum = $(this).attr("data-novelNum");
	var paidNum = $(this).attr("data-paidNum");
	var novelWeek = "Thu";
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
		$(".writebtn").html(str1);
		$(".List").html(str2);
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.paid_rdate;
					let timestamp2 = this.paid_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					
					str+= "<tr><td>"+this.paid_snum+"</td>"
					+ "<td><a href = '/paid/detail/" + (novelNum) + "/" + (paidNum) + "'>" + this.novel_title+ "</a></td>" 
					+ "<td>"+this.novel_writer+"</td>"
					+ "<td>"+formattedTime1+"</td>"
					+ "<td>"+formattedTime2+"</td></tr>"
						
					console.log(this);
						
					
					$(".tbody").html(str);
		});
	});
		$(".table").show("slow");
		$(".writebtn").show("slow");
		$(".List").show("slow");
	});

//■ 금요일의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".friLi", function(){
	var novelNum = $(this).attr("data-novelNum");
	var paidNum = $(this).attr("data-paidNum");
	var novelWeek = "Fri";
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
		$(".writebtn").html(str1);
		$(".List").html(str2);
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.paid_rdate;
					let timestamp2 = this.paid_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					
					str+= "<tr><td>"+this.paid_snum+"</td>"
						+ "<td><a href = '/paid/detail/" + (novelNum) + "/" + (paidNum) + "'>" + this.novel_title+ "</a></td>" 
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						
					console.log(this);
						
					
					$(".tbody").html(str);
			});
		});
		$(".table").show("slow");
		$(".writebtn").show("slow");
		$(".List").show("slow");
	});
	
// ■ 글목록 버튼을 누르면 보고있던 카테고리에 해당하는 글목록을 보여줌
$(".List").on("click",".novelList",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	
var novelWeek = $(this).attr("data-novelWeek");
	
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
			
			str += "<div class='"+novelWeek+"Li' data-novelNum='" + this.novel_num + "'>" + 
			this.novel_title + "</div>";

		});
		
		$("#novellist").html(str);
	});
	$(".weekheader").show();
		
	});
	
// ■ 회차목록을 누르게되면 보고있던 작품의 회차목록을 보여줌
$(".series").on("click",".novelSeries",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".update").hide();
	$(".delete").hide();
	
	var novelNum = $(this).attr("data-novelNum");
	var novelWeek = $(this).attr("data-novelWeek");
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"' data-novelWeek='"+novelWeek+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.paid_rdate;
					let timestamp2 = this.paid_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					
					str+= "<tr><td>"+this.paid_snum+"</td>"
						+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.paid_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						
					console.log(this);
						
					
					
					$(".tbody").html(str);
					$(".writebtn").html(str1);
					$(".List").html(str2);
	});
	});
		$(".table").show("slow");
		$(".writebtn").show("slow");
		$(".List").show("slow");
		
	});
// ■ 글쓰기 버튼을 누르면 보고있던 작품의 정보를 받아서 작가,제목은 기입된채로 소설 쓰기창이 나옴 (추후에는 해당하는 작가만 보이게끔 만들예정) 
$(".writebtn").on("click",".writenovelbtn",function(){
	
	var novelNum = $(this).attr("data-novelNum");
	var novelWeek = $(this).attr("data-novelWeek");
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		$(data).each(
				function(){
					let str1="";
					let str2="";
					let str3="";
					
					
					str1+="<strong>"+this.novel_writer+"</strong>"
					str2+="<strong>"+this.novel_title+"</strong>"
					str3+=	"<button class='nCancel' data-novelNum='"+ novelNum +"' data-novelWeek='"+novelWeek+"'>취소</button><button class='nSubmit' data-novelNum='"+ novelNum +"' data-novelWeek='"+novelWeek+"'>등록</button>";
					
					$("#nWriter").html(str1);
					$("#nTitle").html(str2);
					$("#nBtn").html(str3);
		});		
	});
	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".work").show();
	$(".categoryheader").hide();
});

// ■ 소설글쓰기 창에서 등록버튼을 누르면 글이 써지고 해당 작품의 회차정보로 보내줌 
$("#nBtn").on("click",".nSubmit",function(){
	
	var csrfHeaderName = "${_csrf.headerName}"
	var csrfTokenValue="${_csrf.token}"
	
	var novelWeek = $(this).attr("data-novelWeek");
	var novelNum =$(this).attr("data-novelNum");
	var paidSNum = $(".pSNum").val();
	var paidTitle = $(".pTitle").val();
	var paidPirce = $(".pPrice").val();
	var content1 = $(".contents1").val();
	var content2 = $(".contents2").val();
	$.ajax({
		type : 'post',
		url: '/paid/insert',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			novel_num : novelNum,
			paid_snum : paidSNum,
			paid_title : paidTitle,
			paid_content1 : content1,
			paid_content2 : content2,
			paid_price : paidPirce
		}),
		success : function(result){
			if(result == 'SUCCESS'){
				$(".pSNum").val(null);
				$(".pTitle").val(null);
				$(".contents1").val(null);
				$(".contents2").val(null);
				$(".pPrice").val(null);
				alert("글이 등록 되었습니다.");// 여기까지가 글쓰기 로직
// ====================================================================================================================		
				
				// 여기부터 회차정보로 돌아가는 로직
				$("#novellist").empty();
				$(".work").hide();
				
				
				$.getJSON("/paid/novel/select/"+ novelNum , function(data){
				
				let str = "";
				let str1 = "";
				let str2 = "";
				str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelWeek='"+this.novel_week+"'>글쓰기</button>";
				str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
				$(".writebtn").html(str1);
				$(".List").html(str2);
				console.log(data);
				
				$(data).each(
						function(){
							let timestamp1 = this.paid_rdate;
							let timestamp2 = this.paid_mdate;
							let date1 = new Date(timestamp1);
							let date2 = new Date(timestamp2);
							
							let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
							let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
							
							str+= "<tr><td>"+this.paid_snum+"</td>"
								+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.paid_title+"</td>"
								+ "<td>"+this.novel_writer+"</td>"
								+ "<td>"+formattedTime1+"</td>"
								+ "<td>"+formattedTime2+"</td></tr>"
								console.log(this);
							
							
								
							
							$(".tbody").html(str);
				
			});
			});
				$(".table").show("slow");
				$(".writebtn").show("slow");
				$(".List").show("slow");	
				
				}
		} // success 끝나는부분
		}); // ajax 끝나는부분 
	
});

//■ 소설글쓰기 창에서 취소버튼을 누르면 해당 작품의 회차정보로 보내줌 
$("#nBtn").on("click",".nCancel",function(){
	var novelNum = $(this).attr("data-novelNum");
	var novelWeek = $(this).attr("data-novelWeek");
	console.log(novelNum);

		$("#novellist").empty();
		$(".work").hide();
		
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 = "";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelWeek='"+this.novel_week+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
		$(".writebtn").html(str1);
		$(".List").html(str2);
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.paid_rdate;
					let timestamp2 = this.paid_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					
					str+= "<tr><td>"+this.paid_snum+"</td>"
						+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.paid_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						console.log(this);
					
					
						
					
					$(".tbody").html(str);
		
	});
	});
		$(".table").show("slow");
		$(".writebtn").show("slow");
		$(".List").show("slow");
		

});

	
getMonList();

</script>
      
</body>
</html>