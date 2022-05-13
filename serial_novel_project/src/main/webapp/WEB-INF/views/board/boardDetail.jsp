<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		#modDiv{
		 	width : 500px;
		 	height : 100px;
		 	background-color : green;
		 	position : absolute;
		 	top : 50%;
		 	left : 50%;
		 	margin-top : -50px;
		 	margin-left : -150px;
		 	padding : 10px;
		 	z-index : 1000;
		}
		#reply{
		width: 400px;
		}
	</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<div class="container">
		<h1 class="text text-primary">${board.free_board_num }번글 조회</h1>
		
		<div class="row">
		
			<div class="col-md-7">
				<input type="text"  class="form-control" value="제목 : ${board.free_board_title }" readonly/>
			</div>
			
			<div class="col-md-3">			
				<input type="text"  class="form-control" value="글쓴이 : ${board.free_board_writer }" readonly/>
			</div>
			<div class="row">
				<div class="col-md-12">
					<textarea rows="10" class="form-control" readonly>${board.free_board_content }</textarea>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-1">쓴날짜 : </div>
				<div class="col-md-3">${board.free_board_rdate }</div>
				<div class="col-md-1">수정날짜 : </div>
				<div class="col-md-3">${board.free_board_mdate }</div>				
			</div>
		</div>
		<a href="/board/boardList?pageNum=${param.pageNum == null ? 1 : param.pageNum }&searchType=${param.searchType}&keyword=${param.keyword}" class="btn btn-info btn-sm">글목록</a>
		
		<form action="/board/boardDelete" method="post">
			<input type="hidden" name="free_board_num" value="${free_board_num }"/>
			<input type="hidden" name="searchType" value="${param.searchType }"/>
			<input type="hidden" name="keyword" value="${param.keyword }"/>
			<input type="hidden" name="pageNum" value="${param.pageNum }"/>
			<input type="submit" value="글삭제하기" class="btn btn-danger btn-sm"/>
		</form>
		
		<form action="/board/boardUpdateForm" method="post">
			<input type="hidden" name="free_board_num" value="${free_board_num }"/>
			<input type="hidden" name="searchType" value="${param.searchType }"/>
			<input type="hidden" name="keyword" value="${param.keyword }"/>
			<input type="hidden" name="pageNum" value="${param.pageNum }"/>
			<input type="submit" value="글수정" class="btn btn-warning btn-sm"/>
		</form>
		
		
		<h2>댓글</h2>
		<div class="row">
			<ul id="replies">
			
			</ul>
		</div>
	
	<div class="row box-box-success">
			<div class="box-header">
				<h2 class="text-primary">댓글작성</h2>
			</div><!-- header -->
			<div class="box-body">
				<strong>Writer : </strong>
				<input type="text" id="newReplyerWriter" placeholder="글쓴이" class="from-control">
				<strong>ReplyText : </strong>
				<input type="text" id="newReplyText" placeholder="댓글내용" class="from-control">
			</div><!-- body -->
			<div class="box-footer">
				<button type="button" class= "btn btn-success" id="replyAddBtn">댓글 추가</button>
			</div><!-- footer -->
	</div><!-- row -->
		
	<div id="modDiv" style="display:none;">
			<!-- 상단 -->
		<div class="modal-title"></div>
		<div><!-- 중단 -->
			<input type="text" id="reply">
		</div>
		<div><!-- 하단 -->
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript">
	let free_board_num=${free_board_num};
	
	function getAllList(){

		
 		$.getJSON("/replies/all/" + free_board_num , function(data){
			
			let str ="";
			console.log(data);
			
			$(data).each(function(){
				// 날짜 처리를 위해 자바스크립트의 Date 객체를 사용합니다.
				let timestamp = this.repl_mdate;
				let date = new Date(timestamp);
				
				let formattedTime = " 게시일 : " + date.getFullYear()+"년"
									 + (date.getMonth()+1) + "월"
									 + date.getDate() + "일"
									// 시분초 추가하기
									+date.getHours() +"시"
									+date.getMinutes() +"분"
									+date.getSeconds() +"초";
									
			
				str += "<div class='replyLi' data-repl_num='" + this.repl_num + "'><strong>@"
					+ this.repl_writer + "</strong> - " + formattedTime + "<br>"
					+ "<div class='reply'>" + this.repl_content + "</div>"
					+ "<button type='button' class='btn btn-info'>수정/삭제</button>"
					+ "</div>";
				});
			$("#replies").html(str);
			
		}); 
		
	}//전체 댓글가져옴
	getAllList();
	
	$("#replyAddBtn").on("click",function(){
		// 폼이 없기 때문에, input태그 내에 입력된 요소를 가져와야함
		// 버튼을 누르는 시점에, 글쓴이와 내용 내부에 적힌 문자열을 변수에 저장합니다. 
		let repl_writer = $("#newReplyerWriter").val();
		let repl_content = $("#newReplyText").val();
		
		// $.ajax({내용물}); 이 기본형태
		$.ajax({
			type :'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				free_board_num:free_board_num,
				repl_writer : repl_writer,
				repl_content : repl_content
			}),
			success : function(result){
				if(result == 'SUCCESS'){
					alert("등록되었습니다");
					
					getAllList(); //댓글 등록 성공시, 실시간으로 댓글전체 보여줌
					
					// 댓글 등록 성공시 댓글입력창을 비워줌
					$("#newReplyerWriter").val("");
					$("#newReplyText").val("");
				}
			}
		});
	});
	
	
	//이벤트 위임
	$("#replies").on("click",".replyLi button",function(){
		
		let replyContent =$(this).siblings(".reply").text();
		
		let replytag = $(this).parent();
		
		
		//클릭한 버튼과 연계된 li태그의 data-rno에 든 값 가져와 변수 rno에 저장
		let repl_num = replytag.attr("data-repl_num");
		
		
		// rno뿐만 아니라 본문도 가져와야함
		//내부 text가져옴
		let repl_content=replytag.text();
		
		//modal-title부분에 글번호 입력
		$(".modal-title").html(repl_num); 
		// reply2 영역에 리플내용을 기입(수정/삭제)
		$("#reply").val(replyContent);
		// 버튼 누르면 모달 열림
		$("#modDiv").show("slow");
		
	});
	
	//모달창 닫기 이벤트
	$("#closeBtn").on("click",function(){ 
		$("#modDiv").hide("slow"); 
	});
	
	// 삭제로직
	$("#replyDelBtn").on("click",function(){
		let repl_num=$(".modal-title").html();
		
		$.ajax({
			type : 'delete',
			url : '/replies/'+repl_num,
			header : {
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result){
				console.log("result: "+result);
				if(result=='SUCCESS'){
					alert("삭제 되었습니다.");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});

	// 수정로직
	$("#replyModBtn").on("click",function(){
		let repl_num = $(".modal-title").html();
		let repl_content=$("#reply").val();
		
		$.ajax({
			type : 'put',
			url : '/replies/'+repl_num,
			header : { 
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			contentType : "application/json",
			dataType : 'text',
			data : JSON.stringify({repl_content:repl_content}),
			success : function(result){
				console.log("result: " + result);
				if(result=='SUCCESS'){
					alert("수정됬습니다");
					$("#modDiv").hide("slow");
					getAllList();
				}
			}
		});
	});
	
	</script>

</div>
</body>
</html>