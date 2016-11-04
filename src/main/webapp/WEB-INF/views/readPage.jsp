<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<style type="text/css">
	.popup {position: absolute;}
	.back { background-color: gray; opacity:0.5; width: 100%; height: 300%; overflow:hidden; z-index:1101;}
	.front { z-index:1110; opacity:1; boarder:1px; margin: auto;}
	.show { position: relative; max-width: 1200px; max-height: 800px; overflow: auto;}
	.tt_article_useless_p_margin p {padding-top:0 !important;padding-bottom:0 !important;margin-top:0 !important;margin-bottom:0 !important;}
</style>

<div class="popup back" style="display:none;"></div>
	<div id="popup_front" class="popup front" style="display:none;">
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
						<input type="hidden" name="bno" value="${boardVO.bno }">
						<input type="hidden" name="page" value="${page }">

					</form>
					
					<div class="box-body">
						<div class="form-group" align="center">
							<label for="exampleInputEmail1">Writer/Title</label>
							<input type="text" name="title" class="form-control" value="${boardVO.writer } / ${boardVO.title }" readonly="readonly" style="width:65%; padding:0px" >
						</div>
						<div class="col-md-2"></div>
						<article role="article" class="col-md-8 skeleton-content hentry" >
						<div class="form-group" style="background-color:#eee; border:3px solid #ddd;">
								<div class="form-controlContent">
								<div class="tt_article_useless_p_margin" style="text-align:initial;"  name="content"  readonly="readonly">${boardVO.content }</div>							
								</div>
						</div>
						</article>
					</div>
					
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					
					<!--  /.box-body -->
					
					<div class="box-footer">
					<ul class="mailbox-attachments clearfix uploadedList"></ul>
					<c:if test="${userInfo.uid == boardVO.writer }">
						<button type="submit" class="btn btn-warning" id="modify">MODIFY</button>
						<button type="submit" class="btn btn-danger" id="removeBtn">REMOVE</button>
					</c:if>
						<button type="submit" class="btn btn-primary" id="listAll">LIST ALL</button>
					</div>
					
				</div>
			</div>
		</div><!-- /.col (left) -->
	</div>	<!-- /.row -->


<script>
$(document).ready(function() {
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#listAll").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/main#services");
		formObj.submit();
	});
	
	
	$("#removeBtn").on("click", function(){
		formObj.attr("method", "post");
		formObj.attr("action", "/remove");
		formObj.submit();
	});
});
</script>

	
	