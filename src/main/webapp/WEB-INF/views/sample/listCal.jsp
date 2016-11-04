<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list}" var="CalendarVO">
		<span>${CalendarVO.title}</span>
		<span>${CalendarVO.start}</span>
		<span>${CalendarVO.end}</span>
	</c:forEach>
</body>
</html>