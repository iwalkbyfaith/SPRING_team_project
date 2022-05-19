<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${weekList[0].novel_week} 웹툰 목록</h1>

	${weekList}
		 	<table class="table table-bordered border-info">
			<tr>
				<th>소설번호</th>
				<th>제목</th>
				<th>작가</th>
				<th>총 편</th>
				<th>장르</th>
				<th>완결유무</th>
			</tr>
			<c:forEach var="week" items="${weekList }">
					<tr>
						<td>${week.novel_num }</td>
						<td><a href="/paid/List/${week.novel_num }">${week.novel_title }</a></td>
						<td>${week.novel_writer }</td>
						<td>${week.novel_tsnum }</td>
					<c:if test="${week.novel_category eq 'fantasy'}"><td>판타지</td></c:if>
					<c:if test="${week.novel_category eq 'romance'}"><td>로맨스</td></c:if>
					<c:if test="${week.novel_category eq 'wuxia'}"><td>무협</td></c:if>
						<td>${week.novel_end eq true ? '완결' : '연재중'}</td>
					</tr>
				</c:forEach>
		</table>
</body>
</html>