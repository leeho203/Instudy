<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<style>
	*{margin:0px; padding:0px; border:0px;}
	body{height:auto; background-color:#f2f2f2; font-size:9pt;}
	.col-sm-1 .col-sm-2 .col-sm-3
	.col-sm-4 .col-sm-5 .col-sm-6
	.col-sm-7 .col-sm-8 .col-sm-9
	.col-sm-10 .col-sm-11 .col-sm-12
	{margin:0px; padding:10px;}
	
	.inbox{background-color:white; border:1px solid #c2c2d6; margin-top:10px; padding:15px;}
	.form-group{margin-top:15px;}
	
	@media (min-width: 0px){
		.first-main-container{
		 	margin-top:115px;
		}
	}
	
	@media (min-width: 300px){
		
		.first-main-container{
	 		 	margin-top:50px;
	 		}
	 		
	 		.container-fluid-main{
	 			height:50px;
	 		}
	 		
	}
	
	@media (min-width: 768px){
		.first-main-container{
		 	margin-top:120px;
		}
		
		.container-fluid-main{
			height:60px;
		}
	}
	
	
	@media (min-width: 992px) {
		.container {
			 	width: 900px;
		}
		
		.first-main-container{
		 	margin-top:120px;
		}
		
		.container-fluid-main{
			height:60px;
		}
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script>
	$(document).ready(function(){
		
		function formCheck(){
			var userid=$('input[name=userid]').val();
			var userpw=$('input[name=userpw]').val();
			var username=$('input[name=username]').val();
			var email=$('input[name=email]').val();
			var nickname=$('input[name=nickname]').val();
			var checkText=/[0-9a-zA-Z]/;
	
			if(userid==''||userid==null){
				alert("아이디를 입력하세요.");
				$('input[name=userid]').focus();
				return false;
			}
			
			if(userpw==''||userpw==null){
				alert("비밀번호를 입력하세요.");
				$('input[name=userpw]').focus();
				return false;
			}
			
			if(username==''||username==null){
				alert("이름을 입력하세요.");
				$('input[name=username]').focus();
				return false;
			}
			
			if(email==''||email==null){
				alert("이메일을 입력하세요.");
				$('input[name=email]').focus();
				return false;
			}
			
			if(nickname==''||nickname==null){
				alert("별명을 입력하세요.");
				$('input[name=nickname]').focus();
				return false;
			}
			
			
			for(var i=0;i<userid.length;i++){
				if(userid.charAt(i)==" "){
					alert("아이디에 공백이 올 수 없습니다");
					$('input[name=userid]').focus();
					return false;
				}
				
				if(checkText.test(userid.charAt(i))==false){
					alert("아이디는 숫자 또는 영문자이어야 합니다");
					$('input[name=userid]').focus();
					return false;
				}
			}
			
			for(var i=0;i<userpw.length;i++){
				if(userpw.charAt(i)==" "){
					alert("비밀번호에 공백이 올 수 없습니다");
					$('input[name=userpw]').focus();
					return false;
				}
				
				if(checkText.test(userpw.charAt(i))==false){
					alert("비밀번호는 숫자 또는 영문자이어야 합니다");
					$('input[name=userpw]').focus();
					return false;
				}
			}
			
			for(var i=0;i<username.length;i++){
				if(username.charAt(i)==" "){
					alert("이름에 공백이 올 수 없습니다");
					$('input[name=username]').focus();
					return false;
				}
			}
			
			for(var i=0;i<email.length;i++){
				if(email.charAt(i)==" "){
					alert("이메일에 공백이 올 수 없습니다");
					$('input[name=email]').focus();
					return false;
				}
			}
			
			for(var i=0;i<nickname.length;i++){
				if(nickname.charAt(i)==" "){
					alert("별명에 공백이 올 수 없습니다");
					$('input[name=nickname]').focus();
					return false;
				}
			}

			if(userid.length<8){
				alert("아이디는 최소 8자리 이상이어야 합니다");
				return false;
			}
			
			if(userpw.length<8){
				alert("비밀번호는 최소 8자리 이상이어야 합니다");
				return false;
			}
			
			$('#signUpForm').submit();
		}
			
		$('.btn-signUp').click(function(event){
			event.preventDefault();
			formCheck();
		});
		
		$('.btn-findId').click(function(event){
			event.preventDefault();
		});
		
		$('.btn-modInfo').click(function(event){
			event.preventDefault();
		});
		
	});
</script>

</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<!-- container -->
	<div class="container first-main-container text-center" style="min-height:650px;">
		<div class="row">
			<div class="col-sm-3"></div>
			
			
			<div class="col-sm-6">
				<!-- Sign Up Form -->
				<form action="/member/signup" method="post" id="signUpForm">
				<div class="inbox">		
						<h4 align="left">회원가입</h4>
						<div class="form-group">
							<input type="text" name="userid" class="form-control" placeholder="USER ID" />
						</div>
						<div class="form-group">
							<input type="password" name="userpw" class="form-control" placeholder="USER PW" />
						</div>
				</div>
				<div class="inbox">
						<div class="form-group">
							<input type="text" name="username" class="form-control" placeholder="USER NAME" />
						</div>
						<div class="form-group">
							<input type="text" name="email" class="form-control" placeholder="EMAIL" />
						</div>
						<div class="form-group">
							<input type="text" name="nickname" class="form-control" placeholder="NICKNAME" />
						</div>
				</div>
				<div class="inbox">
					<div class="btn-group">		
						<button class="btn btn-md btn-default btn-signUp">가입하기</button>
						<!-- <button class="btn btn-md btn-default btn-findId">아이디찾기</button> -->
						<!-- <button class="btn btn-md btn-default btn-modInfo">회원정보변경</button> -->
					</div>
				</div>
				</form>
			</div>
			
			<div class="col-sm-3"></div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>