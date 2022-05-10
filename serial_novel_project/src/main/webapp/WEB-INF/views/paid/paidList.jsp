<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
	
	</div>
	<div class="container">
		
			
			<ul id="paidList"></ul>
		
		<script>
		function getPaidList(){
			
			$.getJSON("/paid/allList", function(data){
		
				var str= "";
				
				$(data).each(function(){
				
					str += "<li>" + this.paid_title + "</li>";
					});
				$("#paidList").html(str);
			});
		}
		getPaidList();
		</script>
	</div>
	<div class="footer">
	
	</div>
</body>
</html>