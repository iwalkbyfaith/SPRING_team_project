<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		회차 <input type="number" class="form-control" value="${novel.novel_tsnum }">	<br>
		장르 <input type="text" class="form-control" value="${novel.novel_category }"><br>		
		연재요일 <input type="text" class="form-control" value="${novel.novel_week }"><br>	
		연재유무 <input type="text" class="form-control" value="${novel.novel_end eq 0 ? '연재중' : '완결'}"><br>	
			<a href="/novel/novelList?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-info btn-sm">목록</a>
	
			<form action="/novel/novelDelete" method="post">
				<input type="hidden" name="novel_num" value="${novel.novel_num }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="searchType" value="${param.searchType }">
				<input type="hidden" name="keyword" value="${param.keyword }">
				<input type="submit" value="삭제" class="btn btn-danger btn-sm">
			</form>
			
			<form action="/novel/novelUpdateForm" method="post">
				<input type="hidden" name="novel_num" value="${novel.novel_num }">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="searchType" value="${param.searchType }">
				<input type="hidden" name="keyword" value="${param.keyword }">
				<input type="submit" value="수정" class="btn btn-warning btn-sm">
			</form>
			
	
		
			
	</div>
</body>
</html>