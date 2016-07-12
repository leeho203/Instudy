<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Study Board Register</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<style>
	*{margin:0px; padding:0px;}
	body{height:auto; background-color:#f2f2f2; font-size:9pt;}
	.row{margin:0px;}
	.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3,
	.col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9,
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
	.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9,
	.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3,
	.col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9,
	.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
		position: relative;
		min-height: 1px;
		padding-right: 5px;
		padding-left: 5px;
	}
	
	.container {
	    padding-right: 0px;
	    padding-left: 0px;
	    margin-right: auto;
	    margin-left: auto;
	}
	
	.table{margin:0px;}
	.inbox{background-color:white; border:1px solid #c2c2d6; margin-top:10px; padding:10px;}
	.form-group{margin:15px 0px 0px 0px;}
	
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
	
	$('.btn-regist').click(function(event){
		event.preventDefault();
		
		var title=$('input[name=title]');
		var isAllBlank=true;
		
		if(title.val()==''||title.val()==null){
			alert("제목을 입력하세요");
			title.focus();
			return false;
		}
		
		for(var i=0;i<title.val().length;i++){
			if(title.val().charAt(i)!=' '){
				isAllBlank=false;
			}
		}
		
		console.log(isAllBlank);
		
		if(isAllBlank){
			alert("제목이 모두 공백입니다");
			return false;
		}
		
		$("#registForm").submit();
		
	});
});

</script>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<!-- Registration Form -->
	<div class="container first-main-container text-center">
		<div class="row">			
			<div class="col-sm-9">
				<!-- Registration Form -->
				<form role="form" method="post" action="/stuboard/regist" id="registForm">
					<div class="inbox" style="background-color:#ededf7;">
						<h4 style="text-align:left; margin:0px;">글 작성</h4>
					</div>
					<div class="inbox">
						<div class="form-group" style="margin-top:0px;">
							<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요">
						</div>
						<div class="form-group">
							<input type="text" name="writer" class="form-control" value='${login.userid}' readonly>
						</div>
						<div class="form-group">
							<textarea name="content" rows="20" class="form-control" placeholder="내용을 입력하세요"></textarea>
						</div>
					</div>
					<div class="inbox">	
						<input type="button" class="btn btn-sm btn-default btn-regist" value="등록">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>