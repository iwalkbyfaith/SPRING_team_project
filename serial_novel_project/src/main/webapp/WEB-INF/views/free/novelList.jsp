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
<div class="container">
  <div class="categoryheader" style="display:show;">
<ul>
<li id="headerfLi">판타지</li>
<li id="headerwLi">무협지</li>
<li id="headerrLi">로맨스</li>
<li id="headermLi">미스터리</li>
</ul>
</div>


<br/>
<br/>
<br/>
<div>
<ul id="novellist">
</ul>
</div>
<br/>
<div class="series" style="display:none;">
</div>
<div class="List" style="display:none;">
</div>

<div class="writebtn" style="display:none;">
</div>
<br/>
<br/>
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
<div class='test' style="display:none;">
</div>
<div id="modDiv" style="display:none;">
<div class="modal-title"></div>
</div>
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
				<table  style="padding-top:50px; display:none;" align = center width=700 border=0 cellpadding=2 class="work">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <td>작성자</td>
                        <td id="nWriter"></td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td id="nTitle"></td>
                        </tr>
                        
                        <tr>
                        <td>회차제목</td>
                        <td>
                        <textarea class="fTitle" style="width: 100%; height: 2.0em; resize: none;"></textarea>
                        </td>
                        </tr>
                        
                        <tr>
                        <td>n회차</td>
                        <td>
                        <input class="fSNum" type="number" min="1">
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
 						<td>
 						<button class="nCancel">취소</button><button class="nSubmit">등록</button>
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
	// 판타지 카테고리 리스트 가져오기.
function getFantasyList(){
	  var novelCategory = "fantasy";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
			
			str += "<div class='fantasyLi' data-novelNum='" + this.novel_num + "'>" + 
			this.novel_title + "</div>";

		});
		
		$("#novellist").html(str);
	});
	
}
	//로맨스 카테고리 리스트 가져오기.
function getRomanceList(){
	  var novelCategory = "romance";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
		
		
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='romanceLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
	//무협지 카테고리 리스트 가져오기.
function getWuxiaList(){
	  var novelCategory = "wuxia";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='wuxiaLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
	//미스터리 카테고리 리스트 가져오기.
function getMysteryList(){
	  var novelCategory = "mystery";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='mysteryLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}


$("#headerfLi").on("click",function(){

	
	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getFantasyList();
});

$("#headerrLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getRomanceList();
});

$("#headerwLi").on("click",function(){

$("#novellist").empty();
$(".content").hide();
$(".table").hide();

getWuxiaList();
	
});
$("#headermLi").on("click",function(){

$("#novellist").empty();
$(".content").hide();
$(".table").hide();

getMysteryList();
	
});

$("#novellist").on("click",".fantasyLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "fantasy";
console.log(novelNum);

	$("#novellist").empty();
	
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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

$("#novellist").on("click",".romanceLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "romance";
console.log(novelNum);

	$("#novellist").empty();
	
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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
$("#novellist").on("click",".wuxiaLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "wuxia";
console.log(novelNum);

	$("#novellist").empty();
		
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 ="";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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
$("#novellist").on("click",".mysteryLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "mystery";
console.log(novelNum);

	$("#novellist").empty();
		
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 ="";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
	$(".writebtn").html(str1);
	$(".List").html(str2);
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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

$(".tbody").on("click",".title",function(){
var freeSNum =  $(this).attr("data-freeSNum");
console.log(freeSNum);
var novelNum =  $(this).attr("data-novelNum");
console.log(novelNum);
$("#novellist").empty();
$(".content").hide();
$(".table").hide();
$(".writebtn").hide();

var url = "/free/novel/detail/"+ freeSNum +"/"+novelNum;
console.log(url);
$.getJSON(url, function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 =	"";
	let str3 =	"";
	let str4 =	"";
	let str5 =	"";
	
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp = this.free_rdate;
				let date = new Date(timestamp);
				let formattedTime = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
				
				str2+= "<p>작가 :"+ this.novel_writer +"</p>";
				str3+= "<p>작성일 : " + formattedTime + "</p>"; 
				str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
				str5+= "<h2>제목 :"+ this.novel_title+"</h2>";
				str+= "<h4>내용 : "+this.free_content+"</h4>";
				str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+this.novel_category+"'>회차목록</button>";
				
				$(".articleWriter").html(str2);
				$(".articleDate").html(str3);
				$(".articleHit").html(str4);
				$(".articleTitle").html(str5);
				$(".articleContent").html(str);
				$(".series").html(str1);
			});
});

$(".content").show("slow");
$(".series").show("slow");
});
$(".List").on("click",".novelList",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	
var novelCategory = $(this).attr("data-novelCategory");
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
			
			str += "<div class='"+novelCategory+"Li' data-novelNum='" + this.novel_num + "'>" + 
			this.novel_title + "</div>";

		});
		
		$("#novellist").html(str);
	});
	
		
	});
$(".series").on("click",".novelSeries",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	
	var novelNum = $(this).attr("data-novelNum");
	var novelCategory = $(this).attr("data-novelCategory");
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/free/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.free_rdate;
					let timestamp2 = this.free_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					
					str+= "<tr><td>"+this.free_snum+"</td>"
						+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						
					console.log(this);
						
					str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
					str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
					
					$(".tbody").html(str);
					$(".writebtn").html(str1);
					$(".List").html(str2);
	});
	});
		$(".table").show("slow");
		$(".writebtn").show("slow");
		$(".List").show("slow");
	});
$(".writebtn").on("click",".writenovelbtn",function(){
	
	var novelNum = $(this).attr("data-novelNum");
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
		$(data).each(
				function(){
					let str1="";
					let str2="";
					
					str1+="<strong>"+this.novel_writer+"</strong>"
					str2+="<strong>"+this.novel_title+"</strong>"
					
					$("#nWriter").html(str1);
					$("#nTitle").html(str2);
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

$(".nSubmit").on("click",function(){
	var csrfHeaderName ="${_csrf.headerName}";
	var csrfTokenValue ="${_csrf.token}";
	
	var novelNum =$(this).attr("novelNum");
	var freeSNum = $(".fSNum").val();
	var freeTitle = $(".fTitle").val();
	var freecontent1 = $(".contents1").val();
	var freecontent2 = $(".contents2").val();
	$.ajax({
		type : 'post',
		url: '/free',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		header:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			novel_num : novelNum,
			free_snum : freeSNum,
			free_title : freeTitle,
			free_content1 : freecontent1,
			free_content2 : freecontent2
		}),
		success : function(result){
			if(result == 'SUCCESS'){
				alert("등록 되었습니다.");
				$(".fSNum").val(null);
				$(".fTitle").val(null);
				$(".contents1").val(null);
				$(".contents2").val(null);
			}
		}
		});
	
});

		
	
getFantasyList();

</script>
      
</body>
</html>