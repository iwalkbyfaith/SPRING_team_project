<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
	
}
</style>
<!-- Bootstrap CSS --><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container" role="main">			
	<h2>${novel.novel_title}</h2>	
			
	<form action="/paid/insertS" method="POST">
			<input type="hidden" name="novel_num" value="${novel.novel_num }">
		<div class="mb-3">
			<label>제목</label>					
			<input type="text" class="form-control col-md-5" name="paid_title" placeholder="제목을 입력해 주세요">
		</div>
		<div class="mb-3">
			<label>작가</label>
				<input type="text" class="form-control col-md-3" id="writer"name="paid_title" value="${novel.novel_writer }" readonly>
			<label>회차</label>
				<input type="number" class="form-control col-md-3" name="paid_snum"  min="1">
			<label>가격</label>
				<input type="number" class="form-control col-md-3" name="paid_price"  min="100">
		</div>
		<div class="mb-3">
			<label>내용</label>
			<textarea class="form-control" rows="5" name="paid_content1" placeholder="내용을 입력해 주세요" ></textarea>
			<textarea class="form-control" rows="5" name="paid_content2" placeholder="내용을 입력해 주세요" ></textarea>
		</div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<div>
			<input class="btn btn-sm btn-primary" type="submit" value="작성">
			<input type="reset" class="btn btn-sm btn-primary" value="초기화">
			
		</div>
	</form>	
</div>

</body>
</html>