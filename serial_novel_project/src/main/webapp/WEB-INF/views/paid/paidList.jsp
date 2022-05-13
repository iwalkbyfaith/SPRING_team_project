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
.writebtn,.List,.series{
float:right;
margin-right:10px;
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
	<div class="viewer-header"></div>
	<div class="view-detail-content"></div>
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
                        <td><input type = text name = name size=20> </td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td><input type = text name = title size=60></td>
                        </tr>
 
                        <tr>
                        <td>내용</td>
                        <td>
                        <textarea name="contents" onKeyUp="javascript:fnChkByte(this,'4000')"></textarea>
						<span id="byteInfo">0</span> /4000bytes
                        
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
function fnChkByte(obj, maxByte)
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
        document.getElementById('byteInfo').innerText = rbyte;
     }
}

$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});
////////
function getMonList(){
	  var novelWeek = "Mon";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/paid/novel/"+ novelWeek , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
			
			str += "<div class='monLi' data-novelNum='" + this.novel_num + "'>" + 
			this.novel_title + "</div>";

		});
		
		$("#novellist").html(str);
	});
	
}
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
					
					str += "<div class='TueLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
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
					
					str += "<div class='wenLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}

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
					
					str += "<div class='thuLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}

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
					
					str += "<div class='friLi' data-novelNum='" + this.novel_num + "'>" + 
					this.novel_title + "</div>";

				});
		
		$("#novellist").html(str);
	});
	
}

//
$("#headerMonLi").on("click",function(){

	
	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getMonList();
});

$("#headerTueLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getTueList();
});

$("#headerWenLi").on("click",function(){

$("#novellist").empty();
$(".content").hide();
$(".table").hide();

getWenList();
	
});

$("#headerThuLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

	getThuList();
		
	});
	
$("#headerFriLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

	getFriList();
		
	});

$("#novellist").on("click",".monLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelWeek = "Mon";
console.log(novelNum);

	$("#novellist").empty();
	
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
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
					+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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


$("#novellist").on("click",".tueLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelWeek = "Tue";
console.log(novelNum);

	$("#novellist").empty();
	
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 = "";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
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
					+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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

$("#novellist").on("click",".wenLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelWeek = "Wen";
console.log(novelNum);

	$("#novellist").empty();
		
	
	$.getJSON("/paid/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 ="";
	let str2 = "";
	str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
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
					+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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

$("#novellist").on("click",".thuLi", function(){
	var novelNum = $(this).attr("data-novelNum");
	var novelWeek = "Thu";
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
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
						+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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

$("#novellist").on("click",".friLi", function(){
	var novelNum = $(this).attr("data-novelNum");
	var novelWeek = "Fri";
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
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
						+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
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
var paidSNum =  $(this).attr("data-paidSNum");

var novelNum =  $(this).attr("data-novelNum");
console.log(novelNum);
$("#novellist").empty();
$(".content").hide();
$(".table").hide();
$(".writebtn").hide();

var url = "/paid/novel/detail/"+ paidSNum +"/"+novelNum;
console.log(url);
$.getJSON(url, function(data){
	
	
	let str = "";
	let str1 = "";
	console.log(data);
	
	$(data).each(
			function(){
				str+= "<p>내용 : "+this.paid_content+"</p>"
				str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelWeek='"+this.novel_week+"'>회차목록</button>";
				$(".view-detail-content").html(str);
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
	
		
	});
	
$(".series").on("click",".novelSeries",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	
	var novelNum = $(this).attr("data-novelNum");
	var novelWeek = $(this).attr("data-novelWeek");
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/paid/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
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
						+ "<td class='title' data-paidSNum='"+this.paid_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						
					console.log(this);
						
					str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"'>글쓰기</button>";
					str2+= "<button class='novelList' data-novelWeek='"+novelWeek+"'>글목록</button>";
					
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
	
	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".work").show();
	$(".weekheader").hide();
	
});
		
	


</script>
      
</body>
</html>