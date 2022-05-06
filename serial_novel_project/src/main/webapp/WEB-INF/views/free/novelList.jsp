<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>	
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="header"></div>
<div class="container">
<ul id="freenovellist">
</ul>
</div>
<div class="footer"></div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


	<script>

		
function getFantasyList(){
		
		$.getJSON("/free/novel"+ novel_category , function(data){
			
			var novel_category="판타지";
			let str = "";
			console.log(data);
			
			$(data).each(
					function(){
				
				str += "<li>" + this.novel_title + "</li>";

			});
			
			$("#freenovellist").html(str);
		});
		
	}
	
	getFantasyList();
		
		
		
	</script>
	
	
	
	


</body>
</html>