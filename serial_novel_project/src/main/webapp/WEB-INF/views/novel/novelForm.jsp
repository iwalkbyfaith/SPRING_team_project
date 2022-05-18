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
			<input type="text" name="novel_title" placeholder="제목" required><br>
			<input type="text" name="novel_writer" placeholder="작가" required><br>
			<input type="number" name="novel_tsnum" placeholder="총 회차" required><br>
			
			<label><input type="radio" name="novel_category" value="fantasy" required>판타지</label>
			<label><input type="radio" name="novel_category" value="romance">로맨스</label>
			<label><input type="radio" name="novel_category" value="wuxia">무협지</label><br>
			
			
			<label><input type="radio" name="novel_week" value="Mon" required>월</label>
			<label><input type="radio" name="novel_week" value="Tue">화</label>
			<label><input type="radio" name="novel_week" value="Wen">수</label>
			<label><input type="radio" name="novel_week" value="Thu">목</label>
			<label><input type="radio" name="novel_week" value="Fri">금</label>
			<label><input type="radio" name="novel_week" value="Free">자유</label><br>
			<input type="submit" value="등록"><input type="reset" value="초기화">
		</form>
	</div>
	<div id="footer">
	
	</div>
</body>
</html>