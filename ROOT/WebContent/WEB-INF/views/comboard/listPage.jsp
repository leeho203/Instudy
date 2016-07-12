<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community Board List Page</title>

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
	
	.table>thead>tr>th{text-align:center; vertical-align:middle; color:#8585e0; height:40px; border-bottom:0px solid #f0f0f0; background-color:#f8f8f8;}
	.table>tbody>tr>td{border-top:1px solid #f0f0f0;}
	.inbox{background-color:white; border:1px solid #c2c2d6; margin-top:10px;}
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
 			width:300px;
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
 			width:160px;
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
 			width:200px;
 		}
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script>
		$(document).ready(function(){
			
			$("#searchBtn").click(function(){
				self.location="/comboard/listPage"
								+"${pageMaker.makeQuery(1)}"
								+"&searchType="
								+$("select option:selected").val()
								+"&keyword="
								+$("#keywordInput").val();
			});
			
			$("#newBtn").click(function(){
				self.location="/comboard/regist";
			});
			

		});
	
</script>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<!-- container -->
	<div class="container first-main-container text-center">
		
		<!-- main table -->
		<div class="row">
			<div class="col-sm-9">
			
				<!-- main table -->
				<div class="inbox">
					<table class="table table-condensed table-hover" style="margin:0px;">
						<thead>
							<tr>
								<th width='40px'>번호</th>
								<th>제목</th>
								<th width='70px'>글쓴이</th>
								<th width='60px'>날짜</th>
								<th width='40px'>조회</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${list}" var="boardVO">
								<tr style="height:40px;">
									<td align="left" style="vertical-align:middle;">${boardVO.bno}</td>
									<td align='left' style="vertical-align:middle; word-break:break-all;">
										<a href='/comboard/read${pageMaker.makeSearchQuery(pageMaker.pageVO.page)}&bno=${boardVO.bno}'>${boardVO.title}</a>
										<span style='color:red;'><b>[${boardVO.replycnt}]</b></span>	
									</td>
									<td align='left' style="vertical-align:middle;">${boardVO.writer}</td>
									<td style="vertical-align:middle;">
										<jsp:useBean id="now" class="java.util.Date"/>
										<fmt:formatDate var="nowdate" value="${now}" pattern="yyyy-MM-dd"/>
										<fmt:formatDate var="regdate" value="${boardVO.regdate}" pattern="yyyy-MM-dd"/>
										
										<c:if test='${regdate < nowdate}'>
											<fmt:formatDate pattern="yy-MM-dd" value="${boardVO.regdate}"/>
										</c:if>
										<c:if test='${regdate >= nowdate}'>
											<fmt:formatDate pattern="HH:mm" value="${boardVO.regdate}"/>
										</c:if>
									</td>
									<!-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.moddate}"/></td> -->
									<td align="right" style="vertical-align:middle;">${boardVO.viewcnt}</td>	
								</tr>
							</c:forEach>
						</tbody>
					</table>				
				</div>
			
				<!-- search bar -->
				<div class="inbox" style="margin-top:10px;">
					<select name="searchType" style="height:30px;">
						<option value="n" <c:out value="${searchPageVO.searchType==null?'selected':''}"/>>
						-----
						</option>
						
						<option value="t" <c:out value="${searchPageVO.searchType eq 't'?'selected':''}"/>>
						제목
						</option>
						
						<option value="c" <c:out value="${searchPageVO.searchType eq 'c'?'selected':''}"/>>
						내용
						</option>
						
						<option value="w" <c:out value="${searchPageVO.searchType eq 'w'?'selected':''}"/>>
						글쓴이
						</option>
						
						<option value="tcw" <c:out value="${searchPageVO.searchType eq 'tcw'?'selected':''}"/>>
						All
						</option>
					</select>
					
					<input type="text" name="keyword" id="keywordInput" value="${searchPageVO.keyword}" style='width:30%; height:30px;'>
					<div class="btn-group">
						<button class="btn btn-sm btn-default" id="searchBtn">검색</button>
						<button class="btn btn-sm btn-default" id="newBtn">글쓰기</button>
					</div>
				</div>
			
				<!-- pagination -->
				<ul class="pagination pagination-sm" style="margin-top:10px;">
					<c:if test="${pageMaker.prev}">
						<li><a href="listPage${pageMaker.makeSearchQuery(pageMaker.startPage-1)}">&laquo;</a></li>
					</c:if>
			
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.pageVO.page==idx?'class=active':''}"/>><a href="listPage${pageMaker.makeSearchQuery(idx)}">${idx}</a></li>
					</c:forEach>
			
					<c:if test="${pageMaker.next}">
						<li><a href="listPage${pageMaker.makeSearchQuery(pageMaker.endPage+1)}">&raquo;</a><li>
					</c:if>
				</ul>
			</div>
			<div class="col-sm-3">
				<div class="grayBox">
					<div class="boardTitle" style="text-align:left; margin:10px 5px; padding-right:5px; font-family:나눔;">
						<strong>HIT</strong>
					</div>
					<table class="table table-condensed table-hover" style="margin:0px; background-color:white;">
							<c:forEach items="${bestList}" var="bestList">
								<tr style="height:35px; border-bottom:1px solid #f0f0f0;">
									<td align='left' style="vertical-align:middle; padding:5px 0px 5px 10px;">
										<a href='/stuboard/read?bno=${bestList.bno}'>
											<div class="handleOverflow" style="text-overflow:ellipsis; overflow:hidden; white-space:nowrap;">${bestList.title}</div>
										</a>
									</td>
								</tr>
							</c:forEach>
					</table>	
				</div>
			</div>
		</div>
		
		

	</div>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>