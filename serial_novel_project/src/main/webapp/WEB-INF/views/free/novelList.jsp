<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#headerLi{
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
<li id="headerLi">판타지</li>
<li id="headerLi">무협지</li>
<li id="headerLi">로맨스</li>
<li id="headerLi">추리</li>
</ul>
</div>

<br/>
<div class="container">
<br/>
<div>
<ul id="fantasynovellist">
</ul>

</div>
<br/>
<div>
<ul id="romancenovellist">
</ul>

</div>
<br/>
<div>
<ul id="wuxianovellist">
</ul>

</div>

<div id="modDiv" style="display:none;">
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
				
				str += "<div class='fantasyLi' data-novel_num='" + this.novel_num + "'>" + 
				this.novel_title + "</div>";

			});
			
			$("#fantasynovellist").html(str);
		});
		
	}
	function getRomanceList(){
		  var novelCategory = "romance";
		
		$.getJSON("/free/novel/"+ novelCategory , function(data){
				
							
			let str = "";
			console.log(data);
			
			$(data).each(
					function(){
						
						str += "<div class='romanceLi' data-novel_num='" + this.novel_num + "'>" + 
						this.novel_title + "</div>";

					});
			
			$("#romancenovellist").html(str);
		});
		
	}
	function getWuxiaList(){
		  var novelCategory = "wuxia";
		
		$.getJSON("/free/novel/"+ novelCategory , function(data){
				
							
			let str = "";
			console.log(data);
			
			$(data).each(
					function(){
						
						str += "<div class='wuxiaLi' data-novel_num='" + this.novel_num + "'>" + 
						this.novel_title + "</div>";

					});
			
			$("#wuxianovellist").html(str);
		});
		
	}
	
$(".fantasyLi").on("click", function(){
	getFantasyList();	

});

$("#romancenovellist").on("click", function(){
	getRomanceList();	

});

$("#wuxianovellist").on("click", function(){
	getWuxiaList();
});

    
  	
	
getFantasyList();
getRomanceList();
getWuxiaList();
	
	
		
		
		
	</script>
	
	
	
	


</body>
</html>