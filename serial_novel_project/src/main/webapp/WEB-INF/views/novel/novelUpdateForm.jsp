<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${novel.novel_title}의 정보를 수정합니다.</h1>
		<form action="/novel/novelUpdate" method="POST">
			<input type="hidden" name="novel_num" value="${novel.novel_num }"><br>
			제목<input type="text" name="novel_title" value="${novel.novel_title }"><br>
			글쓴이<input type="text" name="novel_writer" value="${novel.novel_writer }" readonly><br>
			총편수<input type="number" name="novel_tsnum" value="${novel.novel_tsnum }"><br>
			요일 <label><input type="radio" name="novel_week" value="Mon">월</label>
				<label><input type="radio" name="novel_week" value="Tue">화</label>
				<label><input type="radio" name="novel_week" value="Wen">수</label>
				<label><input type="radio" name="novel_week" value="Thu">목</label>
				<label><input type="radio" name="novel_week" value="Fri">금</label>
				<label><input type="radio" name="novel_week" value="Sat">토</label>
				<label><input type="radio" name="novel_week" value="Free">자유</label><br>
			장르<input type="text" name="novel_category" value="${novel.novel_category }"><br>
			연재유무<label><input type="radio" name="novel_end" value=0>완결</label>
				<label><input type="radio" name="novel_end" value=1>연재</label><br>
			
		
			<input type="submit" value="수정"><input type="reset" value="초기화">
		</form>
</body>
</html>