<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community Board Modify</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
	*{margin:0px; padding:0px;}
	body{height:auto; background-color:#f2f2f2;}
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
	
	.table{margin-bottom:0px;}
	.table>thead>tr>th{text-align:center; vertical-align:middle; color:#809fff; height:40px; }
	.table>tbody>tr>td{font-size:10pt; margin:0px; border:0px; padding:15px;}
	td{font-size:10pt; margin:0px; border:0px; padding:15px;}
	.col-sm-1 .col-sm-2 .col-sm-3
	.col-sm-4 .col-sm-5 .col-sm-6
	.col-sm-7 .col-sm-8 .col-sm-9
	.col-sm-10 .col-sm-11 .col-sm-12
	{margin:0px; padding:10px;}
	.inbox{background-color:white; border:1px solid #c2c2d6; margin-top:10px;}
	textarea{border:1px solid #c2c2d6; width:100%; min-height:300px;}
	
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<form role="form" method="post">
		<input type="hidden" name="page" value="${searchPageVO.page}">
		<input type="hidden" name="perPageNum" value="${searchPageVO.perPageNum}">
		<input type="hidden" name="searchType" value="${searchPageVO.searchType}">
		<input type="hidden" name="keyword" value="${searchPageVO.keyword}">	
		<input type="hidden" name="bno" value="${boardVO.bno}">
		<input type="hidden" name="writer" value="${boardVO.writer}">
		<input type="hidden" name="title" value=''>
		<input type="hidden" name="content" value=''>
	</form>
	
		<!-- Read Form -->
		<div class="container first-main-container text-center">
			<div class="row">
				<div class="col-sm-9">
					<div class="inbox">
						<table class="table">
							<tr style="background-color:#ededf7;">
								<td align="left" style="padding-bottom:3px; font-size:11pt;">
									<strong>\#${boardVO.bno}&nbsp;<input type="text" id="titleTemp" value="${boardVO.title}" style="border:1px solid #c2c2d6; width:75%;"></strong>
								</td>
								<td align="right" style="padding-bottom:3px; color:blue;">&nbsp;${boardVO.writer}</td>
							</tr>
							<tr style="background-color:#ededf7;">
								<td align="left" style="padding-top:3px;"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardVO.regdate}"/></td>
								<td align="right" style="padding-top:3px;">조회 : <strong>${boardVO.viewcnt}</strong></td>
							</tr>
							<tr>
								<td colspan="2" align="left">
									<div style="min-height:150px;"><textarea id="contentTemp">${boardVO.content}</textarea></div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div align="center">
										<button type="submit" class="btn btn-sm btn-default" id="save">SAVE</button>
										<button type="submit" class="btn btn-sm btn-default" id="cancel">CANCEL</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	
	
<script type="text/javascript">
	$(document).ready(function(){
		
		var formObj=$("form[role='form']");
		
		$('#save').click(function(event){
			$("input[name=title]").val($('#titleTemp').val());
			$("input[name=content]").val($('#contentTemp').val());
			formObj.attr("action", "/comboard/modify");
			formObj.submit();
		});
		
		$('#cancel').click(function(event){
			self.location="/comboard/listPage?page=${searchPageVO.page}"+
									"&perPageNum=${searchPageVO.perPageNum}"+
									"&searchType=${searchPageVO.searchType}"+
									"&keyword=${searchPageVO.keyword}";
		});
		
	});
</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>