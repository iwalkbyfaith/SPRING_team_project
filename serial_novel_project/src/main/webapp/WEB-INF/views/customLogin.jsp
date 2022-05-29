<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

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
           <h2>login</h2>
           <form action="/login" method="post">
               <div class="form-group">
                   <input type="text" class="form-control" name="username" placeholder="Your ID *" value="" />
               </div>
               <div class="form-group">
                   <input type="password" class="form-control" name="password" placeholder="Your Password *" value="" />
               </div>
               <div class="form-group">
               	<input type="checkbox" name="remember-me"/> 자동로그인
               </div>
               <div class="form-group">
                   <input type="submit" class="btnSubmit" value="Login" />
               </div>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- 이것을 넣어야 scrf 공격에 안전함. --> 
           </form>
       </div>      
     </div>

</body>
</html>