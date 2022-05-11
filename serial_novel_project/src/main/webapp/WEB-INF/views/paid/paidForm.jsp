<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header">
	
	</div>
	<div id="container">
		<form action="/paid/Insert" method="POST">
			<input type="text" name="novel_num" placeholder="소설 번호"><br>
			<input type="text" name="paid_title" placeholder="소제목"><br>
			<input type="text" name="paid_snum" placeholder="회차"><br>
			<input type="text" name="paid_content" placeholder="내용"><br>
			<input type="submit" value="작성"><input type="reset" value="초기화">
		</form>
	</div>
	<div id="footer">
	
	</div>
</body>
</html>