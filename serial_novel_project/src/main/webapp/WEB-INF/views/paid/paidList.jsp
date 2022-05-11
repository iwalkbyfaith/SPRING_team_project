<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
	
	</div>
	<div class="container">
		<h1>유료</h1>
			<ul id="paidList"></ul>
		
	<!-- jquery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
		
		<script>
		function getAllList(){
			
			$.getJSON("/paid/allList", function(data){
		
				var str= "";
				
				console.log(data.length);
				
				$(data).each(function(){
				
					str += "<li>" + this.paid_title + "</li>";
					
					});
				
				console.log("str" + str);
				$("#paidList").html(str);
			});
		}
		getAllList();
		</script>
	</div>
	<div class="footer">
	
	</div>
</body>
</html>