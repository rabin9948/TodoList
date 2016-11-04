<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- css -->
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="/resources/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/form-elements.css">
<link rel="stylesheet" href="/resources/css/style.css">



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}

.textcontent {
	width: 60%;
	height: 100%;
}
</style>


<!-- smart editer (nhn) -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/resources/smart-editer/js/HuskyEZCreator.js" charset="utf-8"></script>


<div class="popup back" style="display: none;"></div>
<div id="popup_front" class="popup front" style="display: none;">
	<img id="popup_img">
</div>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box">
				<div class="box-header with-border">
					<h3 class="box-title">READ BOARD</h3>

					<form role="form">
						<div class="box-body">

							<div class="form-group" align="center">
								<select class="searchSelect" name="type" id="type">
									<option value="notype">-----</option>
									<option value="all">ALL</option>
									<option value="web">web</option>
									<option value="java">java</option>
									<option value="spring">spring</option>
									<option value="javascript">javascript</option>
									<option value="linux">linux</option>
								</select>
								
								 <label for="exampleInputEmail1">Title</label>
								 <input type="text" name="title" class="form-control" id="title" required>
							</div>

							<div class="form-group">
								<textarea class="form-controlContent textcontent" name="content"
									rows="5" id="content" required></textarea>
							</div>
						</div>

						<ul class="mailbox-attachments clearfix uploadedList"></ul>

						<!--  /.box-body -->

						<div class="box-footer">
							<ul class="mailbox-attachments clearfix uploadedList"></ul>

							<button type="submit" class="btn btn-danger" id="newBtn">NewBoard</button>
							<button type="submit" class="btn btn-primary" id="listAll">LIST
								ALL</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /.col (left) -->
	</div>
	<!-- /.row -->


	<script>
		$(document).ready(function() {
			$('#rev').empty();
			$('body').css({
				"margin" : "0 0 0 5%",
				"width" : "auto"
			});

			var formObj = $("form[role='form']");

			console.log(formObj);

			$("#listAll").on("click", function() {

				formObj.attr("method", "get");
				formObj.attr("action", "/main#services");
				formObj.submit();
			});

		});
	</script>

	<script>
		$(function() {
			//전역변수선언
			var editor_object = [];
			var formObj = $("form[role='form']");

			nhn.husky.EZCreator.createInIFrame({
				oAppRef : editor_object,
				elPlaceHolder : "content",
				sSkinURI : "/resources/smart-editer/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
				}
			});

			$("#newBtn").click(
					function() {
						if($('#type').val() == 'notype' ){
							alert('타입을 선택해주세요.');
							event.preventDefault();
						}else{
							
							editor_object.getById["content"].exec(
									"UPDATE_CONTENTS_FIELD", []);

							// 이부분에 에디터 validation 검증

							formObj.attr("method", "post");
							formObj.attr("action", "/addBoard");
							formObj.submit();
							
						}
						
						
					});

		})
	</script>