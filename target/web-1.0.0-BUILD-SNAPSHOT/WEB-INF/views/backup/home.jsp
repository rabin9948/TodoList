<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Login Page</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/form-elements.css">
<link rel="stylesheet" href="/resources/css/style.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="/resources/ico/favicon.png">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/resources/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/resources/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/resources/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/resources/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>

	<!-- Top content -->
	<div class="top-content">

		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>To do</strong> list
						</h1>
						
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Login to our site</h3>
								<p>Enter your username and password to log on:</p>
							</div>
							<div class="form-top-right">
								<i class="fa fa-lock"></i>
							</div>
						</div>
						<div class="form-bottom">
							<form role="form" action="/main" method="post" class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label> <input
										type="text" name="uid" placeholder="Username..."
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label> <input
										type="password" name="upw" placeholder="Password..."
										class="form-password form-control" id="form-password">
								</div>
								<button type="submit" class="btn">Sign in!</button>
							</form>

						</div>
						<div class="form-bottom">
							<button type="submit" class="btn" id="myBtn">new member</button>

							<!-- Modal -->
							<div class="modal fade" id="myModal" role="dialog">
								<div class="modal-dialog">

									<!-- Modal content-->
									<div class="modal-content">
										<div class="modal-header" style="padding: 35px 50px;">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4>
												<span class="glyphicon glyphicon-lock"></span> new member
											</h4>
										</div>
										<div class="modal-body" style="padding: 40px 50px;">
											<form method="post" action="/newUser">
												<div class="form-group">
													<label for="usrname"><span
														class="glyphicon glyphicon-user"></span> Username   <a id="checkID" >ID check</a></label> <input
														type="text" class="form-control" name="uid2" id ="uid2"
														placeholder="Enter username">
												</div>
												<div class="form-group">
													<label for="psw"><span
														class="glyphicon glyphicon-eye-open"></span> Password</label> <input
														type="password" class="form-control" name="upw2"
														placeholder="Enter password">
												</div>
												<div class="form-group">
													<label for="email"><span
														class="glyphicon glyphicon glyphicon-envelope"></span> E-mail</label> <input
														type="email" class="form-control" name="uemail2"
														placeholder="Enter email">
												</div>
												
												<button type="submit" class="btn btn-success btn-block">
													<span class="glyphicon glyphicon-off"></span> new member
												</button>
											</form>
										</div>
										<div class="modal-footer">
											<button type="submit"
												class="btn btn-danger btn-default pull-left"
												data-dismiss="modal">
												<span class="glyphicon glyphicon-remove"></span> Cancel
											</button>
											<p>
												Not a member? <a href="#">Sign Up</a>
											</p>
											<p>
												Forgot <a href="#">Password?</a>
											</p>
										</div>
									</div>

								</div>
							</div>
							
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 social-login">
						<h3>...or login with:</h3>
						<div class="social-login-buttons">
							<a class="btn btn-link-2" href="#"> <i class="fa fa-facebook"></i>
								Facebook
							</a> <a class="btn btn-link-2" href="#"> <i class="fa fa-twitter"></i>
								Twitter
							</a> <a class="btn btn-link-2" href="#"> <i
								class="fa fa-google-plus"></i> Google Plus
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- Javascript -->
	<script src="/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.backstretch.min.js"></script>
	<script src="/resources/js/scripts.js"></script>

	<!--[if lt IE 10]>
            <script src="/resources/js/placeholder.js"></script>
        <![endif]-->

	<div class="backstretch"
		style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 1500px; width: 1800px; z-index: -999999; position: fixed;">
		<img src="/resources/img/backgrounds/1.jpg"
			style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1800px; height: 1500px; max-height: none; max-width: none; z-index: -999999; left: 0px; top: -260.667px;">
	</div>

	<script>
		$(document).ready(function() {
			$("#myBtn").click(function() {
				$("#myModal").modal();
			});
		});
	</script>
	
	<script>
		$("#checkID").on("click",function(){
			var uid = $("#uid2").val();

			$.ajax({
				type:'post',
				url:'/checkID',
				headers:{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType:'text',
				data:JSON.stringify({
					uid2 : uid
				}),
				success : function(result){
					if(result == 'SUCCESS')
						alert("등록 가능한 아이디 입니다.");
					else{
						alert("등록 불가능한 아이디 입니다.");
					}
				}
				
			});
		});
	</script>

</body>

</html>
