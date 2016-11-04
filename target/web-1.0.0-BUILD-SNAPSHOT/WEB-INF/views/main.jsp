<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Rabin TO do list</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body {
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}

h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.jumbotron {
	background-color: #f4511e;
	color: #fff;
	padding: 100px 25px;
	font-family: Montserrat, sans-serif;
}

.container-fluid {
	padding: 60px 50px;
}

.bg-grey {
	background-color: #f6f6f6;
}

.logo-small {
	color: #f4511e;
	font-size: 50px;
}

.logo {
	color: #f4511e;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #f4511e;
}

.carousel-indicators li {
	border-color: #f4511e;
}

.carousel-indicators li.active {
	background-color: #f4511e;
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

.panel {
	border: 1px solid #f4511e;
	border-radius: 0 !important;
	transition: box-shadow 0.5s;
}

.panel:hover {
	box-shadow: 5px 0px 40px rgba(0, 0, 0, .2);
}

.panel-footer .btn:hover {
	border: 1px solid #f4511e;
	background-color: #fff !important;
	color: #f4511e;
}

.panel-heading {
	color: #fff !important;
	background-color: #f4511e !important;
	padding: 25px;
	border-bottom: 1px solid transparent;
	border-top-left-radius: 0px;
	border-top-right-radius: 0px;
	border-bottom-left-radius: 0px;
	border-bottom-right-radius: 0px;
}

.panel-footer {
	background-color: white !important;
}

.panel-footer h3 {
	font-size: 32px;
}

.panel-footer h4 {
	color: #aaa;
	font-size: 14px;
}

.panel-footer .btn {
	margin: 15px 0;
	background-color: #f4511e;
	color: #fff;
}

.navbar {
	margin-bottom: 0;
	background-color: #f4511e;
	z-index: 9999;
	border: 0;
	font-size: 12px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 4px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar li a, .navbar .navbar-brand {
	color: #fff !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #f4511e !important;
	background-color: #fff !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #fff !important;
}

footer .glyphicon {
	font-size: 20px;
	margin-bottom: 20px;
	color: #f4511e;
}

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	visibility: visible;
}

.newButton {
	margin-right: -20%;
}

.newGroup {
	float: left;
}

.newH2 {
	margin-left: 47%;
}

.searchSelect{
	margin-right: 1%;
	margin-top: 0.5%;
}

@
keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}

100%
{
opacity






:



 



1;
-webkit-transform






:



 



translateY






(0%);
}
}
@
-webkit-keyframes slide { 0% {
	opacity: 0;
	-webkit-transform: translateY(70%);
}

100%
{
opacity






:



 



1;
-webkit-transform






:



 



translateY






(0%);
}
}
@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}
</style>



<!-- calendar -->

<link href='/resources/calendar/fullcalendar.css' rel='stylesheet' />
<link href='/resources/calendar/fullcalendar.print.css' rel='stylesheet'
	media='print' />
<script src='/resources/calendar//moment.min.js'></script>
<script src='/resources/calendar/jquery.min.js'></script>
<script src='/resources/calendar/jquery-ui.custom.min.js'></script>
<script src='/resources/calendar/fullcalendar.min.js'></script>


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

.fc-time{
	display : none;
} 
</style>


</head>
<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">

	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#myPage"><strong>${userInfo.uid}</strong>의
				TO do list</a> <a class="navbar-brand" href="/logOut"><h5>로그아웃</h5></a>

		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#profile">PROFILE</a></li>
				<li><a href="#services">SERVICES</a></li>
				<li><a href="#portfolio">PORTFOLIO</a></li>
				<li><a href="#contact">CONTACT</a></li>
			</ul>
		</div>
	</div>
	</nav>



	<!-- Container (Profile Section) -->


	<div class="container-fluid bg-grey " id="profile">
		<div class="row">
			<div class="col-sm-4">
				<img src="/resources/img/backgrounds/4809.jpg"
					style="margin: 25% 0 0 30%" class="glyphicon glyphicon-globe logo col-sm-5"></img>
			</div>
			<div class="col-sm-5">
				<h2>Profile</h2>
				<br>
				<h4>
					
						이름 : 백종탁<br>
						생년월일 : 90.04.12<br>
						학교 : 경기대학교<br>
						전공 : 융합보안학, 컴퓨터 과학(복수전공)<br>
						관심 분야 : 웹 분야<br>
						
				</h4>
				<br>
				<p>
					<strong>다짐:</strong> 경력이 쌓여 매너리즘에 빠진 개발자가 아닌  여러 흥미진진한 일들에 대해 알게 되는 
					두근거림과 열정으로 살아가는 프로그래머가 되겠습니다.
				</p>
			</div>
		</div>
	</div>

	<!-- Container (Services Section) -->
	<div id="services" class="container-fluid text-center"
		style="height: auto; width: 100%;">
		<div>
			<h2 class="col-sm-7">SERVICES</h2>
			
			<form class="searchSubmit">
				<select class="col-sm-2 searchSelect" name="searchType" id="search">
					<option value="n">-----</option>
					<option value="all">ALL</option>
					<option value="web">web</option>
					<option value="java">java</option>
					<option value="spring">spring</option>
					<option value="javascript">javascript</option>
					<option value="linux">linux</option>
				</select>
			</form>
			
			<form action="/newBoard" method="get" class="col-sm-2">
				<button class=" btn btn-primary">New
					Board</button>
			</form>
		</div>
		<table class="table table-bordered">
			<tr>
				<th class="col-sm-1 text-center">BNO</th>
				<th class="col-sm-7 text-center">TITLE</th>
				<th class="col-sm-2 text-center">WRITER</th>
				<th class="col-sm-2 text-center">REGDATE</th>
			</tr>

			<c:forEach items="${list}" var="boardVO">

				<tr>
					<td class="col-sm-1 text-center">${boardVO.bno}</td>
					<td class="col-sm-7"><a
						href="/readPage?bno=${boardVO.bno }&page=${pageMaker.cri.page}">[${boardVO.type}]<Strong>  ${boardVO.title}</Strong></a></td>
					<td class="col-sm-2 text-center">${boardVO.writer}</td>
					<td class="col-sm-2 text-center"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" />${boardVO.regdate}</td>
				<tr>
			</c:forEach>
		</table>
		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev }">
					<li><a href="main?page=${pageMaker.startPage - 1 }#services">&laquo;</a>
				</c:if>
				
				
				<c:if test="${empty type }">
					<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class=active' :'' }"/>>
						<a href="main?page=${idx }#services"> ${idx}</a>
					</c:forEach>
				</c:if>
				
				
					<c:if test="${type ne null }">
					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class=active' :'' }"/>>
						<a href="searchList?page=${idx }&&searchType=${type }#services"> ${idx}</a>
					</c:forEach>
					</c:if>
					
			
				
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li><a href="main?page=${pageMaker.endPage + 1 }#services">&raquo;</a>
				</c:if>
			</ul>
		</div>
	</div>


	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center bg-grey">
		<h2>Portfolio</h2>
		<br>
		<div id='wrap'>

			<div id='external-events'>
				<h4>Draggable Events</h4>
				<div class='fc-event'>My Event 1</div>
				<div class='fc-event'>My Event 2</div>
				<div class='fc-event'>My Event 3</div>
				<div class='fc-event'>My Event 4</div>
				<div class='fc-event'>My Event 5</div>
				<p>
					<input type='checkbox' id='drop-remove' /> <label
						for='drop-remove'>remove after drop</label>
				</p>
			</div>

			<div id='calendar'></div>

			<div style='clear: both'></div>

		</div>

		<div id="fullCalModal" class="modal fade" role="modal">
			<div class="modal-dialog">

				<div class="modal-content" style="margin-top: 20%">

					<div class="modal-header">
						<input type="hidden" id="bno" name="bno">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span> <span class="sr-only">close</span>
						</button>
						<input id="modalTitle" class="modal-title" name="title">
						<h6>START</h6>
						<input id="start" class="model-title" name="start">
						<h6>END</h6>
						<input id="end" class="model-title" name="end">
					</div>

					<textarea id="modalBody" name="content" class="modal-body"
						style="margin-left: 0px; margin-right: 0px; width: 90%;"></textarea>
					<div class="modal-footer">
						<button onclick="modify()" class="btn btn-default" id="modify"
							data-dismiss="modal">Modify</button>
						<button onclick="submit()" class="btn btn-default" id="submit"
							data-dismiss="modal">Submit</button>
						<button class="btn btn-default" id="deleteCalendar"
							data-dismiss="modal" onclick="deleteCalendar()">Delete</button>
					</div>

				</div>

			</div>
		</div>

		<form id="bed" action="/calendarForm" method="get"></form>

	</div>


	<!-- Container (Contact Section) -->
	<div id="contact" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<p>컨택을 원하시면 name, email, comment을 남겨주세요.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> 경기도 수원 경기대학교
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> 010-2674-9948
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>
					rabin994839@gmail.com
				</p>
			</div>
			<form action="/Mail/mail" method="post">
				<div class="col-sm-7 slideanim">
					<div class="row">
						<div class="col-sm-6 form-group">
							<input class="form-control" id="name" name="name"
								placeholder="Name" type="text" required>
						</div>
						<div class="col-sm-6 form-group">
							<input class="form-control" id="email" name="email"
								placeholder="Email" type="email" required>
						</div>
					</div>
					<textarea class="form-control" id="comments" name="comments"
						placeholder="Comment" rows="5"></textarea>
					<br>
					<div class="row">
						<div class="col-sm-12 form-group">
							<button class="btn btn-default pull-right" type="submit">Send</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>

	<footer class="container-fluid text-center"> <a href="#myPage"
		title="To Top"> <span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<p>
		Made By <a href="https://www.facebook.com/baek.jongtak">JongTak Baek</a>
	</p>
	</footer>

	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {
								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {
									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							}
					);

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});
					
					//$('.fc-time').remove();
				})
	</script>



	<!-- calendar javascript -->
	<script>
		Date.prototype.format = function(f) {
			if (!this.valueOf())
				return " ";

			var weekName = [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ];
			var d = this;

			return f.replace(/(yyyy|pp|yy|kk|MM|dd|E|hh|mm|ss|a\/p)/gi,
					function($1) {
						switch ($1) {
						case "yyyy":
							return d.getFullYear();
						case "yy":
							return (d.getFullYear() % 1000).zf(2);
						case "MM":
							return (d.getMonth() + 1).zf(2);
						case "kk":
							return d.getDate().zf(2) - 1;
						case "pp":
							return (d.getDate()+1).zf(2);
						case "dd":
							return d.getDate().zf(2);
						case "E":
							return weekName[d.getDay()];
						case "HH":
							return d.getHours().zf(2);
						case "hh":
							return ((h = d.getHours() % 12) ? h : 12).zf(2);
						case "mm":
							return d.getMinutes().zf(2);
						case "ss":
							return d.getSeconds().zf(2);
						case "a/p":
							return d.getHours() < 12 ? "오전" : "오후";
						default:
							return $1;
						}
					});
		};

		String.prototype.string = function(len) {
			var s = '', i = 0;
			while (i++ < len) {
				s += this;
			}
			return s;
		};
		String.prototype.zf = function(len) {
			return "0".string(len - this.length) + this;
		};
		Number.prototype.zf = function(len) {
			return this.toString().zf(len);
		};

		$(document).ready(function() {

			var eventList = $.ajax({
				type : 'post',
				url : '/calendar/listCal',
				dataType : 'json'
			}).done(function(eventList) {
				$('#calendar').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month'

					},
					editable : true,
					droppable : true, // this allows things to be dropped onto the calendar
					editable : true,
					events : eventList,
					editable : true,
					eventClick : function(event, jsEvent, view) {
						//$('.fc-time').attr("style","display:none;");
						$('.fc-content').attr("data-toggle", "modal");
						$('.fc-content').attr("data-target", "#fullCalModal");
						/*var title = event.title;
						var start = new Date(event.start).format("yyyy-MM-dd");
						var end = new Date(event.end).format("yyyy-MM-dd");
						alert(title+ ' : '+ start+' : '+end);
						$('#calendar').fullCalendar('updateEvent', event);*/

						var start = new Date(event.start).format("yyyy-MM-dd");
						var end = new Date(event.end).format("yyyy-MM-kk");

						$('#bno').attr("value", event.bno);
						$('#modalTitle').attr("value", event.title);
						$('#modalBody').html(event.content);
						$('#start').attr("value", start);
						$('#end').attr("value", end);

					}

				})

				$('span').remove('.fc-time');

			});

			/* initialize the external events
			-----------------------------------------------------------------*/

			$('#external-events .fc-event').each(function() {

				// store data so the calendar knows to render an event upon drop
				$(this).data('event', {
					title : $.trim($(this).text()), // use the element's text as the event title
					stick : true
				// maintain when user navigates (see docs on the renderEvent method)
				});

				// make the event draggable using jQuery UI
				$(this).draggable({
					zIndex : 999,
					revert : true, // will cause the event to go back to its
					revertDuration : 0
				//  original position after the drag
				});
			});

			/* initialize the calendar
			-----------------------------------------------------------------*/
		});

		function modify() {

			$('#fullCalModal').finish();

			var bno = $('#bno').val();
			var title = $('#modalTitle').val();
			var start = $('#start').val();
			var end = $('#end').val();
			var content = $('#modalBody').val();

			//end.setDate(end.getDate() + 1);
			
			var dateArray = end.split('-');
			
			if(dateArray[2] < 10){
				 var endDate = leadingZeros(dateArray[2],2);
				 end = dateArray[0] + "-" + dateArray[1] + "-" + endDate;
			}
			
		  end = new Date(end).format('yyyy-MM-pp');
			
			
			$.ajax({
				type : 'post',
				url : '/calendar/modify',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				data : JSON.stringify({
					bno : bno,
					title : title,
					start : start,
					end : end,
					content : content
				}),
				success : function(result) {

				}
			});

			$('#bed').submit();

		}

		function submit() {

			var bno = $('#bno').val();
			var title = $('#modalTitle').val();
			var start = $('#start').val();
			var end = $('#end').val();
			var content = $('#modalBody').val();
			
			//var end2 = $('#end').val();
			
			//end.setDate(end.getDate() + 1);
			
			
			// split을 사용하는 이유는 IE에서 date가 한 자리 수일 때, new Date를 사용할 수 없다. 예로 2016-08-6이면 new Date 오류이고 2016-08-06이면 new Date가 가능하다.
			var dateArray = end.split('-');
			
			if(dateArray[2] < 10){
				 var endDate = leadingZeros(dateArray[2],2);
				 end = dateArray[0] + "-" + dateArray[1] + "-" + endDate;
			}
			
		  end = new Date(end).format('yyyy-MM-pp');
			
			$.ajax({
				type : 'post',
				url : '/calendar/submit',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				data : JSON.stringify({
					bno : bno,
					title : title,
					start : start,
					end : end,
					content : content
				}),
				success : function(result) {

				}
			});

			$('#bed').submit();

		}

		function deleteCalendar() {

			var bno = $('#bno').val();
			var title = $('#modalTitle').val();
			var start = $('#start').val();
			var end = new Date($('#end').val());
			var content = $('#modalBody').val();

			end.setDate(end.getDate() + 1);

			$.ajax({
				type : 'post',
				url : '/calendar/delete',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				data : JSON.stringify({
					bno : bno,
					title : title,
					start : start,
					end : end,
					content : content
				}),
				success : function(result) {

				}
			});
			$('.fc-time').remove();
			$('#bed').submit();

		}
		
		
		function leadingZeros(n, digits) {
			  var zero = '';
			  n = n.toString();

			  if (n.length < digits) {
			    for (var i = 0; i < digits - n.length; i++)
			      zero += '0';
			  }
			  return zero + n;
			}
	</script>

	
	<script>
	// searchSelect
		$('#search').on("change",function(){
			
			if($('#search').val() == 'all'){
				$('.searchSubmit').attr("action","/main#services");
				$('.searchSubmit').submit();
			}
			else{
				$('.searchSubmit').attr("action","/searchList#services");
				$('.searchSubmit').submit();
			}
			
			
		})
	
	</script>
</body>
</html>
