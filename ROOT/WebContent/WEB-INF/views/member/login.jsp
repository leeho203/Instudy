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
	.form-group{margin-top:15px; height:auto;}
	
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
		$('.btn-login').click(function(event){
			var userid=$('input[name=userid]').val();
			var userpw=$('input[name=userpw]').val();
			
			
			if(userid==''||userid==null){
				alert("아이디를 입력하세요");
				return false;
			};
			
			if(userpw==''||userpw==null){
				alert("비밀번호를 입력하세요");
				return false;
			};

			$('form[role=form]').submit();
		});
		
		$('.btn-signUp').click(function(event){
			event.preventDefault();
			self.location="/member/signup";
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
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<!-- Login Form -->
				<div class="inbox" style="min-height:200px;">
				<form action="/member/loginPost" method="post" role="form">
						<h4 align="left">로그인</h4>
						<div class="form-group">
							<input type="text" name="userid" class="form-control" placeholder="USER ID" />
						</div>
						<div class="form-group">
							<input type="password" name="userpw" class="form-control" placeholder="USER PW" />
						</div>
						
						<div class="form-group">
							<div style="float:left; width:50%; text-align:left;">
								<label><input type="checkbox" name="useCookie">자동로그인</label>
							</div>
							<div style="float:left; width:50%; text-align:right;">
								<div class="btn-group">
									<input type='button' class="btn btn-md btn-default btn-signUp" value='회원가입'>
									<input type='button' class="btn btn-md btn-default btn-login" value='로그인'>
								</div>
							</div>							
						</div>
				</form>
				</div>
			</div>
			
			<div class="col-sm-2"></div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>