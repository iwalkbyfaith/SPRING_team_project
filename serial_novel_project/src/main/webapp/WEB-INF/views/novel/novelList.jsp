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
	
	
	<div id="header">
		<h1>웹소설 전체 리스트</h1>
	</div>
	<div class="container">
		<div class="container1">
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
						<td><a href="/novel/novelDetail/${novel.novel_num}?pageNum=${pageMaker.cri.pageNum }&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${novel.novel_title }</a></td>
						<td>${novel.novel_writer }</td>
						<td>${novel.novel_tsnum }</td>
						<td>${novel.novel_category }</td>
						<td>${novel.novel_week }</td>
						<td>${novel.novel_end eq true ? '완결' : '연재중'}</td>
					</tr>
				</c:forEach>
			</table>
			<a href="/novel/novelInsert">소설 등록</a>
			
			<!-- 버튼 -->
			<ul class="pagination justify-content-center">
				<!-- 이전버튼 -->
				<c:if test="${pageMaker.prev }">
			    	<li class="page-item">
				      <a class="page-link" href="/novel/allList?pageNum=${pageMaker.startPage -1}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">
				      	&laquo;
				      </a>
			    	</li>
		    	</c:if>
		    	
		    	<!-- 밑에 깔아줄 버튼들 -->
		    	<c:forEach var="idx" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				    <li class="page-item ${pageMaker.cri.pageNum eq idx ? 'active' : ''}">
				    	<a class="page-link" href="/novel/allList?pageNum=${idx}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">
				    		${idx}
				    	</a>
				    </li>
				</c:forEach>
				
				<!-- 다음버튼 -->
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				    <li class="page-item">
				      <a class="page-link" href="/novel/allList?pageNum=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">
				        &raquo;
				      </a>
				    </li>
			    </c:if>
		  	</ul>
		  	
		  	<!-- 검색창 -->
		  	<form action="/novel/allList" method="get">
		  		<!-- select태그를 이용해 클릭시 검색조건을 선택할수 있도록 처리합니다. -->
		  		<select name="searchType">
		  			<!-- 검색조건을 option태그를 이용해 만듭니다. -->
		  			<option value="n">-</option>
		  			<option value="t" ${pageMaker.cri.searchType eq 't' ? 'selected' : ''}>제목</option>
		  			<option value="w" ${pageMaker.cri.searchType eq 'w' ? 'selected' : ''}>작가</option>
		  			<option value="c" ${pageMaker.cri.searchType eq 'c' ? 'selected' : ''}>장르</option>
		  		</select>
		  		<input type="text" name="keyword" placeholder="검색어" value="${pageMaker.cri.keyword }">
		  		<input type="submit" value="Search">
		  	</form>
	  	</div>
	  	
  	<!-- jquery cdn -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  	
	 <h2>연재,완결 웹툰</h2>
	<div class="series">	
		연재 <ul id="series1"></ul>
		완결 <ul id="series2"></ul>
	</div>
	  	
	  	<div class="container2">
	  		<script>
	  		function getEedList(){
				
	  			let novelEnd = "0";
	  			
				$.getJSON("/series/" + novelEnd, function(data){
			
					var str= "";
					
					$(data).each(function(){
						
						str+= "<li>" + this.novel_title +"</li>"
					});
					$("#series1").html(str);
				});
			}
			function getEedList1(){
				
	  			let novelEnd = "1";
	  			
				$.getJSON("/series/" + novelEnd, function(data){
			
					var str= "";
					
					$(data).each(function(){
						
						str+= "<li>" + this.novel_title +"</li>"
					});
					$("#series2").html(str);
				});
			}
	  		getEedList();	
	  		getEedList1();	
	  	
	  		
	
	  		</script>
	  	
	  		
	  	</div>
	</div>
	<div id="footer">
	
	</div>
</body>
</html>