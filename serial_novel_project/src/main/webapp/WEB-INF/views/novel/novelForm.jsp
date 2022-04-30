<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/novel/novelInsert" method="POST">
		<input type="text" name="novel_title" placeholder="제목">
		<input type="text" name="novel_writer" placeholder="작가"><br>
		<input type="number" name="novel_tsnum" placeholder="총 회차"><br>
		<input type="text" name="novel_category" placeholder="장르"><br>
		<input type="text" name="novel_week" placeholder="연재 요일"><br>
		<input type="submit" value="작성"><input type="reset" value="초기화">
	</form>
</body>
</html>