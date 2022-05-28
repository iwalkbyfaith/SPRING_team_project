<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1>${vo.paid_title} 수정</h1>
	 ${vo }
 	<form action="/paid/paidUpdate" method="POST">
 		<input type="hidden" name="paid_num" value="${vo.paid_num }">
 		<input type="hidden" name="novel_num" value="${vo.novel_num }">
	제목	<input type="text" name="paid_title" value="${vo.paid_title }">
	작가 <input type="text" value="${vo.novel_writer }" readonly><br>
	회차 <input type="number" name="paid_snum" min="1" value="${vo.paid_snum }"><br>
	가격 <input type="number" name="paid_price" min="100" value="${vo.paid_price }"><br>
		<textarea rows="20" cols="50" name="paid_content1">${vo.paid_content1 }</textarea><br>
		<textarea rows="20" cols="50" name="paid_content2">${vo.paid_content2 }</textarea><br>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<input id="submitBtn" type="submit" value="수정"><input type="reset" value="초기화">
	</form>
</body>
</html>