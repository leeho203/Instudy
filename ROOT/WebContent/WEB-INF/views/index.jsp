<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index Page</title>


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<style>
	*{margin:0px; padding:0px;}
	body{height:auto; background-color:#f2f2f2; font-size:9pt;}
	.row{margin:0px; padding:0px;}
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
		padding-right: 0px;
		padding-left: 10px;
	}
	
	.container {
	    padding-right: 0px;
	    padding-left: 0px;
	    margin-right: auto;
	    margin-left: auto;
	}
	
	.table>thead>tr>th{text-align:center; vertical-align:middle; color:#809fff; height:40px;}
	.table>tbody>tr>td{border-top:0px;}
	.inbox{background-color:white; margin-top:2px;}
	.grayBox{background-color:#F0F0F0; border:1px solid #c2c2d6; margin-top:10px;}
		
	div.boardTitle{font-size:10pt; font-family:나눔고딕;}
	
	/* unvisited link */
	a:link {
	    color: #2d2db9;
	}
	
	/* visited link */
	a:visited {
	    color: #2d2db9;
	}
	
	@media (min-width: 0px){
		.first-main-container{
	 		 	margin-top:50px;
 		}
	 		
 		.container-fluid-main{
 			height:50px;
 		}
 		
 		.handleOverflow{
 			width:150px;
 		}
 		
 		.col-sm-handle-padding{
 			padding-left:0px;
 		}
	}
	
	@media (min-width: 300px){
		.first-main-container{
	 		 	margin-top:50px;
 		}
	 		
 		.container-fluid-main{
 			height:50px;
 		}
 		
 		.handleOverflow{
 			width:150px;
 		}
 		
 		.col-sm-handle-padding{
 			padding-left:0px;
 		}
	}
	
	@media (min-width: 768px){
		.first-main-container{
		 	margin-top:120px;
		}
		
		.container-fluid-main{
			height:60px;
		}
		
		.handleOverflow{
 			width:150px;
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
		
		.handleOverflow{
 			width:190px;
 		}
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

</head>
<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<jsp:useBean id="now" class="java.util.Date"/>
	<fmt:formatDate var="nowdate" value="${now}" pattern="yyyy-MM-dd"/>
	
	<div class="container first-main-container text-center">
	
	<!-- 스터디 / 커뮤니티 / 구인구직 table container -->
		<div class="row">
			<div class="col-sm-8 col-sm-handle-padding">
				<div class="row">
					<div class="col-sm-6">
					<div class="grayBox">
						<div class="boardTitle" style="text-align:left; margin:10px 5px; padding-right:5px; font-family:나눔;">
							<strong>스터디</strong>
							<a href='/stuboard/listPage?page=1'>
								<span class="glyphicon glyphicon-option-horizontal" style="float:right; padding-top:5px;"></span>
							</a>
						</div>
						<div class="inbox">	
							<table class="table table-condensed table-hover" style="margin:0px;">
									<c:forEach items="${stuBoardList}" var="stuBoardList">
										<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
											<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
												<a href='/stuboard/read?bno=${stuBoardList.bno}'>
													<div class="handleOverflow" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${stuBoardList.title}</div>
												</a>
											</td>
											<td align='right' style="vertical-align:middle; padding:5px 10px 5px 0px;">${stuBoardList.writer}</td>
										</tr>
									</c:forEach>
							</table>	
						</div>
					</div>
					</div>
					
					<div class="col-sm-6">
					<div class="grayBox">
						<div class="boardTitle" style="text-align:left; margin:10px 5px; padding-right:5px; font-family:나눔;">
							<strong>커뮤니티</strong>
							<a href='/comboard/listPage?page=1'>
								<span class="glyphicon glyphicon-option-horizontal" style="float:right; padding-top:5px;"></span>
							</a>
						</div>
						<div class="inbox">
							<table class="table table-condensed table-hover" style="margin:0px;">
									<c:forEach items="${comBoardList}" var="comBoardList">
										<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
											<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
												<a href='/comboard/read?bno=${comBoardList.bno}'>
													<div class="handleOverflow" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${comBoardList.title}</div>
												</a>	
											</td>
											<td align='right' style="vertical-align:middle; padding:5px 10px 5px 0px;">${comBoardList.writer}</td>
										</tr>
									</c:forEach>
							</table>	
						</div>
					</div>
					</div>
					
					<div class="col-sm-12">
					<div class="grayBox">
						<div class="boardTitle" style="text-align:left; margin:10px 5px; padding-right:5px; font-family:나눔;">
							<strong>채용공고</strong>
							<a href='/tblsaramin/listPage?page=1'>
								<span class="glyphicon glyphicon-option-horizontal" style="float:right; padding-top:5px;"></span>
							</a>
						</div>
						<div class="inbox">
							<table class="table table-condensed table-hover" style="margin:0px;">
									<c:forEach items="${tblSaraminList}" var="tblSaraminList">
										<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
											<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
												<a href='/tblsaramin/read?id=${tblSaraminList.id}'>
													${tblSaraminList.positionTitle}
												</a>
											</td>
											<td align="right" style="vertical-align:middle; padding:5px 10px 5px 0px;">${tblSaraminList.companyName}</td>	
										</tr>
									</c:forEach>
							</table>	
						</div>
					</div>
					</div>			
				</div>
			</div>
		
		
			
			
			<div class="col-sm-4">
				<div class="grayBox">
				<div class="boardTitle" style="text-align:left; margin:10px 5px; padding-right:5px; font-family:나눔;">
					<strong>HIT</strong>
					<!-- <a href='#'>
						<span class="glyphicon glyphicon-option-horizontal" style="float:right; padding-top:5px;"></span>
					</a> -->
				</div>
				<div class="inbox">
					<table class="table table-condensed table-hover" style="margin:0px;">
						<c:forEach items="${stuBestBoardList}" var="stuBestBoardList">
							<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
								<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
									<a href='/stuboard/read?bno=${stuBestBoardList.bno}'>
										<div class="handleOverflow" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${stuBestBoardList.title}</div>
									</a>
								</td>
								<td align='right' style="vertical-align:middle; padding:5px 10px 5px 0px;">${stuBestBoardList.writer}</td>
							</tr>
						</c:forEach>
					</table>	
				</div>
				<div class="inbox">
					<table class="table table-condensed table-hover" style="margin:0px;">
						<c:forEach items="${comBestBoardList}" var="comBestBoardList">
							<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
								<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
									<a href='/comboard/read?bno=${comBestBoardList.bno}'>
										<div class="handleOverflow" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${comBestBoardList.title}</div>
									</a>
								</td>
								<td align='right' style="vertical-align:middle; padding:5px 10px 5px 0px;">${comBestBoardList.writer}</td>
							</tr>
						</c:forEach>
					</table>	
				</div>
				<div class="inbox">
					<table class="table table-condensed table-hover" style="margin:0px;">
							<c:forEach items="${tblSaraminBestList}" var="tblSaraminBestList">
								<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
									<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
										<a href='/tblsaramin/read?id=${tblSaraminBestList.id}'>
											${tblSaraminBestList.positionTitle}
										</a>
									</td>
									<td align="right" style="vertical-align:middle; padding:5px 10px 5px 0px;">${tblSaraminBestList.companyName}</td>	
								</tr>
							</c:forEach>
					</table>	
				</div>
			</div>
		</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	
	
	
</body>
</html>