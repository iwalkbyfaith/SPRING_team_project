<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<style>
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
	font-size:50px;
	outline:solid 1px;
}
.fantasyLi , .romanceLi , .wuxiaLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	outline:solid 1px;
 
}

</style>	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
<h1 class='test' style="display:none;">
</h1>
<div id="modDiv" style="display:none;">
<div class="modal-title"></div>
</div>

</div>
<div class="footer"></div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<script>
	
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
					str+= "<tr><td>"+this.free_snum+"</td>"
						+ "<td class='title'>"+this.novel_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+this.free_rdate+"</td>"
						+ "<td>"+this.free_mdate+"</td></tr>"
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
					str+= "<tr><td>"+this.free_snum+"</td>"
						+ "<td class='title'>"+this.novel_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+this.free_rdate+"</td>"
						+ "<td>"+this.free_mdate+"</td></tr>"
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
					str+= "<tr><td>"+this.free_snum+"</td>"
						+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.novel_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+this.free_rdate+"</td>"
						+ "<td>"+this.free_mdate+"</td></tr>"
					console.log(this);
					
					$(".tbody").html(str);
	});
	});
		$(".table").show("slow");
		
});

$(".title").on("click",function(){
	var freeSNum =  $(this).attr("data-freeSNum");
	var novelNum =  $(this).attr("data-novelNum");
	$("#novellist").empty();
	$(".table").hide();
	console.log(freeSNum);
	$.getJSON("/free/novel/detail/"+ freeSNum +novelNum, function(data){
		
		
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					str+= "내용 : "+this.free_content
					
					$(".test").html(str);
				});
	});
	
$(".test").show("slow");
});
getFantasyList();	
	</script>
	
	
	
	


</body>
</html>