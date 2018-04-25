<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Details</title>
<style>
#event_details {
	height: 100%;
	margin-left: 15%;
	padding: 1px 16px;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<section id="event_details">
	<h2>Event Details</h2>
	<br />
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading">${event.title}</div>
			<div class="panel-body">
				<table class="table">
					<tr>
						<th>Date</th>
						<td>${event.date}</td>
					</tr>
					<tr>
						<th>Address</th>
						<td>${event.address}</td>
					</tr>
					<tr>
						<th>Description</th>
						<td>${event.description}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="btn-group">
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />
		<button type="button" class="btn btn-primary"
			onclick="location.href = '${contextPath}/user/account.htm'">Previous</button>
		<button type="button" class="btn btn-primary"
			onclick="location.href = '${contextPath}/event/edit.htm?event_id=${event.id}'">Edit</button>
		<button type="button" class="btn btn-danger"
		onclick="location.href = '${contextPath}/event/delete.htm?event_id=${event.id}'">Delete</button>
	</div>
	</section>
</body>
</html>