<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
.login-container{
    margin-top: 5%;
    margin-bottom: 5%;
   	width: 50%;
    
}
.login-form-1{
    padding: 10%;
    height : 50%;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h2{
    text-align: center;
    color: #333;
}
.login-container form{
    padding: 10%;
}
.btnSubmit
{
    width: 100%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
}
.login-form-1 .btnSubmit{
    font-weight: 600;
    color: #fff;
    background-color: #0062cc;
}


.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="container login-container">
       <div class="login-form-1">
           <h2>join</h2>
           <form action="/secu/join" method="post">
               <div class="form-group">
                   <input type="text" class="form-control" name="user_id" placeholder="Your ID *" value="" />
               </div>
               <div class="form-group">
                   <input type="password" class="form-control" name="user_pw" placeholder="Your Password *" value="" />
               </div>
               <div class="form-group">
                   <input type="text" class="form-control" name="user_name" placeholder="Your Name *" value="" />
               </div>
               <div class="form-group">
                   <input type="text" class="form-control" name="user_pnum" maxlength="13" placeholder="Your Number *" value="" />
               </div>
               <div class="form-group">
                   <input type="text" class="form-control" name="user_email" placeholder="Your Email *" value="" />
               </div>
               
                <input type="checkbox" name="role" value="ROLE_ADMIN"/> ?????????  &nbsp;&nbsp; 	
				<input type="checkbox" name="role" value="ROLE_PAID_WRITER"/> ?????? ??????  &nbsp;&nbsp; 	<!-- ????????? ????????? ?????? ?????? ??????. -->
				<input type="checkbox" name="role" value="ROLE_FREE_WRITER"/> ?????? ?????? &nbsp;&nbsp;	<!-- ????????? ??? ????????? ???????????? ???????????? ?????? -->
				<input type="checkbox" name="role" value="ROLE_USER"/> ?????? ?????? <br/>
				
               <div class="form-group">
                   <input type="submit" class="btnSubmit" value="Join" />
               </div>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- ????????? ????????? scrf ????????? ?????????. --> 
           </form>
       </div>      
     </div>
	
	
		
	
</body>
</html>