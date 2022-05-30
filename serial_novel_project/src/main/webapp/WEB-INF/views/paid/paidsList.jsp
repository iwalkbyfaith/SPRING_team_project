<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<!-- jquery cdn -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>   
<style type="text/css">
.container{
	text-align: center;

}
img {
	
	width:163px;
	margin:0; 
	padding:0;
}

</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal.user" var="user"/>
	<sec:authentication property="principal.user"/>
	${user }<br>
	fav: ${fav}<br>
	${ novelList }<br>
	${paidList }
		<div class="header">
		
		</div>
		
		<div class="container">
			
			<table class="table caption-top table-sm">
			  <tbody>
			    <tr>
			    	<th rowspan="5"><img src='/resources/novel_image/${novelList.novel_num}.png' ></th>
			      <th scope="row">소설제목</th>
			      	<td>${novelList.novel_title }</td>
			      <th scope="row">작가</th>
			      	<td>${novelList.novel_writer }</td>
			    </tr>
			    <tr>
			      <th scope="row">장르</th>
			      	<td>${novelList.novel_category }</td>
			      <th scope="row">요일</th>
			      <td>${novelList.novel_week }</td>
			    </tr>
			    <tr>
			      <th scope="row">${novelList.novel_end }</th>
			    <!-- fav 데이터 유무에 따라 보여주는 버튼 -->
				<c:if test="${fav eq null}">
			      <td><button id="addfavBtn">♡</button></td>
				</c:if>
				<c:if test="${fav ne null}">
			      <td><button id="delfavBtn">♥</button></td>
				</c:if>
			    </tr>
			  </tbody>
			</table>

			<hr>
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
							<td><a href="/paid/detail/${paid.novel_num }/${paid.paid_num }/${user.user_num}">${paid.paid_title }</a></td>
							<td>${paid.paid_hit }</td>
							<td>${paid.paid_rec }</td>
							<td>${paid.paid_price }</td>
							<td>${paid.paid_rdate }</td>
						</tr>
					</c:forEach>
			</table>
			<a href="/paid/novelList">요일별 목록</a><br>
			<c:if test="${user.user_id eq paidList[0].user_id}">
				<a href="/paid/insertS/${novelNum}">회차 글쓰기</a>
			</c:if>
		</div>
		
		<div class="footer">
		
		</div>
		
		<script type="text/javascript">
			var userNum = ${user.user_num};
			var novelNum = ${novelList.novel_num}
			var csrfHeaderName = "${_csrf.headerName}"
			var csrfTokenValue="${_csrf.token}"
		
		$('#addfavBtn').on("click",function(){
			
			
			
			
			$.ajax({
				type : 'post',
				url : '/paid/fav',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				dataType : 'text',
				data : JSON.stringify({
					novel_num : novelNum,
					user_num : userNum,
				}),
				success : function(result){
					if(result == 'SUCCESS'){
						alert("선호작 등록완료.");
						$("#addfavBtn").hide();
						location.href = "/paid/List/${novelList.novel_num}";
					}
				}
			});
		});
		
		$("#delfavBtn").on("click", function(){
			
			$.ajax({
				type : 'delete',
				url : '/paid/del/' + novelNum + '/' + userNum,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
				header : {
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert("선호작 삭제완료.");
						$("#delfavBtn").hide();
						location.href = "/paid/List/${novelList.novel_num}";
					}
				}
			});
		});
		
		
		</script>
		
		
</body>
</html>