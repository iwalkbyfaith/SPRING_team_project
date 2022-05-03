<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul id="free_novellist">
</ul>
<!-- 여기부터 댓글 비동기처리 자바스크립트 영역-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	var free_num = 17;
	function getAllList(){
		$.getJSON("/free/all/" + free_num , function(data){
			let str="";
			
			console.log(data.length);
			$(data).each(
				function(){
					str += "<div class='freeLi' data-free_num='" + this.free_num +"'><strong>@"
					+ this.writer + "</strong> - " + "<br>"
					+ "<div class='reply'>" + this.free_content + "</div>"
					+ "<button type='button' class='btn btn-info'>수정/삭제</button>"
					+"</div>";
				});
			$("#free_novellist").html(str);
			
			});
				}
	getAllList();
	
	
	

	</script>
</body>
</html>