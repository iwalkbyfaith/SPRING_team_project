<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<style>
		.header{
			width:1000px;
			height:100px;
			background-color : cornflowerblue;
			border : solid black 1px;
		}
		.container-fluid {
			width: 1000px;
			height : 1000px;
			background-color : darkgrey;
		}
		.col-md-6, .col-md-3, .col-md-1{
			height:100px;
			background-color : rgb(201, 215, 188);
			border : dotted black 1px;
		}
		.footer{
			width:1000px;
			height:100px;
			background-color : cornflowerblue;
			border : solid black 1px;
		}
		.final-div, .quarter-final-div, .semi-final-div{
			margin: 0px -18px -16px;
		    column-gap: 60px;
		    padding-bottom: 16px;
		    grid-auto-columns: max-content;
		    display: grid;
		    grid-auto-flow: column;
		    flex-wrap: wrap;
		    max-width: 100vw;
		    overflow: scroll hidden;
		    border : solid 3px black;
		
		}
		
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<!-- ▶ 컨테이너 -->
	<div class="container-fluid">
		
		<!-- ▶ 헤더 -->
		<div class="header">
			여기 헤더
		</div>
		<!-- ▷ 헤더 끝 -->
		
		<div class="wrapper">
			<!-- 2강(결승) -->
			<section class="final">
				<div class="final-div">
					<article class="final-article"> 2강-1 </article>
					<article class="final-article"> 2강-2 </article> 
				</div>
			</section>
			
			<!-- 4강 -->
			<section class="semi-final">
				<div class="semi-final-div">
					<article class="semi-final-article">4강-1</article>
					<article class="semi-final-article">4강-2</article>
					<article class="semi-final-article">4강-3</article>
					<article class="semi-final-article">4강-4</article>
				</div>
			</section>
			
			<!-- 8강 -> 시도1 -->
			<section class="quarter-final">
				<div class="quarter-final-div">
					<article class="quarter-final-article">8강-1</article>
					<article class="quarter-final-article">8강-2</article>
					<article class="quarter-final-article">8강-3</article>
					<article class="quarter-final-article">8강-4</article>
					<article class="quarter-final-article">8강-5</article>
					<article class="quarter-final-article">8강-6</article>
					<article class="quarter-final-article">8강-7</article>
					<article class="quarter-final-article">8강-8</article>
				</div>
			</section>
			
			<!-- 8강 
			<div class="row">
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-3">8강-1</div>
						<div class="col-md-3">8강-2</div>
						<div class="col-md-3">8강-3</div>
						<div class="col-md-3">8강-4</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-3">8강-5</div>
						<div class="col-md-3">8강-6</div>
						<div class="col-md-3">8강-7</div>
						<div class="col-md-3">8강-8</div>
					</div>
				</div>			
			</div>
		</div>
		-->
		<!-- ▶ 푸터 -->
		<div class="footer">
			여기 푸터
		</div>
		<!-- ▷ 푸터 끝 -->
	
	
	</div>
	<!-- ▷ 컨테이너 끝 -->
	


</body>
</html>