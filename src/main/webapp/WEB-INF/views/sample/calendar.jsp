<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script src="/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	
	
<link href='/resources/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/resources/calendar/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<script src='/resources/calendar//moment.min.js'></script>
<script src='/resources/calendar/jquery.min.js'></script>
<script src='/resources/calendar/jquery-ui.custom.min.js'></script>
<script src='/resources/calendar/fullcalendar.min.js'></script>
<script>
Date.prototype.format = function(f) {
    if (!this.valueOf()) return " ";
 
    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var d = this;
     
    return f.replace(/(yyyy|pp|yy|kk|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
        switch ($1) {
            case "yyyy": return d.getFullYear();
            case "yy": return (d.getFullYear() % 1000).zf(2);
            case "MM": return (d.getMonth() + 1).zf(2);
            case "kk": return d.getDate().zf(2)-1;
            case "pp": return d.getDate().zf(2)+1;
            case "dd": return d.getDate().zf(2);
            case "E": return weekName[d.getDay()];
            case "HH": return d.getHours().zf(2);
            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
            case "mm": return d.getMinutes().zf(2);
            case "ss": return d.getSeconds().zf(2);
            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
            default: return $1;
        }
    });
};

String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
Number.prototype.zf = function(len){return this.toString().zf(len);};




$(document).ready(function() {
	
	
	var eventList =
		$.ajax({
			type : 'post',
			url : '/sample/listCal',
			dataType : 'json'
		}).done(function(eventList){
			$('#calendar').fullCalendar({
				header: {
					left: 'prev,next today',
					center: 'title',
					right: 'month,agendaWeek,agendaDay'
					
				},
				editable: true,
				droppable: true, // this allows things to be dropped onto the calendar
				editable: true,
				events: eventList,
				editable: true,
				eventClick: function(event, jsEvent, view) {
					$('.fc-content').attr("data-toggle","modal");
					$('.fc-content').attr("data-target","#fullCalModal");
					/*var title = event.title;
					var start = new Date(event.start).format("yyyy-MM-dd");
					var end = new Date(event.end).format("yyyy-MM-dd");
					alert(title+ ' : '+ start+' : '+end);
	        $('#calendar').fullCalendar('updateEvent', event);*/
	        
	        var start = new Date(event.start).format("yyyy-MM-dd");
					var end = new Date(event.end).format("yyyy-MM-kk");
					
					$('#bno').attr("value",event.bno);
					$('#modalTitle').attr("value",event.title);
          $('#modalBody').html(event.content);
          $('#start').attr("value",start);
         	$('#end').attr("value",end);
         
		   
	    }
	
			})
			
		});	

	
		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events .fc-event').each(function() {

			// store data so the calendar knows to render an event upon drop
			$(this).data('event', {
				title: $.trim($(this).text()), // use the element's text as the event title
				stick: true // maintain when user navigates (see docs on the renderEvent method)
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
		
		
		
	});
	
	
		
	
	function modify(){
		
		$('#fullCalModal').finish();
		
		var bno = $('#bno').val();
		var title = $('#modalTitle').val();
		var start = $('#start').val();
		var end = new Date($('#end').val());
		var content = $('#modalBody').val();
		
		end.setDate(end.getDate()+1);
		

		
		$.ajax({
			type : 'post',
			url : '/sample/modify',
			headers: { 
		        'Accept': 'application/json',
		        'Content-Type': 'application/json' 
		    },
			data : JSON.stringify({
				bno : bno,
				title : title,
				start : start,
				end : end,
				content : content
			}),
			success : function(result) {
				if (result == 'SUCCESS'){
					alert("정상 처리");
				}
				else {
					alert("수정 실패");
				}
			}
		});
		
		
		$('#bed').submit();
	}
	
	
	function submit(){
		
			var bno = $('#bno').val();
			var title = $('#modalTitle').val();
			var start = $('#start').val();
			var end = new Date($('#end').val());
			var content = $('#modalBody').val();
			
			end.setDate(end.getDate()+1);

			$.ajax({
				type : 'post',
				url : '/sample/submit',
				headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
				data : JSON.stringify({
					bno : bno,
					title : title,
					start : start,
					end : end,
					content : content
				})
			});
			
			$('#bed').submit();
		
	}
</script>



<style>
body {
	margin-top: 40px;
	text-align: center;
	font-size: 14px;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
}

#wrap {
	width: 1100px;
	margin: 0 auto;
}

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	float: right;
	width: 900px;
}
</style>

</head>
<body>

	<div id='wrap'>

		<div id='external-events'>
			<h4>Draggable Events</h4>
			<div class='fc-event'>My Event 1</div>
			<div class='fc-event'>My Event 2</div>
			<div class='fc-event'>My Event 3</div>
			<div class='fc-event'>My Event 4</div>
			<div class='fc-event'>My Event 5</div>
			<p>
				<input type='checkbox' id='drop-remove' /> <label for='drop-remove'>remove
					after drop</label>
			</p>
		</div>

		<div id='calendar'></div>

		<div style='clear: both'></div>

	</div>
	
	<div id="fullCalModal" class="modal fade" role="modal">
    <div class="modal-dialog">
   
        <div class="modal-content" style="margin-top:20%">
         
            <div class="modal-header">
            		<input type="hidden" id="bno" name="bno">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span> <span class="sr-only">close</span></button>
                 <input id="modalTitle" class="modal-title" name="title">
                <h6>START</h6> <input id="start" class="model-title" name="start">
								<h6>END </h6> <input id="end" class="model-title" name="end">
            </div>
            
            <textarea id="modalBody" name="content" class="modal-body" style="margin-left: 0px; margin-right: 0px; width: 90%;"></textarea>
            <div class="modal-footer">
            		<button onclick="modify()" class="btn btn-default"  id="modify" data-dismiss="modal">Modify</button>
            		<button onclick="submit()" class="btn btn-default" id="submit" data-dismiss="modal">Submit</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
       
        </div>
     
    </div>
</div>

<form id="bed" action="/sample/calendar"></form>


</body>
</html>