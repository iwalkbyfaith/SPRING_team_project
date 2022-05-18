<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세 회차들</h1>
	${paidList }
	<table class="table table-bordered border-info">
			<tr>
				<th>회차</th>
				<th>제목</th>
				<th>작가</th>
				<th>총 편</th>
				<th>장르</th>
				<th>완결유무</th>
			</tr>
			<c:forEach var="paid" items="${paidList }">
					<tr>
						<td>${paid.paid_snum }</td>
						<td><a href="">${paid.paid_title }</a></td>
						<td>${paid.novel_writer }</td>
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