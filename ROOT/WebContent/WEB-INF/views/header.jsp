<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Header</title>
<style>

	@media (min-width: 300px){
		div.container-fluid-main {
		    height: 50px;
		    background-color:#6666ff;
		}
		
		div.navbar-header{
			margin-top:-5px;
		}
	}
	
	@media (min-width: 768px){
		div.container-fluid-main {
		    height: 70px;
		    background-color:#ffffff;
		    
		}
		
		div.navbar-header{
			margin-top:5px;
		}
	}	
	
	@media (min-width: 992px){
		div.container-fluid-main {
		    height: 70px;
		    background-color:#ffffff;
		}
		
		div.navbar-header{
			margin-top:5px;
		}
	}
	
	
	
	
</style>
</head>
<body>
<!-- Navigation Bar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid container-fluid-main" style="border:0px;">
			<div class="container">
			
				<div class="navbar-header">
					<button type="button" class='navbar-toggle' data-toggle='collapse' data-target='#myNavbar' style='background-color:black; margin-top:12px;'>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" style="color:black;" href="/">
						<img src="/resources/glyphicon-book-closed-sm.png" style="float:left; width:30px;"/>&nbsp;&nbsp;<strong style="font-family:나눔고딕; font-size:14pt; line-height:30px;">인스터디</strong>
					</a>
					<a class="navbar-brand" style="color:black;" href="#"><!-- 검색창 넣을 곳 --></a>
				</div>
				
				<ul class="nav navbar-nav">
					
					
				</ul>
				
			</div>
		</div>
		
		
		<div class="container-fluid" style="background-color:#333333; border:0px;">
			<div class="container">	
			
				<div id="myNavbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav">
						<li><a href="/schedule/page">SCHEDULER</a></li>
						<li><a href="/stuboard/listPage">STUDY</a></li>
						<li><a href="/comboard/listPage">COMMUNITY</a></li>
						<li><a href="/tblsaramin/listPage">JOBS</a></li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
					<c:if test='${empty login}'>
						<li><a href="/member/signup"><span class="glyphicon glyphicon-user"></span>SignUp</a></li>
						<li><a href="/member/login"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
					</c:if>
					<c:if test='${not empty login}'>
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>${login.userid}</a></li>
						<li><a href="/member/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
					</c:if>
					</ul>
				</div>
				
			</div>
		</div>
	</nav>
</body>
</html>


