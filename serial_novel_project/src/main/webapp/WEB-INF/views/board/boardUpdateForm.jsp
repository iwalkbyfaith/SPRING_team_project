<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board.free_board_num}번글 수정페이지 입니다.</h1>
	<form action="/board/boardUpdate" method="post">
		<input type="hidden" name="free_board_num" value="${board.free_board_num }"/>
		<input type="hidden" name="searchType" value="${param.searchType }"/>
		<input type="hidden" name="keyword" value="${param.keyword }"/>
		<input type="hidden" name="pageNum" value="${param.pageNum }"/>
		<input type="text" name="free_board_title" value="${board.free_board_title }"/>
		<input type="text" name="free_board_writer" value="${board.free_board_writer }"/><br/>
		<textarea rows="20" cols="100" name="free_board_content">${board.free_board_content }</textarea><br/>
		<input type="submit" value="수정"/>
	</form>
</body>
</html>