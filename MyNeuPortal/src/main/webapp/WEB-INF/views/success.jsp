<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
#main_context {
	height: 100%;
	margin-left: 20%;
	padding: 1px 16px;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}
</style>
<title>Success Page</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="main_context">
		<h1>Congrats!</h1>
		<p>${message}</p>
		<p></p>
		<a href="${contextPath/home.htm}">Go Back to the dashboard!</a>
	</div>
</body>
</html>