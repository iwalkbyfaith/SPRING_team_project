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
	
	
	<div id="header">
		<h1>웹소설 전체 리스트</h1>
	</div>
	<div class="container">
		<table>
			<tr>
				<th>소설번호<th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>총 편</th>
				<th>장르</th>
				<th>연재요일</th>
				<th>완결 유무</th>
			</tr>
			<c:forEach var="novel" items="${novelList }">
				<tr>
					<td>${novel.novel_num }</td>
					<td><a href="/novel/novelDetail/${novel.novel_num}">${novel.novel_title }</a></td>
					<td>${novel.novel_writer }</td>
					<td>${novel.novel_tsnum }</td>
					<td>${novel.novel_category }</td>
					<td>${novel.novel_week }</td>
					<td>${novel.novel_end eq true ? '연재중' : '완결'}</td>
				</tr>
			</c:forEach>
		</table>
		<a href="/novel/novelInsert">소설 등록</a>
	</div>
	<div id="footer">
	
	</div>
</body>
</html>