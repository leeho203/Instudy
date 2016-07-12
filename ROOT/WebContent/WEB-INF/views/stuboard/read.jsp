<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Study Board Read</title>
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
	
	.table{margin-bottom:0px;}
	.table>thead>tr>th{text-align:center; vertical-align:middle; color:#809fff; height:40px; }
	.table>tbody>tr>td{margin:0px; border:0px; padding:15px;}
	td{margin:0px; border:0px; padding:15px;}
	
	.inbox{background-color:white; border:1px solid #c2c2d6; margin-top:10px;}
	.grayBox{background-color:#F0F0F0; border:1px solid #c2c2d6; margin-top:10px;}
	div.boardTitle{font-size:10pt; font-family:나눔고딕;}
	
	.col-sm-9 .replybox{padding:5px;}
	textarea{border:1px solid #c2c2d6;}
	
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


</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<form class="form-horizontal" role="form" method="post">
		<input type="hidden" name="page" value="${searchPageVO.page}">
		<input type="hidden" name="perPageNum" value="${searchPageVO.perPageNum}">
		<input type="hidden" name="searchType" value="${searchPageVO.searchType}">
		<input type="hidden" name="keyword" value="${searchPageVO.keyword}">
		<input type="hidden" name="bno" value="${boardVO.bno}">
		<input type="hidden" name="title" value="${boardVO.title}">
		<input type="hidden" name="writer" value="${boardVO.writer}">
		<input type="hidden" name="content" value="${boardVO.content}">
	</form>		
	
	<!-- Read Form -->
	<div class="container first-main-container text-center">
		<div class="row">
			<div class="col-sm-9">
			
			<!-- main table -->
			<div class="inbox">
				<table class="table">
					<tr style="background-color:#ededf7;">
						<td align="left" style="padding-bottom:3px; font-size:11pt; word-break:break-all;"><strong>\#${boardVO.bno}&nbsp;${boardVO.title}</strong></td>
						<td align="right" style="padding-bottom:3px; color:blue;">&nbsp;${boardVO.writer}</td>
					</tr>
					<tr style="background-color:#ededf7;">
						<td align="left" style="padding-top:3px;">
								<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardVO.regdate}"/>
						</td>
						<td align="right" style="padding-top:3px;">조회 : <strong>${boardVO.viewcnt}</strong></td>
					</tr>
					<tr>
						<td colspan=2 align="left" style="word-break:break-all;"><div style="min-height:150px;" id="contentTemp"><!-- ${boardVO.content} --></div></td>
					</tr>
					<tr>
						<td colspan=2>
							<c:if test='${login.userid == boardVO.writer}'>
								<button type="submit" class="btn btn-sm btn-default" id="modify">MODIFY</button>
								<button type="submit" class="btn btn-sm btn-default" id="remove">REMOVE</button>
							</c:if>
							<button type="submit" class="btn btn-sm btn-default" id="listPage">LIST</button><br>
						</td>
					</tr>
				</table>
			</div>
			
				<!-- Reply Form -->
				<c:if test='${not empty login}'>
				<div class="inbox">
					<table class="table">
						<tr>
							<td width="85%" style="padding-right:5px;">
								<input type="hidden" id="newReplyWriter" value='${login.userid}'>
								<textarea id="newReplyText" rows="5" style="width:100%;"></textarea>
							</td>
							<td width="15%" style="padding-left:5px;">
								<button type="submit" class="replyAddBtn btn btn-sm btn-default" style="width:100%; height:100%">댓글작성</button>
							</td>
						</tr>
					</table>
				</div>
				</c:if>
			
			
				<div class="inbox">
					<div class="replycnt" style="background-color:#ededf7; height:35px; text-align:left; padding:10px 15px;">댓글&nbsp;<strong>${boardVO.replycnt}</strong></div>
					<table class="table replyList"></table>
				</div>
				
				<div class="page"></div>
			
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
	


<script>
Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month=dateObj.getMonth()+1;
	var date=dateObj.getDate();
	var hours=dateObj.getHours();
	var minutes=dateObj.getMinutes();
	var seconds=dateObj.getSeconds();
	return year+"/"+month+"/"+date+" "+hours+":"+minutes+":"+seconds;
});

Handlebars.registerHelper("eqReplyer", function(replyer, block){
	var accum='';
	if(replyer=='${login.userid}'){
		accum+=block.fn();
	}
	return accum;
});

Handlebars.registerHelper('breaklines', function(text) {
    text = Handlebars.Utils.escapeExpression(text);
    text = text.replace(/(\r\n|\n|\r)/gm, '<br>');
    return new Handlebars.SafeString(text);
});
</script>


<script id="template" type="text/x-handlebars-template">
{{#each .}}
<div class="replyLi" data-rno={{rno}} style="border-bottom:1px solid #c2c2d6;">
	<div class="row">
		<div class="col-sm-9" style="width:85%; text-align:left;">
			<div class="replybox">
				<strong>\#{{rno}}</strong>&nbsp;
				<span class="writer" style="color:blue;">{{replyer}}</span><br>
				<span class="time">{{prettifyDate regdate}}</span>
			</div>
			<div class="replybox replytext">{{breaklines replytext}}</div>
		</div>
		<div class="col-sm-3" style="width:15%;">
			{{#eqReplyer replyer}}
				<div class="btn-group-vertical replybox">
					<button type="submit" class="btn btn-sm btn-default replyModBtn">수정</button>
					<button type="submit" class="btn btn-sm btn-default replyDelBtn">삭제</button>
				</div>
			{{/eqReplyer}}
		</div>
	</div>
</div>
{{/each}}

</script>

<script>
	var bno = ${boardVO.bno};
	var replyPage = 1;
	
	function getPage(pageInfo){
		
		$.getJSON(pageInfo, function(data){
			printData(data.list, $(".replyList"), $("#template"));
			printPaging(data.pageMaker, $(".page"));
			$('.replycnt').html("댓글&nbsp;<strong>"+data.pageMaker.totalCount+"</strong>");
		});
		
	}
	
	var printData = function(replyArr, target, templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(replyArr);
		$(".replyLi").remove();
		target.html(html);
	}
	
	var printPaging = function(pageMaker, target){
		$(".pagination").remove();
		
		var str="";
		str+="<ul class='pagination'>";
		if(pageMaker.prev){
			str+="<li><a href='"+(pageMaker.startPage-1)+"'><<</a></li>";
		}
		
		for(var i=pageMaker.startPage, len=pageMaker.endPage ; i<=len ; i++){
			var classActive=pageMaker.pageVO.page==i?'class=active':'';
			str+="<li "+classActive+"><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(pageMaker.next){
			str+="</li><a href='"+(pageMaker.endPage+1)+"'>>></a></li>";
		}
		str+="</ul>"
		
		target.after(str);
		
	}
	
	$(document).on("click", ".pagination > li > a", function(event){
		event.preventDefault();
		replyPage=$(this).attr("href");
		getPage("/stureply/"+bno+"/"+replyPage);
	});
</script>

<script>
	$(document).ready(function(event){
		
		/*	개행문자를 <br>로 바꿔서 #contentTemp에 출력	*/
		var content=$('input[name=content]').val().replace(/(\r\n|\n|\r)/gm, '<br>');
		$('#contentTemp').html(content);
		
		
		var formObj=$("form[role='form']");
		
		$("#modify").click(function(){
			formObj.attr("action", "/stuboard/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$("#remove").click(function(){
			formObj.attr("action", "/stuboard/remove");
			formObj.submit();
		});
		
		$("#listPage").click(function(){
			formObj.attr("action", "/stuboard/listPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

	
		getPage("/stureply/"+bno+"/"+replyPage);
		
		$('.replyAddBtn').click(function(){
			var replyerObj=$("#newReplyWriter");
			var replytextObj=$("#newReplyText");
			var replyer=replyerObj.val();
			var replytext=replytextObj.val();
			
			$.ajax({
				type:'post',
				url:'/stureply/',
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				dataType:'text',
				data:JSON.stringify({bno:bno, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result : "+result);
					if(result=='SUCCESS'){
						replyPage=1;
						getPage("/stureply/"+bno+"/"+replyPage);
						replytextObj.val("");
					}
				}
				
			});
		});
		
		$(document).on("click", ".replyModBtn", function(){
			
			var replytext = $(this).parent().parent().siblings('.col-sm-9').children('.replytext').html();
			replytext = replytext.replace(/<br ?\/?>/g, "\r\n");
			
			$(this).parent().parent().siblings('.col-sm-9').children('.replytext').html("<textarea class='inputtext' rows='10' style='width:100%;'>"+replytext+"</textarea>");
			$(this).parent().append("<button type='submit' class='btn btn-sm btn-default replyConModBtn'>수정</button>"+
									"<button type='submit' class='btn btn-sm btn-default replyNotModBtn'>취소</button>");
			$(this).siblings('.replyDelBtn').remove();
			$(this).remove();	
		});
		
		$(document).on("click", ".replyDelBtn", function(){
			var rno=$(this).parent().parent().parent().parent().attr("data-rno");
			console.log(rno);
			
			$.ajax({
				type:'delete',
				url:'/stureply/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-method-Override":"DELETE"
				},
				dataType:'text',
				success:function(result){
					console.log("result : "+result);
					if(result=='SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/stureply/"+bno+"/"+replyPage);
					}
				}
			});
			
		});
		
		$(document).on("click", ".replyNotModBtn", function(){		//	수정취소 버튼 눌렀을 때 이벤트 처리
			getPage("/stureply/"+bno+"/"+replyPage);
		});
		
		$(document).on("click", ".replyConModBtn", function(){		//	수정하기 버튼 눌렀을 때 이벤트 처리
			var rno=$(this).parent().parent().parent().parent().attr("data-rno");
			var replytext=$(this).parent().parent().siblings('.col-sm-9').children('.replytext').children('.inputtext').val();
			
			$.ajax({
				type:'put',
				url:'/stureply/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-method-Override":"PUT"
				},
				data:JSON.stringify({replytext:replytext}),
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/stureply/"+bno+"/"+replyPage);
					}
				}
			});
		});
	
	});
</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>