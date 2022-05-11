<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1>${novel.novel_title } 상세정보</h1>
	<div id=container>
		<div class="row">
			<div class="col-md-1"><strong>제목</strong></div>
			<div class="col-md-5">
				<input type="text" class="form-control" value="${novel.novel_title }" readonly>
			</div>
			<div class="col-md-1"><strong>작가</strong></div>
			<div class="col-md-5">
				<input type="text" class="form-control" value="${novel.novel_writer }" readonly>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1"><strong>회차</strong></div>
			<div>
				<input type="number" class="form-control" value="${novel.novel_tsnum }">	
			</div>
			<div class="col-md-1"><strong>장르</strong></div>
			<div>
				<input type="text" class="form-control" value="${novel.novel_category }">			
			</div>
			<div class="col-md-1"><strong>연재요일</strong></div>
			<div>
				<input type="text" class="form-control" value="${novel.novel_week }">			
			</div>
			<div class="col-md-1"><strong>연재유무</strong></div>
			<div>
				<input type="text" class="form-control" value="${novel.novel_end eq 0 ? '연재중' : '완결'}">			
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<a href="/novel/novelList?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-info btn-sm">목록</a>
			</div>
			<div class="col-md-1">
				<form action="/novel/novelDelete" method="post">
					<input type="hidden" name="novel_num" value="${novel.novel_num }">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
					<input type="hidden" name="searchType" value="${param.searchType }">
					<input type="hidden" name="keyword" value="${param.keyword }">
					<input type="submit" value="삭제" class="btn btn-danger btn-sm">
				</form>
			</div>
			<div class="col-md-1">
				<form action="/novel/novelUpdateForm" method="post">
					<input type="hidden" name="novel_num" value="${novel.novel_num }">
					<input type="hidden" name="pageNum" value="${param.pageNum }">
					<input type="hidden" name="searchType" value="${param.searchType }">
					<input type="hidden" name="keyword" value="${param.keyword }">
					<input type="submit" value="수정" class="btn btn-warning btn-sm">
				</form>
			</div>
		</div>
	</div>
</body>
</html>