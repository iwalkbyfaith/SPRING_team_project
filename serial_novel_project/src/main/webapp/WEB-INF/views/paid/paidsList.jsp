<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세 회차들</h1>
		<table class="table table-bordered border-info">
			<tr>
				<th>회차</th>
				<th>제목</th>
				<th>조회수</th>
				<th>추천</th>
				<th>가격</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="paid" items="${paidList }">
					<tr>
						<td>${paid.paid_snum }</td>
						<td><a href="/paid/detail/${paid.novel_num }/${paid.paid_num }">${paid.paid_title }</a></td>
						<td>${paid.paid_hit }</td>
						<td>${paid.paid_rec }</td>
						<td>${paid.paid_price }</td>
						<td>${paid.paid_rdate }</td>
					</tr>
				</c:forEach>
		</table>
		<a href="/paid/novelList">요일별 목록</a><br>
		<a href="/paid/insertS/${novelNum}">회차 글쓰기</a>
		${pageMaker }
		
</body>
</html>