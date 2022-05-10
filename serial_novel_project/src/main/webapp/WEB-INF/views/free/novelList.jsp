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
#headerfLi,#headerwLi,#headerrLi,#headerdLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	font-size:30px;
	outline:solid 1px;
}
.fantasyLi , .romanceLi , .wuxiaLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	outline:solid 1px;
 
}
	
	</style>
  <title>Navbar</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
</head>
  <body>

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
  <div class="header">
<ul>
<li id="headerfLi">판타지</li>
<li id="headerwLi">무협지</li>
<li id="headerrLi">로맨스</li>
<li id="headerdLi">추리</li>
</ul>
</div>

<br/>
<div class="container">
<br/>
<div>
<ul id="novellist">
</ul>
</div>
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


</div>
<div class="footer"></div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});
function getFantasyList(){
	  var novelCategory = "fantasy";
	
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
function getRomanceList(){
	  var novelCategory = "romance";
	
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
function getWuxiaList(){
	  var novelCategory = "wuxia";
	
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


$("#headerfLi").on("click",function(){


	$("#novellist").empty();
	$(".table").hide();

getFantasyList();
});

$("#headerrLi").on("click",function(){

	$("#novellist").empty();
	$(".table").hide();

getRomanceList();
});

$("#headerwLi").on("click",function(){

$("#novellist").empty();
$(".table").hide();

getWuxiaList();
	
});

$("#novellist").on("click",".fantasyLi", function(){
var novelNum = $(this).attr("data-novelNum");
console.log(novelNum);

	$("#novellist").empty();
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
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
	
});
$("#novellist").on("click",".romanceLi", function(){
var novelNum = $(this).attr("data-novelNum");
console.log(novelNum);

	$("#novellist").empty();
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
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
	
});
$("#novellist").on("click",".wuxiaLi", function(){
var novelNum = $(this).attr("data-novelNum");
console.log(novelNum);

	$("#novellist").empty();
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
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
	
});

$(".tbody").on("click",".title",function(){
var freeSNum =  $(this).attr("data-freeSNum");
console.log(freeSNum);
var novelNum =  $(this).attr("data-novelNum");
console.log(novelNum);
$("#novellist").empty();
$(".table").hide();

var url = "/free/novel/detail/"+ freeSNum +"/"+novelNum;
console.log(url);
$.getJSON(url, function(data){
	
	
	let str = "";
	console.log(data);
	
	$(data).each(
			function(){
				str+= "<h1>내용 : "+this.free_content+"<h1/>"
				
				$(".test").html(str);
			});
});

$(".test").show("slow");
});
getFantasyList();

</script>
      
</body>
</html>