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
	margin: auto;
	width: 60%;
	padding: 1px 16px;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
		class="navbar-brand" href="#">MYNEU</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="${contextPath}/home.htm">Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${contextPath}/discover.htm?page=1">DISCOVER</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> ACCOUNT </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${contextPath}/user/account.htm">PROFILE</a>
					<a class="dropdown-item" href="${contextPath}/logout.htm">LOGOUT</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	</nav>



	<div id="event_details" class="container">
		<div class="card">
			<img class="card-img-top" src="..." alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title">Event Details</h5>
				<p class="card-text">Title: ${event.title}</p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">Date: ${event.date}</li>
				<li class="list-group-item">Address: ${event.address}</li>
				<li class="list-group-item">Description: ${event.description}</li>
			</ul>
			<div class="card-body">
				<c:if test="${readonly==false}">
					<div class="btn-group">
						<c:set var="contextPath"
							value="${pageContext.request.contextPath}" />
						<button type="button" class="btn btn-primary"
							onclick="location.href = '${contextPath}/user/account.htm'">Previous</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href = '${contextPath}/event/edit.htm?event_id=${event.id}'">Edit</button>
						<button type="button" class="btn btn-danger"
							onclick="location.href = '${contextPath}/event/delete.htm?event_id=${event.id}'">Delete</button>
					</div>
				</c:if>
				<c:if test="${readonly==true}">
					<div class="btn-group">
						<c:set var="contextPath"
							value="${pageContext.request.contextPath}" />
						<c:if test="${from=='discover'}">
							<button type="button" class="btn btn-primary"
								onclick="location.href = '${contextPath}/discover.htm?page=1'">Back
								To Discover</button>
						</c:if>
						<c:if test="${from=='account'}">
							<button type="button" class="btn btn-primary"
								onclick="location.href = '${contextPath}/user/account.htm'">Previous</button>
						</c:if>
						<c:if test="${event_join==true}">
							<button type="button" class="btn btn-primary"
								onclick="location.href = '${contextPath}/event/join.htm?event_id=${event.id}'">Join</button>
						</c:if>
						<button type="button" class="btn btn-danger"
							onclick="location.href = '${contextPath}/event/quit.htm?event_id=${event.id}'">Quit</button>
					</div>
				</c:if>

			</div>
		</div>
	</div>
</body>
</html>