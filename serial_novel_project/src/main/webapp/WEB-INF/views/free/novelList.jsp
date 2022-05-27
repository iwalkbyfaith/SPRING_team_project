<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<html lang="kor">
<head>
	<style>
	.social-part .fa{
    padding-right:20px;
}
ul li a{
    margin-right: 20px;
}
	.header{
	height:100px;
}
.container{
	height:1000px;
}
.footer{
	height:150px;
}
#headerfLi,#headerwLi,#headerrLi,#headermLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	font-size:30px;
	outline:solid 1px;
}
.fantasyLi , .romanceLi , .wuxiaLi , .mysteryLi{
	list-style-type:none;
	float:left;
	margin-left:20px;
	
	outline:solid 1px;
}
.fantasyListimg{
background-position: center;
height: 180px;
border-radius: 10px;
border: 1px solid green;
			}
		
.writebtn,.List,.series,.delete,.update{
float:right;
margin-right:10px;
}
.articleInfo{
float:right;

}
 .articleMain{
text-align:center;

}


.articlecontent{
	margin-bottom:300px;
}
#reply,#reply1{
text-align:left;
border:none;
width:1000px;
height:100px;
font-size:20px;

}
#writeNovel,#replInsert{
float:right;
} 
#replyWrite{
width: 100%; 
height: 5.0em; 
resize: none;
}
#novelWriteBtn,.novellist,.novelseries,#replDelete,#replUpdateBtn,#replUpdate,#replInsert{
border:none;
margin-right:5px;
}
.menubar li ul {
list-style:none;
background: yellowgreen;
display:none;  /* 평상시에는 서브메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}
.menubar li:hover ul {
display:block;   /* 마우스 커서 올리면 서브메뉴 보이게 하기 */
}
}
	
	</style>
  <title>무료 소설</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Raleway:400,500,500i,700,800i" rel="stylesheet">
</head>
  <body>
	<div class="header">
    <nav class="navbar navbar-expand-sm   navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="/">홈 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              소설 선택
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="/free/novelList">무료소설</a>
              <a class="dropdown-item" href="/paid/novelList">유료소설</a>
             </div>
          </li>
          <li class="nav-item">
	            <a class="nav-link" href="/enroll/list">작가 신청 게시판</a>
          </li>
          <li class="nav-item">
	            <a class="nav-link" href="/tourna/list2">토너먼트</a>
          </li>
           <!-- <li class="nav-item dropdown dmenu">
            <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
              Dropdown link
            </a>
            <div class="dropdown-menu sm-menu">
              <a class="dropdown-item" href="#">Link 1</a>
              <a class="dropdown-item" href="#">Link 2</a>
              <a class="dropdown-item" href="#">Link 3</a>
              <a class="dropdown-item" href="#">Link 4</a>
              <a class="dropdown-item" href="#">Link 5</a>
              <a class="dropdown-item" href="#">Link 6</a>
            </div>
          </li> -->
          </ul>
        <div class="menubar">
	   		
    	 	<ul> 	
    	  	<li style="list-style:none;"><a href="#" id="current">내정보</a>
        	 <ul>
           <li><a href="/mypage/myInfo">계정정보</a></li>
           <li><a href="/mypage/myFavor">선호작</a></li>
           <li><a href="/mypage/bookmark">책갈피</a></li>
           <li><a href="/secu/customLogout">로그아웃</a></li>
           
     	    </ul>
   			   </li>
      			</ul>
      
   
</div>
        </div>
      </nav>
      </div>

<!-- ■ 카테고리별 소설 분류 -->
<div class="container">
  <div class="categoryheader" style="display:show;">
<ul>
<li id="headerfLi">판타지</li>
<li id="headerwLi">무협지</li>
<li id="headerrLi">로맨스</li>
<li id="headermLi">미스터리</li>
</ul>
</div>
<div id="writeNovel">
<sec:authorize access="hasRole('ROLE_FREE_WRITER')">
<button id="novelWriteBtn">소설등록</button>
</sec:authorize>
</div>

<br/>
<br/>
<br/>
<!-- ■ 해당 카테고리(class="categoryheader"의 자식들)를 눌렀을때 나타낼 리스트 -->
<div class="listsize">
<ul id="novellist">
</ul>
<div id="image">
</div>
</div>
<br/>
<!-- ■ 읽고있던 카테고리-소설의 회차목록 바로가기 버튼-->
<div class="series" style="display:none;">
</div>
<!-- ■ 읽고있던 소설에 해당하는 카테고리 목록 바로가기 버튼-->
<div class="List" style="display:none;">
</div>
<!-- ■ 읽고있던 카테고리-소설 삭제 버튼-->
<div class="delete" style="display:none;">
</div>
<!-- ■ 읽고있던 소설 수정 버튼-->
<div class="update" style="display:none;">
</div>
<!-- ■ 해당 카테고리에 해당 소설에 대한 글쓰기 (추후에 소설작가만 글쓰기 버튼을 볼수 있도록 설정할 예정) -->
<div class="writebtn" style="display:none;">
</div>
<!-- ■ 해당 카테고리에 해당 소설에 대한 선호 표시 -->
<div class="favor" style="display:none;">
</div>
<!-- ■ 해당 카테고리에 해당 소설에 대한 책갈피 표시 -->
<div class="bookmark" style="display:none;">
</div>
<br/>
<br/>
<!-- ■ 위에 (id="novelList")안에 들어온 리스트를 클릭시 넘어오는 게시판 형식의 해당 소설 회차목록 -->
<table class="table" style="display:none;">
  <thead class="table-dark">
   <tr>
   <th>글번호</th>
   <th>글제목</th>
   <th>글쓴이</th>
   <th>게시일</th>
   <th>최종수정날짜</th>
   </tr>
  </thead>
  <tbody class="tbody">
   	
  </tbody>
</table>

<!-- ■ 위의 class="table" 내부에서 글제목 클릭시 넘어오는 해당 카테고리 소설의 n회차 디테일 페이지 (작가,게시일,소제목,내용등등 정보가 들어있음)  -->
<div class="content" style="display:none;">
<div class="section-area-viewer">
	
	<div class="articleInfo">
		
		<div class="articleWriter"></div>
		<div class="articleDate"></div>
		<div class="articleHit"><strong>조회: </strong>83	&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천:</strong> <span id="rec"></span></div>
		</div>
	<div class="articleMain">
	<div class="articleTitle"></div>
	<div class="articleContent"></div>
	</div>
	
	<div class="repl" style="display:none;">
	<h2>댓글</h2>
	<div class="replheader">
	</div>
	<h2>댓글 작성</h2>
	<div class="replyContainer">
	
	</div>
	</div>
</div>
</div>
				<!-- ■ 위의 id="novelwriteBtn"을 눌렀을때 나오게 되는 소설작성 페이지 (기본적인 작가,카테고리,제목 등을 적는페이지) -->
				<table  style="padding-top:50px; display:none;" align = center width=700 border=0 cellpadding=2 class="novelwork">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        
                        <tr>
                        <td>작가</td>
                        <td>
                        <textarea id="novelWriter" style="width: 100%; height: 2.0em; resize: none;"></textarea>
                        </td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td>
                        <textarea id="novelTitle" style="width: 100%; height: 2.0em; resize: none;"></textarea>
                        </td>
                        </tr>
                        
                        <tr>
                        <td>카테고리</td>
                        <td>
                        <select id="category">
                        	<option value="fantasy">판타지</option>
                        	<option value="romance">로맨스</option>
                        	<option value="wuxia">무협지</option>
                        	<option value="mystery">미스터리</option>
                        </select>
                        </td>
                        </tr>
                        
                        <tr>
                        <td>n부작</td>
                        <td>
                        <input class="nSnum" type="number" min="1" value="">
                        </td>
                        </tr>
 						<tr>
 						<td id="novelBtn">
 						
 						</td>
 						</tr>
                        
                     </table>
 
                </td>
                </tr>
        </table>
				<!-- ■ 위의 class="writebtn"을 눌렀을때 나오게 되는 소설작성 페이지 (넘어오면서 novelNum을 가지고와서 기본적인 내용{작가,제목}은 받아옴.) -->
				<table  style="padding-top:50px; display:none;" align = center width=700 border=0 cellpadding=2 class="work">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <td>작가</td>
                        <td id="nWriter"></td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td id="nTitle"></td>
                        </tr>
                        
                        <tr>
                        <td>회차제목</td>
                        <td>
                        <textarea class="fTitle" style="width: 100%; height: 2.0em; resize: none;"></textarea>
                        </td>
                        </tr>
                        
                        <tr>
                        <td>n회차</td>
                        <td>
                        <input class="fSNum" type="number" min="1" value="">
                        </td>
                        </tr>
 
                        <tr>
                        <td>내용1</td>
                        <td>
                        <textarea class="contents1" onKeyUp="javascript:fnChkByte1(this,'4000')" style="width: 100%; height: 6.25em; resize: none;"></textarea>
						<span id="byteInfo1">0</span> /4000bytes
                        
                        </td>
                        </tr>
                        <tr>
                        <td>내용2</td>
                        <td>
                        <textarea class="contents2" onKeyUp="javascript:fnChkByte2(this,'4000')" style="width: 100%; height: 6.25em; resize: none;"></textarea>
						<span id="byteInfo2">0</span> /4000bytes
                        
                        </td>
                        </tr>
 						
 						<tr>
 						<td id="nBtn">
 						
 						</td>
 						</tr>
                        
                     </table>
 
                </td>
                </tr>
        </table>
				
				<!-- ■ 위의 class="update"을 눌렀을때 나오게 되는 소설수정 페이지 (넘어오면서 novelNum을 가지고와서 기본적인 내용{작가,제목}은 받아옴.) -->
				<table  style="padding-top:50px; display:none;" align = center width=700 border=0 cellpadding=2 class="uwork">
                <tr>
                <td height=20 align= center bgcolor=#ccc><font color=white> 글쓰기</font></td>
                </tr>
                <tr>
                <td bgcolor=white>
                <table class = "table2">
                        <tr>
                        <td>작가</td>
                        <td id="uWriter"></td>
                        </tr>
 
                        <tr>
                        <td>제목</td>
                        <td id="uTitle"></td>
                        </tr>
                        
                        <tr>
                        <td>회차제목</td>
                        <td>
 	                     <textarea class="uTitle" style="width: 100%; height: 2.0em; resize: none;"></textarea>
                        </td>
                        </tr>
                        
                        <tr>
                        <td>n회차</td>
                        <td>
                        <input class="uSNum" type="number" min="1" value="">
                        </td>
                        </tr>
 
                        <tr>
                        <td>내용1</td>
                        <td>
                        <textarea class="ucontents1" onKeyUp="javascript:fnChkByte1(this,'4000')" style="width: 100%; height: 6.25em; resize: none;"></textarea>
						<span id="byteInfo1">0</span> /4000bytes
                        
                        </td>
                        </tr>
                        <tr>
                        <td>내용2</td>
                        <td>
                        <textarea class="ucontents2" onKeyUp="javascript:fnChkByte2(this,'4000')" style="width: 100%; height: 6.25em; resize: none;"></textarea>
						<span id="byteInfo2">0</span> /4000bytes
                        
                        </td>
                        </tr>
 						
 						<tr>
 						<td id="uBtn">
 						
 						</td>
 						</tr>
                        
                     </table>
 
                </td>
                </tr>
        </table>







</div>

<div class="footer"></div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
// csrf 토큰 
var csrfHeaderName ="${_csrf.headerName}";
var csrfTokenValue ="${_csrf.token}";

let id = "<sec:authentication property="principal.user.user_id"/>";
let user_num = "<sec:authentication property="principal.user.user_num"/>";
console.log("▼▼▼▼▼▼▼▼");
console.log(id);
console.log(user_num);




// 글쓰기 로직 실행시 4000바이트 제한 거는 로직
function fnChkByte1(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 2;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo1').innerText = rbyte;
     }
}
//글쓰기 로직 실행시 4000바이트 제한 거는 로직
function fnChkByte2(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 2;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo2').innerText = rbyte;
     }
}

// 대충 CSS 긁어오면서 딸려온 로직.
$(document).ready(function () {
$('.navbar-light .dmenu').hover(function () {
        $(this).find('.sm-menu').first().stop(true, true).slideDown(150);
    }, function () {
        $(this).find('.sm-menu').first().stop(true, true).slideUp(105)
    });
});
	// ■ 판타지 카테고리 리스트 가져오기.
function getFantasyList(){
	  var novelCategory = "fantasy"; 	// 카테고리중에서 fantasy 선택
	  	$(".List").hide();				// .hide(), .empty()부분은 비동기로 화면을 옮겨다닐때 불필요한 부분을 지워주는용도 
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		
		console.log(data);
		
		$(data).each(
				function(){
			
			str += "<div class='fantasyLi' data-novelNum='" + this.novel_num + "' data-userId='" + this.user_id + "'>"  
			+"<div class='fanatasyImage'><img src='/resources/novel_image/"+this.novel_num+".png'></div>"+ this.novel_title +"</div>";
			

		});
		
		$("#novellist").html(str);
		
	});
	
}
	// ■ 로맨스 카테고리 리스트 가져오기.
function getRomanceList(){
	  var novelCategory = "romance";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
		
		
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='romanceLi' data-novelNum='" + this.novel_num + "' data-userId='" + this.user_id + "'>" + 
					 "<div class='romanceImage'><img src='/resources/novel_image/"+this.novel_num+".png'></div>"+ this.novel_title +"</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
	// ■ 무협지 카테고리 리스트 가져오기.
function getWuxiaList(){
	  var novelCategory = "wuxia";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='wuxiaLi' data-novelNum='" + this.novel_num + "' data-userId='" + this.user_id + "'>" + 
					"<div class='wuxiaImage'><img src='/resources/novel_image/"+this.novel_num+".png'></div>"+ this.novel_title +"</div>";

				});
		
		$("#novellist").html(str);
	});
	
}
	// ■ 미스터리 카테고리 리스트 가져오기.
function getMysteryList(){
	  var novelCategory = "mystery";
	  	$(".List").hide();
		$(".writebtn").hide();
		$(".series").hide();
	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
					
					str += "<div class='mysteryLi' data-novelNum='" + this.novel_num + "' data-userId='" + this.user_id + "'>" + 
					"<div class='wuxiaImage'><img src='/resources/novel_image/"+this.novel_num+".png'></div>"+ this.novel_title +"</div>";
					

				});
		
		$("#novellist").html(str);
	});
	
}

// ■ 판타지 카테고리를 클릭시 판타지 카테로리의 소설 리스트를 보여줌
$("#headerfLi").on("click",function(){

	
	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getFantasyList();
});
// ■ 로맨스 카테고리를 클릭시 로맨스 카테로리의 소설 리스트를 보여줌
$("#headerrLi").on("click",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();

getRomanceList();
});
// ■ 무협지 카테고리를 클릭시 무협지 카테로리의 소설 리스트를 보여줌
$("#headerwLi").on("click",function(){

$("#novellist").empty();
$(".content").hide();
$(".table").hide();

getWuxiaList();
	
});
// ■ 미스터리 카테고리를 클릭시 미스터리 카테고리의 소설 리스트를 보여줌
$("#headermLi").on("click",function(){

$("#novellist").empty();
$(".content").hide();
$(".table").hide();

getMysteryList();
	
});
// ■ 소설 글쓰기를 클릭시 소설 글쓰기 창을 보여줌.
$("#novelWriteBtn").on("click",function(){

$("#novellist").empty();
$(".novelwork").show();


let str="";
str+="<button class='novelCancel'>취소</button><button class='novelSubmit'>등록</button>";
$("#novelBtn").html(str);
	
});
$("#novelBtn").on("click",".novelCancel",function(){
	$(".novelwork").hide();
	getFantasyList();
});
$("#novelBtn").on("click",".novelSubmit",function(){
	
	var novelWriter = $("#novelWriter").val();
	var novelTitle = $("#novelTitle").val();
	var novelCategory = $("#category").val();
	var novelTSnum = $(".nSnum").val();
	var novelWeek = "free";
	
	console.log(novelWriter);
	console.log(novelTitle);
	console.log(novelCategory);
	console.log(novelTSnum);
	
	
	$.ajax({
		type : 'post',
		url: '/free/novel',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			
			novel_tsnum : novelTSnum,
			novel_title : novelTitle,
			novel_writer : novelWriter,
			novel_category : novelCategory,
			novel_week : novelWeek
	}),
		success : function(result){
			if(result == 'SUCCESS'){
				alert("소설이 등록 되었습니다.");// 소설 등록 로직 끝남 . 
// ===================================================================================
					// 소설 등록 로직이 끝난후 등록한 소설의 카테고리 리스트를 보여줌 (등록한 소설이 해당 카테고리에 들어갔는지 보여주기위함)
				$.getJSON("/free/novel/"+ novelCategory , function(data){
					
					
					let str = "";
					console.log(data);
					
					$(data).each(
							function(){
						
						str += "<div class='"+novelCategory+"Li' data-novelNum='" + this.novel_num + "'>" + 
						this.novel_title + "</div>";

					});
					
					$("#novellist").html(str);
				});
				$(".novelwork").hide();
				$(".categoryheader").show();
					
				
			
		} 
		}	// success 끝나는부분 
});	// ajax 끝나는부분 
});
	

// ■ 판타지 카테고리의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌 
$("#novellist").on("click",".fantasyLi", function(){
var novelNum = $(this).attr("data-novelNum");
var user_id = $(this).attr("data-userId");
var novelCategory = "fantasy";
console.log(novelNum);

	$("#novellist").empty();
	$(".categoryheader").hide();
	
	// ■ 선호작 버튼  
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
	var favlist = [];
	$.getJSON("/free/favor/"+ id, function(data){
		console.log(data);
		$(data).each(function(i){
			
			console.log(this.novel_num);
			favlist[i] = this.novel_num;
		});
		console.log(favlist);	
		console.log(favlist.includes(novelNum));
		console.log("novelNum : " + novelNum)
		
		if(favlist.includes(novelNum)){
			
			
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorDelete' data-novelNum='"+novelNum+"'>선호작 취소</button>"
			
			$(".favor").html(str);
		}
		else{
					
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorInsert' data-novelNum='"+novelNum+"'>선호작 등록</button>"
			
			$(".favor").html(str);				
		}
	});
// 여기까지 선호작 버튼 넣는 로직 =========================================================================================================	
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
		
		
		$(".writebtn").html(str1);
		$(".List").html(str2);
		
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				let testDate = new Date(1970,0,1);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				let formattedTime3 = testDate.getFullYear()+"/"+(testDate.getMonth()+1)+"/"+testDate.getDate();
				
				if(formattedTime2 == formattedTime3){
					formattedTime2 = "";
				
				 }
				
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"' data-freeNum='"+this.free_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+this.user_id+"'>"+this.free_title+"</td>"
					+ "<td>"+this.novel_writer+"</td>"
					+ "<td>"+formattedTime1+"</td>"
					+ "<td>"+formattedTime2+"</td></tr>"
					console.log(this);
				
				
				
					
				
				$(".tbody").html(str);
				
	
});
});
	if(id == user_id){
		$(".writebtn").show("slow");
	}
	$(".table").show("slow");
	$(".List").show("slow");
	$(".tbody").empty();
	$(".favor").show("slow");
	
		
});
//■ 로맨스 카테고리의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".romanceLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "romance";
var user_id = $(this).attr("data-userId");
console.log(novelNum);

	$("#novellist").empty();
	$(".categoryheader").hide();
	// ■ 선호작 버튼  
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
	var favlist = [];
	$.getJSON("/free/favor/"+ id, function(data){
		console.log(data);
		$(data).each(function(i){
			
			console.log(this.novel_num);
			favlist[i] = this.novel_num;
		});
		console.log(favlist);	
		console.log(favlist.includes(novelNum));
		console.log("novelNum : " + novelNum)
		
		if(favlist.includes(novelNum)){
			
			
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorDelete' data-novelNum='"+novelNum+"'>선호작 취소</button>"
			
			$(".favor").html(str);
		}
		else{
					
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorInsert' data-novelNum='"+novelNum+"'>선호작 등록</button>"
			
			$(".favor").html(str);				
		}
	});
// 여기까지 선호작 버튼 넣는 로직 =========================================================================================================	
	
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
		let str = "";
		let str1 ="";
		let str2 = "";

		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";

		$(".writebtn").html(str1);
		$(".List").html(str2);

	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				let testDate = new Date(1970,0,1);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				let formattedTime3 = testDate.getFullYear()+"/"+(testDate.getMonth()+1)+"/"+testDate.getDate();
				
				if(formattedTime2 == formattedTime3){
					formattedTime2 = "";
				
				 }
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"' data-freeNum='"+this.free_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+this.user_id+"'>"+this.free_title+"</td>"
					+ "<td>"+this.novel_writer+"</td>"
					+ "<td>"+formattedTime1+"</td>"
					+ "<td>"+formattedTime2+"</td></tr>"
					console.log(this);
				
				
				$(".tbody").html(str);
				
});		
});
	if(id == user_id){
		$(".writebtn").show("slow");
	}
	$(".table").show("slow");
	$(".List").show("slow");
	$(".tbody").empty();
	$(".favor").show("slow");
	
});
//■ 무협지 카테고리의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".wuxiaLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "wuxia";
var user_id = $(this).attr("data-userId");
console.log(novelNum);

	$("#novellist").empty();
	$(".categoryheader").hide();
	
	// ■ 선호작 버튼  
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
	var favlist = [];
	$.getJSON("/free/favor/"+ id, function(data){
		console.log(data);
		$(data).each(function(i){
			
			console.log(this.novel_num);
			favlist[i] = this.novel_num;
		});
		console.log(favlist);	
		console.log(favlist.includes(novelNum));
		console.log("novelNum : " + novelNum)
		
		if(favlist.includes(novelNum)){
			
			
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorDelete' data-novelNum='"+novelNum+"'>선호작 취소</button>"
			
			$(".favor").html(str);
		}
		else{
					
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorInsert' data-novelNum='"+novelNum+"'>선호작 등록</button>"
			
			$(".favor").html(str);				
		}
	});
// 여기까지 선호작 버튼 넣는 로직 =========================================================================================================	
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
		
		let str = "";
		let str1 ="";
		let str2 = "";
		
		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
		
		
		$(".writebtn").html(str1);
		$(".List").html(str2);
		
	console.log(data);
	
	$(data).each(
			function(){
								
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				let testDate = new Date(1970,0,1);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				let formattedTime3 = testDate.getFullYear()+"/"+(testDate.getMonth()+1)+"/"+testDate.getDate();
				
				if(formattedTime2 == formattedTime3){
					formattedTime2 = "";
				
				 }
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"' data-freeNum='"+this.free_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+this.user_id+"'>"+this.free_title+"</td>"
					+ "<td>"+this.novel_writer+"</td>"
					+ "<td>"+formattedTime1+"</td>"
					+ "<td>"+formattedTime2+"</td></tr>"
					
				console.log(this);
					
				
				$(".tbody").html(str);
});
});
	if(id == user_id){
		$(".writebtn").show("slow");
	}
	$(".table").show("slow");
	$(".List").show("slow");
	$(".tbody").empty();
	$(".favor").show("slow");
});
//■ 미스터리 카테고리의 특정 작품을 선택했을때 그 작품의 회차정보를 보여줌
$("#novellist").on("click",".mysteryLi", function(){
var novelNum = $(this).attr("data-novelNum");
var novelCategory = "mystery";
var user_id = $(this).attr("data-userId");
console.log(novelNum);

	$("#novellist").empty();
	$(".categoryheader").hide();
	
	// ■ 선호작 버튼  
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
	var favlist = [];
	$.getJSON("/free/favor/"+ id, function(data){
		console.log(data);
		$(data).each(function(i){
			
			console.log(this.novel_num);
			favlist[i] = this.novel_num;
		});
		console.log(favlist);	
		console.log(favlist.includes(novelNum));
		console.log("novelNum : " + novelNum)
		
		if(favlist.includes(novelNum)){
			
			
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorDelete' data-novelNum='"+novelNum+"'>선호작 취소</button>"
			
			$(".favor").html(str);
		}
		else{
					
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorInsert' data-novelNum='"+novelNum+"'>선호작 등록</button>"
			
			$(".favor").html(str);				
		}
	});
// 여기까지 선호작 버튼 넣는 로직 =========================================================================================================	
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
	
	
	let str = "";
	let str1 ="";
	let str2 = "";
	
	str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글쓰기</button>";
	str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
	
	
	$(".writebtn").html(str1);
	$(".List").html(str2);
	
	console.log(data);
	
	$(data).each(
			function(){
				let timestamp1 = this.free_rdate;
				let timestamp2 = this.free_mdate;
				let date1 = new Date(timestamp1);
				let date2 = new Date(timestamp2);
				let testDate = new Date(1970,0,1);
				
				let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
				let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
				let formattedTime3 = testDate.getFullYear()+"/"+(testDate.getMonth()+1)+"/"+testDate.getDate();
				
				if(formattedTime2 == formattedTime3){
					formattedTime2 = "";
				
				 }				
				str+= "<tr><td>"+this.free_snum+"</td>"
					+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"' data-freeNum='"+this.free_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+this.user_id+"'>"+this.free_title+"</td>"
					+ "<td>"+this.novel_writer+"</td>"
					+ "<td>"+formattedTime1+"</td>"
					+ "<td>"+formattedTime2+"</td></tr>"
					
				console.log(this);
					
				
				$(".tbody").html(str);
});
});
	if(id == user_id){
		$(".writebtn").show("slow");
	}
	$(".table").show("slow");
	$(".List").show("slow");
	$(".favor").show("slow");
	$(".tbody").empty();
});
// ■ 특정 카테고리의 회차정보에서 제목을 클릭시 그 회차에 대한 디테일을 보여줌(작가, 내용 등등)
$(".tbody").on("click",".title",function(){
var freeSNum =  $(this).attr("data-freeSNum");
console.log(freeSNum);
var novelNum =  $(this).attr("data-novelNum");
console.log(novelNum);
var freeNum = $(this).attr("data-freeNum");
	freeNum = Number(freeNum);
var novelCategory =$(this).attr("data-novelCategory");
var user_id = $(this).attr("data-userId");
$("#novellist").empty();
$(".content").hide();
$(".table").hide();
$(".writebtn").hide();
$(".favor").hide();


var bookmarkList = [];
$.getJSON("/free/bookmark/"+ id, function(data){
	console.log(data);
	$(data).each(function(i){
		
		console.log(this.free_num);
		bookmarkList[i] = this.free_num;
	});
	console.log(bookmarkList);	
	console.log(bookmarkList.includes(freeNum));
	console.log("freeNum : " + freeNum)
	
	if(bookmarkList.includes(freeNum)){
		
		
		$(".bookmark").empty
		
		str = "";
		
		str+= "<button id='bookmarkDelete' data-freeNum='"+freeNum+"'>책갈피 취소</button>"
		
		$(".bookmark").html(str);
	}
	else{
				
		$(".bookmark").empty
		
		str = "";
		
		str+= "<button id='bookmarkInsert' data-freelNum='"+freeNum+"'>책갈피 등록</button>"
		
		$(".bookmark").html(str);				
	}
}); 
//여기까지 책갈피 버튼 넣는 로직 =========================================================================================================	

//■ 조회수 올리는 로직.

$.ajax({
	type : 'put',
	url : '/free/hit/' + freeNum,
	beforeSend : function(xhr){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	},
	header : {
		"Content-Type" : "application/json",
		"X-HTTP-Method-Override" : "PUT"
	},
	contentType : "application/json",
	dataType : 'text',
	data: JSON.stringify({
			
	}),
	success : function(result) {
		
		if(result == 'SUCCESS'){
			}
		}
		});
let str6 =	"";
let str7 =	"";

str6+= "<button class='nDelete' data-freeNum='"+freeNum+"' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글삭제</button>";
str7+= "<button class='nUpdate' data-freeSNum='"+freeSNum+"' data-novelNum='"+novelNum+"'>글수정</button>";
$(".delete").html(str6);
$(".update").html(str7);


var url = "/free/novel/detail/"+ freeSNum +"/"+novelNum;
console.log(url);
$.getJSON(url, function(data){
	
		
	

	
	let str = "";
	let str1 = "";
	let str2 =	"";
	let str3 =	"";
	let str4 =	"";
	let str5 =	"";
	
	console.log(data);
	
	$(data).each(
			function(){
				
				let timestamp = this.free_rdate;
				let date = new Date(timestamp);
				let formattedTime = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
					
				if(this.free_content2 == null){
					str2+= "<p>작가 :"+ this.novel_writer +"</p>";
					str3+= "<p>작성일 : " + formattedTime + "</p>"; 
					str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
					str5+= "<h2>제목 :"+ this.free_title+"</h2>";
					str+= "<h4>"+this.free_content1+"</h4>";
					str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+user_id+"'>회차목록</button>";
					
				}
				else{
					str2+= "<p>작가 :"+ this.novel_writer +"</p>";
					str3+= "<p>작성일 : " + formattedTime + "</p>"; 
					str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
					str5+= "<h2>제목 :"+ this.free_title+"</h2>";
					str+= "<h4>"+this.free_content1+"</h4> <h4>"+this.free_content2+"</h4>";
					str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+user_id+"'>회차목록</button>";
					
				}
				
				
				$(".articleWriter").html(str2);
				$(".articleDate").html(str3);
				$(".articleHit").html(str4);
				$(".articleTitle").html(str5);
				$(".articleContent").html(str);
				$(".series").html(str1);
				
			});
});


	$.getJSON("/replies/detail/"+ freeNum, function(data){
	let repl="";
	let replDelete="";
	let replUpdate="";
	let replInsert="";
	let replContent="";
	console.data
	replContent+= "<textarea id='replyWrite'></textarea>";
	replInsert += "<button id='replInsert' data-freeNum='"+freeNum+"' data-novelNum='"+novelNum+"'>등록</button>";
	let reply = replContent + replInsert;
	$(".replyContainer").html(reply);
	$(data).each(
		function(){
			
			if(id == this.user_id){
				replUpdate += "<button id='replUpdateBtn' data-freplNum='"+this.frepl_num+"' data-user_id='"+this.user_id+"' data-freeNum='"+this.free_num+"' data-novelNum='"+ novelNum +"'>수정</button>";
				replDelete += "<button id='replDelete' data-freplNum='"+this.frepl_num+"' data-freeNum='"+this.free_num+"'>삭제</button>";
			}
			
			var timestamp = this.free_rdate;
			var date = new Date(timestamp);
			var formattedTime = "작성일 : " + date.getFullYear()
										  +"/" + (date.getMonth()+1)
										  +"/" + date.getDate();
			repl += "<input type='text' id='reply' data-freeNum='" + this.free_num +"' data-freplNum='" + this.frepl_num +"' value='"+this.user_id+" :"+this.frepl_content+"' readonly/>" + replDelete + replUpdate;
			replDelete="";
			replUpdate="";
			
		});
	$(".replheader").html(repl);
	
	
	
});
	if(id == user_id){
	$(".delete").show("slow");
	$(".update").show("slow");
	}
	
	$(".content").show("slow");
	$(".series").show("slow");
	$(".repl").show("slow");
});




// ■ 글목록 버튼을 누르면 보고있던 카테고리에 해당하는 글목록을 보여줌
$(".List").on("click",".novelList",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".delete").hide();
	$(".update").hide();
	$(".favor").hide();
	
var novelCategory = $(this).attr("data-novelCategory");

	
	$.getJSON("/free/novel/"+ novelCategory , function(data){
			
						
		let str = "";
		console.log(data);
		
		$(data).each(
				function(){
			
			str += "<div class='"+novelCategory+"Li' data-novelNum='" + this.novel_num + "' data-userId='" + this.user_id + "'>" + 
			 "<div class='"+novelCategory+"Image'><img src='/resources/novel_image/"+this.novel_num+".png'></div>"+ this.novel_title +"</div>";

		});
		
		$("#novellist").html(str);
	});
	$(".categoryheader").show();
		
	});
// ■ 회차목록을 누르게되면 보고있던 작품의 회차목록을 보여줌
$(".series").on("click",".novelSeries",function(){

	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".update").hide();
	$(".delete").hide();
	$(".favor").show();
	var userId = $(this).attr("data-userId")	
	var novelNum = $(this).attr("data-novelNum");
	var novelCategory = $(this).attr("data-novelCategory");
	console.log(novelNum);

		$("#novellist").empty();
			
		
		$.getJSON("/free/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 ="";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"' data-novelCategory='"+novelCategory+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.free_rdate;
					let timestamp2 = this.free_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					let testDate = new Date(1970,0,1);
					
									
									
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					let formattedTime3 = testDate.getFullYear()+"/"+(testDate.getMonth()+1)+"/"+testDate.getDate();
					if(formattedTime2 == formattedTime3){
						formattedTime2 = "";
					
					 }
					str+= "<tr><td>"+this.free_snum+"</td>"
						+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.free_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						
					console.log(this);
						
					
					
					$(".tbody").html(str);
					$(".writebtn").html(str1);
					$(".List").html(str2);
	});
	});
		if(id == userId){
			$(".writebtn").show("slow");
		}
		$(".table").show("slow");
		$(".List").show("slow");
		
		
	});
// ■ 글쓰기 버튼을 누르면 보고있던 작품의 정보를 받아서 작가,제목은 기입된채로 소설 쓰기창이 나옴 (추후에는 해당하는 작가만 보이게끔 만들예정) 
$(".writebtn").on("click",".writenovelbtn",function(){
	
	var novelNum = $(this).attr("data-novelNum");
	var novelCategory = $(this).attr("data-novelCategory");
	
	$.getJSON("/free/novel/selecttitle/"+ novelNum , function(data){
		
		$(data).each(
				function(){
					let str1="";
					let str2="";
					let str3="";
					
					
					str1+="<strong>"+this.novel_writer+"</strong>"
					str2+="<strong>"+this.novel_title+"</strong>"
					str3+=	"<button class='nCancel' data-novelNum='"+ novelNum +"' data-novelCategory='"+novelCategory+"'>취소</button><button class='nSubmit' data-novelNum='"+ novelNum +"' data-novelCategory='"+novelCategory+"'>등록</button>";
					
					$("#nWriter").html(str1);
					$("#nTitle").html(str2);
					$("#nBtn").html(str3);
		});		
	});
	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".work").show();
	$(".categoryheader").hide();
});

// ■ 소설글쓰기 창에서 등록버튼을 누르면 글이 써지고 해당 작품의 회차정보로 보내줌 
$("#nBtn").on("click",".nSubmit",function(){
	
	var novelCategory = $(this).attr("data-novelCategory");
	var novelNum =$(this).attr("data-novelNum");
	var freeSNum = $(".fSNum").val();
	var freeTitle = $(".fTitle").val();
	var content1 = $(".contents1").val();
	var content2 = $(".contents2").val();
	$.ajax({
		type : 'post',
		url: '/free',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			novel_num : novelNum,
			free_snum : freeSNum,
			free_title : freeTitle,
			free_content1 : content1,
			free_content2 : content2
			
		}),
		success : function(result){
			if(result == 'SUCCESS'){
				$(".fSNum").val(null);
				$(".fTitle").val(null);
				$(".contents1").val(null);
				$(".contents2").val(null);
				alert("글이 등록 되었습니다.");// 여기까지가 글쓰기 로직
// ====================================================================================================================		
				
				// 여기부터 회차정보로 돌아가는 로직
				$("#novellist").empty();
				$(".work").hide();
				
				
				$.getJSON("/free/novel/select/"+ novelNum , function(data){
				
				let str = "";
				let str1 = "";
				let str2 = "";
				str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelCategory='"+this.novel_category+"'>글쓰기</button>";
				str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
				$(".writebtn").html(str1);
				$(".List").html(str2);
				console.log(data);
				
				$(data).each(
						function(){
							let timestamp1 = this.free_rdate;
							let timestamp2 = this.free_mdate;
							let date1 = new Date(timestamp1);
							let date2 = new Date(timestamp2);
							
							let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
							let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
							
							str+= "<tr><td>"+this.free_snum+"</td>"
								+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.free_title+"</td>"
								+ "<td>"+this.novel_writer+"</td>"
								+ "<td>"+formattedTime1+"</td>"
								+ "<td>"+formattedTime2+"</td></tr>"
								console.log(this);
							
							
								
							
							$(".tbody").html(str);
				
			});
			});
				$(".table").show("slow");
				$(".writebtn").show("slow");
				$(".List").show("slow");	
				
				}
		} // success 끝나는부분
		}); // ajax 끝나는부분 
	
});

//■ 소설글쓰기 창에서 취소버튼을 누르면 해당 작품의 회차정보로 보내줌 
$("#nBtn").on("click",".nCancel",function(){
	var novelNum = $(this).attr("data-novelNum");
	var novelCategory = $(this).attr("data-novelCategory");
	console.log(novelNum);

		$("#novellist").empty();
		$(".work").hide();
		
		
		$.getJSON("/free/novel/select/"+ novelNum , function(data){
		
		
		let str = "";
		let str1 = "";
		let str2 = "";
		str1+= "<button class='writenovelbtn' data-novelNum='"+novelNum+"' data-novelCategory='"+this.novel_category+"'>글쓰기</button>";
		str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
		$(".writebtn").html(str1);
		$(".List").html(str2);
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp1 = this.free_rdate;
					let timestamp2 = this.free_mdate;
					let date1 = new Date(timestamp1);
					let date2 = new Date(timestamp2);
					
					let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
					let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
					
					str+= "<tr><td>"+this.free_snum+"</td>"
						+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.free_title+"</td>"
						+ "<td>"+this.novel_writer+"</td>"
						+ "<td>"+formattedTime1+"</td>"
						+ "<td>"+formattedTime2+"</td></tr>"
						console.log(this);
					
					
						
					
					$(".tbody").html(str);
		
	});
	});
		$(".table").show("slow");
		$(".writebtn").show("slow");
		$(".List").show("slow");
		

});

// ■ 글삭제 버튼 클릭시 글을 삭제한후 회차목록을 보여줌.
$(".delete").on("click",".nDelete",function(){
	var free_num = $(this).attr("data-freeNum");
	var novelNum = $(this).attr("data-novelNum");
	var novelCategory = $(this).attr("data-novelCategory");
	
	$.ajax({
		type : 'delete',
		url : '/free/' + free_num,
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		header : {
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			if(result == 'SUCCESS'){
				alert("글이 삭제 되었습니다.");
				$("#novellist").empty();
				$(".content").hide();
				$(".writebtn").hide();
				$(".table").hide();
				$(".List").hide();
				$(".series").hide();
				$(".update").hide();
				$(".delete").hide();
				
				
				
					$("#novellist").empty();
						
					
					$.getJSON("/free/novel/select/"+ novelNum , function(data){
					
					
					let str = "";
					let str1 ="";
					let str2 = "";
					str1+= "<button class='writenovelbtn' data-novelNum='"+this.novel_num+"' data-novelCategory='"+novelCategory+"'>글쓰기</button>";
					str2+= "<button class='novelList' data-novelCategory='"+novelCategory+"'>글목록</button>";
					console.log(data);
					
					$(data).each(
							function(){
								let timestamp1 = this.free_rdate;
								let timestamp2 = this.free_mdate;
								let date1 = new Date(timestamp1);
								let date2 = new Date(timestamp2);
								
								let formattedTime1 = date1.getFullYear()+"/"+(date1.getMonth()+1)+"/"+date1.getDate();
								let formattedTime2 = date2.getFullYear()+"/"+(date2.getMonth()+1)+"/"+date2.getDate();
								
								str+= "<tr><td>"+this.free_snum+"</td>"
									+ "<td class='title' data-freeSNum='"+this.free_snum+"'data-novelNum='"+this.novel_num+"'>"+this.free_title+"</td>"
									+ "<td>"+this.novel_writer+"</td>"
									+ "<td>"+formattedTime1+"</td>"
									+ "<td>"+formattedTime2+"</td></tr>"
									
								console.log(this);
									
								
								
								$(".tbody").html(str);
								$(".writebtn").html(str1);
								$(".List").html(str2);
				});
				});
					$(".table").show("slow");
					$(".writebtn").show("slow");
					$(".List").show("slow");
				} 
		}
	}); // ajax 끝나는부분
	
	});

// ■ 글수정 버튼을 클릭시 디테일 데이터를 포함한(보고있는 회차의 정보들을 담은 - 내용 , 회차 , 소제목 등등) 수정창을 띄워줌.
$(".update").on("click",".nUpdate",function(){
	var novelNum = $(this).attr("data-novelNum");
	var freeSNum = $(this).attr("data-freeSNum");
	console.log(novelNum);
	console.log(freeSNum);
	
	var url = "/free/novel/detail/"+ freeSNum +"/"+novelNum;
	console.log(url);
	$.getJSON(url, function(data){
		console.log(data);
		let str5="";				
		let str6="";				
		let str7="";
		$(data).each(
				function(){
				
				
				str5 += this.free_title;
				str6 += this.free_content1;
				str7 += this.free_content2;
				});
		
		$(".uTitle").html(str5);
		$(".ucontents1").html(str6);
		$(".ucontents2").html(str7);
	});
	
	$.getJSON("/free/novel/select/"+ novelNum , function(data){
		
		$(data).each(
				function(){
					let str1="";
					let str2="";
					let str3="";
					
					
					
					str1+="<strong>"+this.novel_writer+"</strong>"
					str2+="<strong>"+this.novel_title+"</strong>"
					str3+=	"<button class='uCancel' data-novelNum='"+ novelNum +"' data-novelCategory='"+this.novel_category+"' data-freeNum='"+ this.free_num +"' data-freeSNum='"+ freeSNum +"'>취소</button><button class='uModify' data-novelNum='"+ novelNum +"' data-novelCategory='"+this.novel_category+"' data-freeNum='"+ this.free_num +"' data-freeSNum='"+ freeSNum +"'>수정</button>";
					
					
					
					
					
					$("#uWriter").html(str1);
					$("#uTitle").html(str2);
					$("#uBtn").html(str3);
					$(".uSNum").attr('value',freeSNum);
					
		});		
	});
	$("#novellist").empty();
	$(".content").hide();
	$(".writebtn").hide();
	$(".table").hide();
	$(".List").hide();
	$(".series").hide();
	$(".update").hide();
	$(".delete").hide();
	$(".uwork").show();
	$(".categoryheader").hide();
	$(".favor").hide();
});

// ■ 글 수정창에서 취소 버튼을 클릭시 보고있던 디테일 페이지로 돌아감.
$("#uBtn").on("click",".uCancel",function(){
	var novelNum = $(this).attr("data-novelNum");
	var freeSNum = $(this).attr("data-freeSNum");
	var freeNum = $(this).attr("data-freeNum");
	var novelCategory = $(this).attr("data-novelCategory");
	
	
	$("#novellist").empty();
	$(".content").hide();
	$(".table").hide();
	$(".writebtn").hide();
	$(".uwork").hide();

	let str6 =	"";
	let str7 =	"";

	str6+= "<button class='nDelete' data-freeNum='"+freeNum+"' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글삭제</button>";
	str7+= "<button class='nUpdate' data-freeSNum='"+freeSNum+"' data-novelNum='"+novelNum+"'>글수정</button>";
	$(".delete").html(str6);
	$(".update").html(str7);


	var url = "/free/novel/detail/"+ freeSNum +"/"+novelNum;
	console.log(url);
	$.getJSON(url, function(data){
		
		
		let str = "";
		let str1 = "";
		let str2 =	"";
		let str3 =	"";
		let str4 =	"";
		let str5 =	"";
		
		console.log(data);
		
		$(data).each(
				function(){
					let timestamp = this.free_rdate;
					let date = new Date(timestamp);
					let formattedTime = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
						
					if(this.free_content2 == null){
						str2+= "<p>작가 :"+ this.novel_writer +"</p>";
						str3+= "<p>작성일 : " + formattedTime + "</p>"; 
						str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
						str5+= "<h2>제목 :"+ this.free_title+"</h2>";
						str+= "<h4>"+this.free_content1+"</h4>";
						str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+this.novel_category+"' data-userId='"+this.user_id+"'>회차목록</button>";
						
					}
					else{
						str2+= "<p>작가 :"+ this.novel_writer +"</p>";
						str3+= "<p>작성일 : " + formattedTime + "</p>"; 
						str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
						str5+= "<h2>제목 :"+ this.free_title+"</h2>";
						str+= "<h4>"+this.free_content1+"</h4> <h4>"+this.free_content2+"</h4>";
						str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+this.novel_category+"' data-userId='"+this.user_id+"'>회차목록</button>";
						
					}
					
					
					$(".articleWriter").html(str2);
					$(".articleDate").html(str3);
					$(".articleHit").html(str4);
					$(".articleTitle").html(str5);
					$(".articleContent").html(str);
					$(".series").html(str1);
					
				});
	});
	
	$(".content").show("slow");
	$(".series").show("slow");
	$(".delete").show("slow");
	$(".update").show("slow");
	$(".List").show("slow");
	
});	

// ■ 글 수정창에서 수정 버튼을 누를시 수정한 내용을 반영한 디테일 페이지를 보여줌
$("#uBtn").on("click",".uModify",function(){

	
		var freeNum = $(this).attr("data-freeNum");
		
		var novelNum = $(this).attr("data-novelNum");
		var novelCategory = $(this).attr("data-novelCategory");
		
		var freeSNum = $(".uSNum").val();
		var freeTitle = $(".uTitle").val();
		var content1 = $(".ucontents1").val();
		var content2 = $(".ucontents2").val();
		
		$.ajax({
			type : 'put',
			url : '/free/' + freeNum,
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			contentType : "application/json",
			dataType : 'text',
			data: JSON.stringify({
				novel_num : novelNum,
				free_snum : freeSNum,
				free_title : freeTitle,
				free_content1 : content1,
				free_content2 : content2
				}),
			success : function(result) {
				
				if(result == 'SUCCESS'){
					alert("글이 수정 되었습니다."); 
					
					// 여기까지 수정 로직
// =======================================================================================================================				
					$(".uwork").hide();
					$("#novellist").empty();
					$(".content").hide();
					$(".table").hide();
					$(".writebtn").hide();

					let str6 =	"";
					let str7 =	"";

					str6+= "<button class='nDelete' data-freeNum='"+freeNum+"' data-novelNum='"+novelNum+"' data-novelCategory='"+novelCategory+"'>글삭제</button>";
					str7+= "<button class='nUpdate' data-freeSNum='"+freeSNum+"' data-novelNum='"+novelNum+"'>글수정</button>";
					$(".delete").html(str6);
					$(".update").html(str7);


					var url = "/free/novel/detail/"+ freeSNum +"/"+novelNum;
					console.log(url);
					$.getJSON(url, function(data){
						
						
						let str = "";
						let str1 = "";
						let str2 =	"";
						let str3 =	"";
						let str4 =	"";
						let str5 =	"";
						
						console.log(data);
						
						$(data).each(
								function(){
									let timestamp = this.free_rdate;
									let date = new Date(timestamp);
									let formattedTime = date.getFullYear()+"/"+(date.getMonth()+1)+"/"+date.getDate();
										
									if(this.free_content2 == null){
										str2+= "<p>작가 :"+ this.novel_writer +"</p>";
										str3+= "<p>작성일 : " + formattedTime + "</p>"; 
										str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
										str5+= "<h2>제목 :"+ this.free_title+"</h2>";
										str+= "<h4>"+this.free_content1+"</h4>";
										str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+this.user_id+"'>회차목록</button>";
										
									}
									else{
										str2+= "<p>작가 :"+ this.novel_writer +"</p>";
										str3+= "<p>작성일 : " + formattedTime + "</p>"; 
										str4+= "<strong>조회수 : </strong>" + this.free_hit +"&nbsp;&nbsp;&nbsp;&nbsp; <strong>추천수 : </strong>" + this.free_rec;
										str5+= "<h2>제목 :"+ this.free_title+"</h2>";
										str+= "<h4>"+this.free_content1+"</h4> <h4>"+this.free_content2+"</h4>";
										str1+= "<button class='novelSeries' data-novelNum='"+this.novel_num+"' data-novelCategory='"+novelCategory+"' data-userId='"+this.user_id+"'>회차목록</button>";
										
									}
									
									
									$(".articleWriter").html(str2);
									$(".articleDate").html(str3);
									$(".articleHit").html(str4);
									$(".articleTitle").html(str5);
									$(".articleContent").html(str);
									$(".series").html(str1);
									
								});
					});

					$(".content").show("slow");
					$(".series").show("slow");
					$(".delete").show("slow");
					$(".update").show("slow");
					$(".List").show("slow");
						
					}
			}
		}); // ajax마무리
});
$(".repl").on("click","#replDelete",function(){
	var frepl_num = $(this).attr("data-freplNum");
	var freeNum = $(this).attr("data-freeNum");
	
	$.ajax({
		type : 'delete',
		url : '/replies/' + frepl_num,
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		header : {
			"X-HTTP-Method-Override" : "DELETE"
		},
		dataType : 'text',
		success : function(result) {
			if(result == 'SUCCESS'){
				alert("댓글이 삭제 되었습니다."); 
				// ■ 삭제 로직 끝나는 부분
// ============================================================================================================
	
				// ■ 삭제로직 끝난후 남은 댓글 목록 불러오는 로직 				
				$.getJSON("/replies/detail/"+ freeNum, function(data){
					let repl="";
					let replDelete="";
					let replUpdate="";
					console.data
					$(data).each(
						function(){
							
							if(id == this.user_id){
								replUpdate+= "<button id='replUpdateBtn' data-freplNum='"+this.frepl_num+"' data-user_id='"+this.user_id+"' data-freeNum='"+this.free_num+"'>수정</button>"
								replDelete += "<button id='replDelete' data-freplNum='"+this.frepl_num+"' data-freeNum='"+this.free_num+"'>삭제</button>";
							}
							
							var timestamp = this.free_rdate;
							var date = new Date(timestamp);
							var formattedTime = "작성일 : " + date.getFullYear()
														  +"/" + (date.getMonth()+1)
														  +"/" + date.getDate();
							repl += "<input type='text' id='reply' data-freeNum='" + this.free_num +"' data-freplNum='" + this.frepl_num +"' value='"+this.user_id+" :"+this.frepl_content+"' readonly/>" + replDelete + replUpdate;
							replDelete="";
							replUpdate="";
							
						});
					$(".replheader").html(repl);
					
					
				});			
				} 
		}
	}); // ajax 끝나는부분
});

//■ 처음 수정버튼(#replUpdateBtn)을 누르면 해당 댓글을 수정하는 부분이 먼저나옴. 
$(".repl").on("click","#replUpdateBtn",function(){
	var freplNum = $(this).attr("data-freplNum");	
	var freeNum = $(this).attr("data-freeNum");	
	var userId = $(this).attr("data-userId");	
	var novelNum = $(this).attr("data-novelNum");
	
	
	$.getJSON("/replies/detail/"+ freeNum, function(data){
		let repl="";
		let replCancel="";
		let replUpdate="";
		console.data
		$(data).each(
			function(){
				
				if(freplNum == this.frepl_num){
					replUpdate+= "<button id='replUpdate' data-freplNum='"+this.frepl_num+"' data-user_id='"+this.user_id+"' data-freeNum='"+this.free_num+"'>수정</button>";
					replCancel+= "<button id='replCancel' data-freeNum='"+ freeNum +"' data-novelNum='"+ novelNum +"'>취소</button>";
					
					repl += "<input type='text' id='reply' data-freeNum='" + this.free_num +"' data-freplNum='" + this.frepl_num +"' value='"+this.frepl_content+"'/>" + replCancel +replUpdate;
					$(".replheader").html(repl);
				}
				
			}); 
		
			 
			
	});			
	
	});

// ■ 수정 도중 취소를 누르면 다시 원래있던 댓글목록을 뿌려줌.
$(".repl").on("click","#replCancel",function(){
	var freeNum = $(this).attr("data-freeNum");
	var novelNum = $(this).attr("data-novelNum");
	$.getJSON("/replies/detail/"+ freeNum, function(data){
		let repl="";
		let replDelete="";
		let replUpdate="";
		let replInsert="";
		let replContent="";
		console.data
		replContent+= "<textarea id='replyWrite'></textarea>";
		replInsert += "<button id='replInsert' data-freeNum='"+freeNum+"' data-novelNum='"+novelNum+"'>등록</button>";
		let reply = replContent + replInsert;
		$(".replyContainer").html(reply);
		$(data).each(
			function(){
				
				if(id == this.user_id){
					replUpdate+= "<button id='replUpdateBtn' data-freplNum='"+this.frepl_num+"' data-user_id='"+this.user_id+"' data-freeNum='"+this.free_num+"'>수정</button>"
					replDelete += "<button id='replDelete' data-freplNum='"+this.frepl_num+"' data-freeNum='"+this.free_num+"'>삭제</button>";
				}
				
				var timestamp = this.free_rdate;
				var date = new Date(timestamp);
				var formattedTime = "작성일 : " + date.getFullYear()
											  +"/" + (date.getMonth()+1)
											  +"/" + date.getDate();
				repl += "<input type='text' id='reply' data-freeNum='" + this.free_num +"' data-freplNum='" + this.frepl_num +"' value='"+this.user_id+" :"+this.frepl_content+"' readonly/>" + replDelete + replUpdate;
				replDelete="";
				replUpdate="";
				
			});
		$(".replheader").html(repl);
		
		
		
	});
	
	
});
	
// ■ (처음 수정버튼을 누르면 해당 댓글을 수정하는 부분이 먼저나옴 #replUpdateBtn) 수정 버튼(#replUpdate)을 눌렀을때 수정이 되는 로직.	
$(".repl").on("click","#replUpdate",function(){
	var frepl_num = $(this).attr("data-freplNum");
	
	var frepl_content = $("#reply").val();
	var freeNum = $(this).attr("data-freeNum");
	$.ajax({
		type : 'put',
		url : '/replies/' + frepl_num,
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		header : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		contentType : "application/json",
		dataType : 'text',
		data: JSON.stringify({
			frepl_num : frepl_num,
			frepl_content : frepl_content
			}),
		success : function(result) {
			
			if(result == 'SUCCESS'){
				alert("글이 수정 되었습니다."); 
				
				// ■ 여기까지 수정 로직
//=======================================================================================================================				
			// ■ 수정로직 끝난후 남은 댓글 목록 불러오는 로직 				
			$.getJSON("/replies/detail/"+ freeNum, function(data){
					let repl="";
					let replDelete="";
					let replUpdate="";
					console.data
					$(data).each(
						function(){
							
							if(id == this.user_id){
								replUpdate+= "<button id='replUpdateBtn' data-freplNum='"+this.frepl_num+"' data-user_id='"+this.user_id+"' data-freeNum='"+this.free_num+"'>수정</button>"
								replDelete += "<button id='replDelete' data-freplNum='"+this.frepl_num+"' data-freeNum='"+this.free_num+"'>삭제</button>";
							}
							
							var timestamp = this.free_rdate;
							var date = new Date(timestamp);
							var formattedTime = "작성일 : " + date.getFullYear()
														  +"/" + (date.getMonth()+1)
														  +"/" + date.getDate();
							repl += "<input type='text' id='reply' data-freeNum='" + this.free_num +"' data-freplNum='" + this.frepl_num +"' value='"+this.user_id+" :"+this.frepl_content+"' readonly/>" + replDelete + replUpdate;
							replDelete="";
							replUpdate="";
							
						});
					$(".replheader").html(repl);
					
					
				});			
					
				}
		}
	}); // ajax마무리
	
});

// ■ 댓글 등록 버튼을 눌렀을때 실행되는 로직 
$(".replyContainer").on("click","#replInsert",function(){
	var novel_num = $(this).attr("data-novelNum");
	var freeNum = $(this).attr("data-freeNum");
	var frepl_content = $("#replyWrite").val();
	
	$.ajax({
		type : 'post',
		url: '/replies',
		beforeSend : function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		},
		headers:{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'text',
		data : JSON.stringify({
			
			novel_num : novel_num,
			frepl_content : frepl_content,
			free_num : 	freeNum,			
			user_id : id
	}),
		success : function(result){
			if(result == 'SUCCESS'){
				alert("댓글이 등록 되었습니다.");
				$("#replyWrite").val(null); // 댓글 등록 로직 끝남 .
 // ===================================================================================================================
	 				// 새로 쓴 댓글을 반영한 댓글모음을 불러와야함. 
					$.getJSON("/replies/detail/"+ freeNum, function(data){
						let repl="";
						let replDelete="";
						let replUpdate="";
						console.data
						$(data).each(
							function(){
								
								if(id == this.user_id){
									replUpdate+= "<button id='replUpdate' data-freplNum='"+this.frepl_num+"' data-user_id='"+this.user_id+"' data-freeNum='"+this.freeNum+"'>수정</button>"
									replDelete += "<button id='replDelete' data-freplNum='"+this.frepl_num+"' data-freeNum='"+this.free_num+"'>삭제</button>";
								}
								
								var timestamp = this.free_rdate;
								var date = new Date(timestamp);
								var formattedTime = "작성일 : " + date.getFullYear()
															  +"/" + (date.getMonth()+1)
															  +"/" + date.getDate();
								repl += "<input type='text' id='reply' data-freeNum='" + this.free_num +"' data-freplNum='" + this.frepl_num +"' value='"+this.user_id+" :"+this.frepl_content+"' readonly/>" + replDelete + replUpdate;
								replDelete="";
								replUpdate="";
								
							});
						$(".replheader").html(repl);
						
						
					});	// getJson <-- 댓글 불러오는 getJson	
				}
			}			// success 끝나는부분
		}); 			// ajax 끝나는부분 
		
		});

$(".favor").on("click","#favorDelete",function(){
	var userId = id;
	var novelNum = $(this).attr("data-novelNum");
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
		$.ajax({
				type : 'delete',
				url: '/fav/delete/' + novelNum + "/" + user_num,
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				headers:{
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert("선호작이 삭제 되었습니다."); 
				} 
				}	// success 끝나는부분 
		});	// ajax 끝나는부분
			
			$(".favor").empty
			
			str = "";
			
			str+= "<button id='favorInsert' data-novelNum='"+novelNum+"'>선호작 등록</button>"
			
			
			
			$(".favor").html(str);				
		
	});
$(".favor").on("click","#favorInsert",function(){
	var userId = id;
	var novelNum = $(this).attr("data-novelNum");
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
	
		
		$.ajax({
			type : 'post',
			url: '/fav/insert',
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				
				user_num : user_num,
				novel_num : novelNum
		}),
			success : function(result){
				if(result == 'SUCCESS'){
					alert("선호작이 등록 되었습니다."); 
			} 
			}	// success 끝나는부분 
	});	// ajax 끝나는부분 

		$(".favor").empty
		
		str = "";
		
		str+= "<button id='favorDelete' data-novelNum='"+novelNum+"'>선호작 취소</button>"
		
		$(".favor").html(str);
		
	});
	




$(".bookmark").on("click","#bookmarkDelete",function(){
	var userId = id;
	var freeNum = $(this).attr("data-freeNum");
	freeNum = Number(freeNum);
	console.log(typeof(freeNum));
	freeNum = Number(freeNum);
	console.log(typeof(freeNum));
	console.log("freeNum : " + freeNum)
	
		$.ajax({
				type : 'delete',
				url: '/bookmark/delete/' + novelNum + "/" + user_num,
				beforeSend : function(xhr){
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				headers:{
					"X-HTTP-Method-Override" : "DELETE"
				},
				dataType : 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert("선호작이 삭제 되었습니다."); 
				} 
				}	// success 끝나는부분 
		});	// ajax 끝나는부분
			
			$(".bookmark").empty
			
			str = "";
			
			str+= "<button id='bookmarkInsert' data-freeNum='"+freeNum+"'>책갈피 등록</button>"
			
			
			
			$(".bookmark").html(str);				
		
	});
$(".bookmark").on("click","#bookmarkInsert",function(){
	var userId = id;
	var novelNum = $(this).attr("data-novelNum");
	freeNum = Number(freeNum);
	console.log(typeof(novelNum));
	novelNum = Number(novelNum);
	console.log(typeof(novelNum));
	console.log("novelNum : " + novelNum)
	
	
		
		$.ajax({
			type : 'post',
			url: '/bookmark/insert',
			beforeSend : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			headers:{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				
				user_num : user_num,
				novel_num : novelNum
		}),
			success : function(result){
				if(result == 'SUCCESS'){
					alert("선호작이 등록 되었습니다."); 
			} 
			}	// success 끝나는부분 
	});	// ajax 끝나는부분 

		$(".bookmark").empty
		
		str = "";
		
		str+= "<button id='bookmarkDelete' data-freeNum='"+freeNum+"'>책갈피 취소</button>"
		
		$(".bookmark").html(str);
		
	});




		
	
getFantasyList();

</script>
      
</body>
</html>