<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/boardInsert" method="post">
		<input type="text" name="free_board_title" placeholder="글제목"/>
		<input type="text" name="free_board_writer" placeholder="글쓴이"/><br/>
		<textarea rows="20" cols="100" name="free_board_content" placeholder="글내용"></textarea>
		<input type="submit" value="작성완료"/>
	</form>
</body>
</html>