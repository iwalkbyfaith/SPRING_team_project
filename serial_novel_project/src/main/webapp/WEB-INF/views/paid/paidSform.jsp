<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1>${novel.novel_title} 소설 쓰기</h1>
	 
 	<form action="/board/boardInsert" method="POST">
 소설번호	<input type="text" value="${novel.novel_num }">
	제목	<input type="text" name="paid_title">
	작가 <input type="text" value="${novel.novel_writer }" readonly><br>
		<textarea rows="20" cols="50" name="paid_content1">내용</textarea><br>
		<textarea rows="20" cols="50" name="paid_content2">내용</textarea><br>
		<input id="submitBtn" type="submit" value="작성"><input type="reset" value="초기화">
	</form>
 
 
</body>
</html>