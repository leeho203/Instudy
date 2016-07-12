<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tbl Saramin Read</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
	*{margin:0px; padding:0px; border:0px;}
	body{height:auto; background-color:#f2f2f2;}
	.row{margin:0px; width:auto; height:auto; text-align:center;}
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
	
	
	table>tbody>tr>td>table{width:auto; height:auto; margin:0px; padding:0px; align:center;}
	table>tbody>tr>td>table>tr{width:100%; height:auto;}
	.table{margin-bottom:0px;}
	.table>thead>tr>th{text-align:center; vertical-align:middle; color:#809fff; height:40px; }
	.table>tbody>tr>td{font-size:10pt; margin:0px; border:0px; padding:15px; width:auto;}
	.table>tbody>tr{width:auto;}
	td{font-size:10pt; margin:0px; border:0px; padding:15px;}
	table{margin:0px; padding:0px;}
	#company_contents>table>tbody>tr>td{padding:10px;}
	
	.inbox{background-color:white; border:1px solid #c2c2d6; margin-top:10px;}
	.col-sm-9 .replybox{padding:5px;}
	textarea{border:1px solid #c2c2d6;}
	
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
	
	<form class="form-horizontal" role="form" method="post">
		<input type="hidden" name="page" value="${searchPageVO.page}">
		<input type="hidden" name="perPageNum" value="${searchPageVO.perPageNum}">
		<input type="hidden" name="searchType" value="${searchPageVO.searchType}">
		<input type="hidden" name="keyword" value="${searchPageVO.keyword}">
		<input type="hidden" name="id" value="${saraminVO.id}">
	</form>		
	
	<!-- ajax로 schedule 등록할 때 사용할 data -->
	<input type="hidden" name="title" value="${saraminVO.companyName} 채용마감">
	<input type="hidden" name="writer" value="${login.userid}">
	<input type="hidden" name="expiration" value="<fmt:formatDate pattern="yyyy-MM-dd'T'HH:mm:ss'Z'" value="${saraminVO.expiration}"/>">
	
	<!-- Read Form -->
	<div class="container first-main-container text-center">
		<div class="row">
			<div class="col-sm-12">
			
			<!-- main table -->
			<div class="inbox">
				<table class="table">
					<tr style="background-color:#ededf7;">
						<td align="left" style="padding-bottom:3px; font-size:11pt;"><strong>${saraminVO.companyName} ${saraminVO.positionTitle}</strong></td>
						<td align="right" style="padding-bottom:3px; color:blue;">&nbsp; <!-- saraminVO.writer --> </td>
					</tr>
					<tr style="background-color:#ededf7;">
						<td align="left" style="padding-top:3px;">
								<fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${saraminVO.opening}"/> ~
								<fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${saraminVO.expiration}"/>
						</td>
						<td align="right" style="padding-top:3px;">조회 : <strong>${saraminVO.viewcnt}</strong></td>
					</tr>
					<tr>
						<td colspan=2 align="left">
							<div style="min-height:150px;" id="content"><!-- contentTemp -->
								<a href="${saraminVO.url}" target="new" name="url">
									<input type="button" class="btn btn-sm btn-default" value="채용정보URL"/>
								</a>
								
								<c:if test='${not empty login}'>
									<input type="button" class="btn btn-sm btn-default scheduleBtn" value="스케쥴러등록"/><br>
								</c:if>
								<!-- ${saraminVO.positionLocation}<br>
								${saraminVO.positionJobType}<br>
								${saraminVO.positionIndustry}<br>
								${saraminVO.positionOpenQuantity}<br>
								${saraminVO.positionExperienceLevel}<br>
								${saraminVO.positionRequiredEducationLevel}<br> -->
								${saraminVO.content}
							</div>
						</td>
					</tr>
					<tr>
						<td colspan=2>
							<c:if test='${not empty loginAdmin}'>
								<!-- <button type="submit" class="btn btn-sm btn-default" id="modify">MODIFY</button>  -->
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
							<td style="padding-right:5px; width:87%;">
								<input type="hidden" id="newReplyWriter" value='${login.userid}'>
								<textarea id="newReplyText" rows="5" style="width:100%;"></textarea>
							</td>
							<td style="padding-left:5px; width:13%;">
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
	var bno = ${saraminVO.id};
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
		getPage("/saraminreply/"+bno+"/"+replyPage);
	});
	
	
	
	
</script>

<script>
	$(document).ready(function(event){
		
		var formObj=$("form[role='form']");
		
		/*$("#modify").click(function(){
			formObj.attr("action", "/tblsaramin/modify");
			formObj.attr("method", "get");
			formObj.submit();
		});*/
		
		$("#remove").click(function(){
			formObj.attr("action", "/tblsaramin/remove");
			formObj.submit();
		});
		
		$("#listPage").click(function(){
			formObj.attr("action", "/tblsaramin/listPage");
			formObj.attr("method", "get");
			formObj.submit();
		});

		getPage("/saraminreply/"+bno+"/"+replyPage);
		
		$('.replyAddBtn').click(function(){
			var replyerObj=$("#newReplyWriter");
			var replytextObj=$("#newReplyText");
			var replyer=replyerObj.val();
			var replytext=replytextObj.val();
			
			$.ajax({
				type:'post',
				url:'/saraminreply/',
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
						getPage("/saraminreply/"+bno+"/"+replyPage);
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
				url:'/saraminreply/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-method-Override":"DELETE"
				},
				dataType:'text',
				success:function(result){
					console.log("result : "+result);
					if(result=='SUCCESS'){
						alert("삭제 되었습니다.");
						getPage("/saraminreply/"+bno+"/"+replyPage);
					}
				}
			});
			
		});
		
		$(document).on("click", ".replyNotModBtn", function(){		//	수정취소 버튼 눌렀을 때 이벤트 처리
			getPage("/saraminreply/"+bno+"/"+replyPage);
		});
		
		$(document).on("click", ".replyConModBtn", function(){		//	수정하기 버튼 눌렀을 때 이벤트 처리
			var rno=$(this).parent().parent().parent().parent().attr("data-rno");
			var replytext=$(this).parent().parent().siblings('.col-sm-9').children('.replytext').children('.inputtext').val();
			
			$.ajax({
				type:'put',
				url:'/saraminreply/'+rno,
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-method-Override":"PUT"
				},
				data:JSON.stringify({replytext:replytext}),
				dataType:'text',
				success:function(result){
					if(result=='SUCCESS'){
						alert("수정 되었습니다.");
						getPage("/saraminreply/"+bno+"/"+replyPage);
					}
				}
			});
		});
		
		$('.scheduleBtn').on("click", function(){
			var title=$('input[name=title]').val();
			var writer=$('input[name=writer]').val();
			var startdate=$('input[name=expiration]').val();
			var enddate=startdate;
			var color="black";
			var allday=false;
			
			console.log(startdate);
			
			$.ajax({
				url:'/schedule',
				type:'post',
				headers:{
					"Content-Type":"application/json"
				},
				dataType:'text',
				data:JSON.stringify({
					title:title,
					writer:writer,
					startdate:startdate,
					enddate:enddate,
					color:color,
					allday:allday
				}),
				success:function(result){
					alert("스케쥴러에 일정이 등록되었습니다");
				},
				error:function(e){
					alert(e.printStackTrace());
				}
			});
		});
		
	});
</script>

	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>