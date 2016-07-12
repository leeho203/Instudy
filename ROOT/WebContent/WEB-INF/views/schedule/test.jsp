<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/fullcalendar-2.7.0/fullcalendar.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/fullcalendar-2.7.0/fullcalendar.print.css'/>" media='print' />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
* {
	margin: 0px;
	padding: 0px;
	border: 0px;
}

body {
	height: auto;
	background-color: #f8f8f8;
}

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

.inbox {
	background-color: white;
	border: 1px solid #c2c2d6;
	margin-top: 10px;
	padding: 10px;
}

@media ( min-width : 0px) {
	.first-main-container {
		margin-top: 115px;
	}
}

@media ( min-width : 300px) {
	.first-main-container {
		margin-top: 50px;
	}
	.container-fluid-main {
		height: 50px;
	}
}

@media ( min-width : 768px) {
	.first-main-container {
		margin-top: 120px;
	}
	.container-fluid-main {
		height: 60px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 900px;
	}
	.first-main-container {
		margin-top: 120px;
	}
	.container-fluid-main {
		height: 60px;
	}
}
</style>

<script src="<c:url value='/resources/moment.js'/>" ></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script	src="<c:url value='/resources/fullcalendar-2.7.0/fullcalendar.js'/>" ></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script>

	$(document).ready(function() {
		
		/*		Modal창이 보일 때 생기는 이벤트		*/
		$('#eventModal').on('shown.bs.modal', function () {
		    $('.modal-body #title').focus();
		});
		
		/* initialize the external events
		-----------------------------------------------------------------*/
		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).text()), // use the element's text as the event title
				stick: true, // maintain when user navigates (see docs on the renderEvent method)
				color: $(this).attr('event-color')
			});

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar
			drop: function() {
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
			},
			events:function(start, end, timezone, callback){
				var writer='leeho203'
				var events=[];
				
				$.getJSON('/schedule/all/'+writer, function(result){
					$(result).each(function(index, element){
						console.log(index+":"+element);
						console.log(element.sno);
						events.push({id:element.sno, title:element.title, color:element.color, allDay:element.allday, start:element.startdate, end:element.enddate});
					});
					
					callback(events);
				});
			},
			eventReceive:function(event){	//	새로운 이벤트를 추가할 경우
				var title=event.title;
				var writer='leeho203';	//	나중에 이용할 것임 $('#writer').val()
				var startdate=event.start;
				var enddate=startdate;
				var color=event.color;
				var allday=event.allDay;
				
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
						console.log(result);
						event.id=result;
						$('#calendar').fullCalendar('updateEvent', event);
					},
					error:function(e){
						alert(e.printStackTrace());
					}
				});
				$('#calendar').fullCalendar('updateEvent', event);
			},
			eventDrop:function(event, delta, revertFunc){	// 추가된 이벤트를 다른 곳으로 옮길경우
				var sno=event.id
				var title=event.title;
				var startdate=event.start;
				var enddate=(event.end==null)?startdate:event.end;
				var color=event.color;
				var allday=event.allDay;
			
				$.ajax({
					url:'/schedule/'+sno,
					type:'put',
					headers:{
						"Content-Type":"application/json"
					},
					dataType:'text',
					data:JSON.stringify({
						title:title,
						startdate:startdate,
						enddate:enddate,
						color:color,
						allday:allday
					}),
					success:function(result){
						if(result!='SUCCESS'){
							revertFunc();
						}
					},
					error:function(e){
						alert(e.printStackTrace());
						revertFunc();
					}
				});
				
			},
			eventResize:function(event, delta, revertFunc){		// 추가된 이벤트를 리사이징 하는 경우
				var sno=event.id;
				var title=event.title;
				var startdate=event.start;
				var enddate=(event.end==null)?startdate:event.end;
				var color=event.color;
				var allday=event.allDay;
			
				$.ajax({
					url:'/schedule/'+sno,
					type:'put',
					headers:{
						"Content-Type":"application/json"
					},
					dataType:'text',
					data:JSON.stringify({
						title:title,
						startdate:startdate,
						enddate:enddate,
						color:color,
						allday:allday
					}),
					success:function(result){
						if(result!='SUCCESS'){
							revertFunc();
						}
					},
					error:function(e){
						alert(e.printStackTrace());
						revertFunc();
					}
				});
			},
			eventRender:function(event, element){	
				element.bind('click', function(){		// 이벤트 객체를 클릭 했을 때		
					$(this).attr('data-toggle', 'modal');
					$(this).attr('data-target', '#eventModal');
					$('.modal-body #sno').val(event.id);
					$('.modal-body #title').val(event.title);
					$('.modal-body #startdate').val(event.start.toISOString());
					$('.modal-body #enddate').val((event.end==null)?event.start.toISOString():event.end.toISOString());
					$('.modal-body #color').val(event.color);
					$('.modal-body #allday').val(event.allDay);
			

				});
			}
		});
		
		
		$('.delBtn').click(function(){
			
			var sno = $(this).parent().parent().siblings('.modal-body').children('#sno').val();
			
			$.ajax({
				url:'/schedule/'+sno,
				type:'delete',
				headers:{
					"Content-Type":"application/json"
				},
				success:function(result){
					if(result!='SUCCESS'){
						revertFunc();
					}
					
					$('#calendar').fullCalendar('removeEvents');
					$('#calendar').fullCalendar('addEventSource',
						function(start, end, timezone, callback){
							var writer='leeho203'
							var events=[];
							
							$.getJSON('/schedule/all/'+writer, function(result){
								$(result).each(function(index, element){
									console.log(index+":"+element);
									console.log(element.sno);
									events.push({id:element.sno, title:element.title, color:element.color, allDay:element.allday, start:element.startdate, end:element.enddate});
								});
								
								callback(events);
							});
						}
					);
				},
				error:function(e){
					alert(e.printStackTrace());
					revertFunc();
				}
			});
		});
		
		$('.modBtn').click(function(){
			
			var modalbody=$(this).parent().parent().siblings('.modal-body');
			var sno = modalbody.children('#sno').val();
			var title = modalbody.children('#title').val();
			var startdate = modalbody.children('#startdate').val();
			var enddate = modalbody.children('#enddate').val();
			var color = modalbody.children('#color').val();
			var allday = modalbody.children('#allday').val();

			$.ajax({
				url:'/schedule/'+sno,
				type:'put',
				headers:{
					"Content-Type":"application/json"
				},
				dataType:'text',
				data:JSON.stringify({
					title:title,
					startdate:startdate,
					enddate:enddate,
					color:color,
					allday:allday
				}),
				success:function(result){
					if(result!='SUCCESS'){
						revertFunc();
					}
					
					$('#calendar').fullCalendar('removeEvents');
					$('#calendar').fullCalendar('addEventSource',
						function(start, end, timezone, callback){
							var writer='leeho203'
							var events=[];
							
							$.getJSON('/schedule/all/'+writer, function(result){
								$(result).each(function(index, element){
									console.log(index+":"+element);
									console.log(element.sno);
									events.push({id:element.sno, title:element.title, color:element.color, allDay:element.allday, start:element.startdate, end:element.enddate});
								});
								
								callback(events);
							});
						}
					);
				},
				error:function(e){
					alert(e.printStackTrace());
					revertFunc();
				}
				
			});
		});

	});

</script>
<style>
		
	#external-events {
		width: auto;
		text-align: left;
	}
		
	#external-events .fc-event {
		margin: 5px 0;
		cursor: pointer;
		border: 0px;
	}

	#calendar {
		float: right;
		width: auto;
	}

</style>
</head>
<body>
	<!-- Header -->
	<%@ include file="/WEB-INF/views/header.jsp" %>

	<div class="container first-main-container">
		<div class="row">
			<div class="col-sm-2">
				<div class="inbox">
					<div id='external-events'>
						Draggable Events
						<div class='fc-event' event-color='red' style='background-color:red;'>red</div>
						<div class='fc-event' event-color='blue' style='background-color:blue;'>blue</div>
						<div class='fc-event' event-color='green' style='background-color:green;'>green</div>
						<div class='fc-event' event-color='gray' style='background-color:gray;'>gray</div>
						<div class='fc-event' event-color='black' style='background-color:black;'>black</div>
						<div class='fc-event' event-color='pink' style='background-color:pink;'>pink</div>
						<div class='fc-event' event-color='orange' style='background-color:orange;'>orange</div>
						<!-- <p>
							<input type='checkbox' id='drop-remove' />
							<label for='drop-remove'>remove after drop</label>
						</p> -->
					</div>
				</div>
			</div>
			<div class="col-sm-10">
				<div class="inbox">
					<div id='calendar'></div>
			
					<div style='clear:both'></div>
				</div>
			</div>
		</div>
	</div>	
	
	<div id='eventModal' class='modal fade' role='dialog'>
		<div class='modal-dialog'>
			<div class='modal-content'>
				<div class='modal-header'>
					<button type='button' class='close' data-dismiss='modal'>&times;</button>
				</div>
				<div class='modal-body'>
					<input type='hidden' id='sno'>
					<input type='text' id='title'>
					<input type='hidden' id='startdate'>
					<input type='hidden' id='enddate'>
					<input type='text' id='color'>
					<input type='hidden' id='allday'>
				</div>
				<div class='modal-footer'>
					<div class='btn-group'>
						<button type='button' class='btn btn-sm btn-default modBtn' data-dismiss='modal'>MODIFY</button>
						<button type='button' class='btn btn-sm btn-default delBtn' data-dismiss='modal'>DELETE</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	
</body>
</html>