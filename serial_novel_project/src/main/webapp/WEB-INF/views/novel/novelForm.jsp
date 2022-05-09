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
		<h2>소설 등록</h2>
	</div>
	<div id="container">
		<form action="/novel/novelInsert" method="POST">
			<input type="text" name="novel_title" placeholder="제목"><br>
			<input type="text" name="novel_writer" placeholder="작가"><br>
			<input type="number" name="novel_tsnum" placeholder="총 회차"><br>
			<input type="text" name="novel_category" placeholder="장르"><br>
			<label><input type="radio" name="novel_week" value="Mon">월</label>
			<label><input type="radio" name="novel_week" value="Tue">화</label>
			<label><input type="radio" name="novel_week" value="Wen">수</label>
			<label><input type="radio" name="novel_week" value="Thu">목</label>
			<label><input type="radio" name="novel_week" value="Fri">금</label>
			<label><input type="radio" name="novel_week" value="Sat">토</label>
			<label><input type="radio" name="novel_week" value="Free">자유</label><br>
			<input type="submit" value="작성"><input type="reset" value="초기화">
		</form>
	</div>
	<div id="footer">
	
	</div>
</body>
</html>