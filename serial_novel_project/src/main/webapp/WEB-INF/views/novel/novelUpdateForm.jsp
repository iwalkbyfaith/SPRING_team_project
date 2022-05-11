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
			<input type="hidden" name="novel_num" value="${novel.novel_num }">
			<input type="text" name="novel_title" value="${novel.novel_title }">
			<input type="text" name="novel_writer" value="${novel.novel_writer }" readonly><br>
			<input type="number" name="novel_tsnum" value="${novel.novel_tsnum }"><br>
			<input type="text" name="novel_week" value="${novel.novel_week }"><br>
			<input type="text" name="novel_category" value="${novel.novel_category }"><br>
			<input type="text" name="novel_end" value="${novel.novel_end}"><br>
			
			<!-- 수정을 했다면, 수정완료후에도 페이지번호ㅡ 검색조건, 검색어가 유지되도록
			전달받은 데이터를 폼으로 다시 넘겨줘야 합니다.
			넘겨받은 pageNum, searchType, keyword를 재전달하도록 폼 내부에 추가해주세요 -->
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="searchType" value="${param.searchType }">
			<input type="hidden" name="keyword" value="${param.keyword }">
			<input type="submit" value="수정"><input type="reset" value="초기화">
		</form>
</body>
</html>