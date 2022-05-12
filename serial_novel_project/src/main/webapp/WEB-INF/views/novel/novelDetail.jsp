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
	<h1>${novel.novel_title } 상세정보</h1>
	<div id=container>
		제목 <input type="text" value="${novel.novel_title }" readonly><br>
		작가 <input type="text" value="${novel.novel_writer }" readonly><br>
		회차 <input type="number" value="${novel.novel_tsnum }" readonly><br>
		장르 <input type="text" value="${novel.novel_category}" readonly><br>		
		연재요일 <input type="text" value="${novel.novel_week }" readonly><br>	
		연재유무 <input type="text" value="${novel.novel_end eq true ? '연재중' : '완결'}" readonly><br>	
			<a href="/novel/allList?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}">목록</a>
	
			<form action="/novel/novelDelete" method="post">
				<input type="hidden" name="novel_num" value="${novel.novel_num }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="searchType" value="${param.searchType }">
				<input type="hidden" name="keyword" value="${param.keyword }">
				<input type="submit" value="삭제">
			</form>
			
			<form action="/novel/novelUpdateForm" method="post">
				<input type="hidden" name="novel_num" value="${novel.novel_num }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="searchType" value="${param.searchType }">
				<input type="hidden" name="keyword" value="${param.keyword }">
				<input type="submit" value="수정">
			</form>
			
	
		
			
	</div>
</body>
</html>