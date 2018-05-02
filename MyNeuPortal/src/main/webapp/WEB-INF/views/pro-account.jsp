<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>professor account</title>
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
					<c:if test="${user.role == 'student'}">
						<a class="dropdown-item" href="${contextPath}/user/account.htm">PROFILE</a>
					</c:if>
					<c:if test="${user.role == 'professor'}">
						<a class="dropdown-item" href="${contextPath}/pro/account.htm">PROFILE</a>
					</c:if>
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
	<div id="main_context" class="container">
		<h2>Account Information</h2>
		<br />
		<div id="accordion">
			<div class="card">
				<div class="card-header" id="headingOne">
					<h5 class="mb-0">
						<button class="btn btn-link" data-toggle="collapse"
							data-target="#collapseOne" aria-expanded="true"
							aria-controls="collapseOne">Account Profile</button>
					</h5>
				</div>

				<div id="collapseOne" class="collapse show"
					aria-labelledby="headingOne" data-parent="#accordion">
					<div class="card-body">
						<table class="table">
							<tr>
								<th>First Name:</th>
								<td>${requestScope.user.firstname}</td>
							</tr>
							<tr>
								<th>Last Name:</th>
								<td>${requestScope.user.lastname}</td>
							</tr>
							<tr>
								<th>Email:</th>
								<td>${requestScope.user.useremail}</td>
							</tr>
							<tr>
								<th>Address:</th>
								<td>${requestScope.user.address}</td>
							</tr>
							<tr>
								<th>City:</th>
								<td>${requestScope.user.city}</td>
							</tr>
							<tr>
								<th>State:</th>
								<td>${requestScope.user.state}</td>
							</tr>
							<tr>
								<th>Phone:</th>
								<td>${requestScope.user.phone}</td>
							</tr>
						</table>
						<br />
						<c:set var="contextPath"
							value="${pageContext.request.contextPath}" />
						<a href="${contextPath}/user/personalinformation/edit.htm"
							class="btn btn-default btn-lg" role="button">Edit</a>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapseTwo" aria-expanded="false"
							aria-controls="collapseTwo">Created News</button>
					</h5>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordion">
					<div class="card-body">
						<table class="table">
							<tr>
								<th>Title</th>
								<th>Content</th>
								<th>Like</th>
								<th>More Details</th>
							</tr>
							<c:forEach var="created_news"
								items="${requestScope.user.createdNews}">
								<tr>
									<td>${created_news.title}</td>
									<td>${created_news.content}</td>
									<td>${created_news.like}</td>
									<td><a
										href="${contextPath}/news/details.htm?news_id=${created_news.id}&from=account">Details</a></td>
								</tr>
							</c:forEach>
						</table>
						<a href="${contextPath}/news/new.htm"
							class="btn btn-default btn-lg" role="button">Create a new
							piece of news</a>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapseTwo" aria-expanded="false"
							aria-controls="collapseTwo">Created Courses</button>
					</h5>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordion">
					<div class="card-body">
						<table class="table">
							<tr>
								<th>Title</th>
								<th>Description</th>
								<th>Capacity</th>
								<th>More Details</th>
							</tr>
							<c:forEach var="created_course"
								items="${requestScope.user.createdCourses}">
								<tr>
									<td>${created_course.title}</td>
									<td>${created_course.address}</td>
									<td>${created_course.date}</td>
									<td><a
										href="${contextPath}/course/details.htm?course_id${created_course.id}&from=account">Details</a></td>
								</tr>
							</c:forEach>
						</table>
						<a href="${contextPath}/course/new.htm"
							class="btn btn-default btn-lg" role="button">Create a new
							Course</a>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingTwo">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapseTwo" aria-expanded="false"
							aria-controls="collapseTwo">Created Events</button>
					</h5>
				</div>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordion">
					<div class="card-body">
						<table class="table">
							<tr>
								<th>Title</th>
								<th>Address</th>
								<th>Date</th>
								<th>More Details</th>
							</tr>
							<c:forEach var="created_event"
								items="${requestScope.user.createdEvents}">
								<tr>
									<td>${created_event.title}</td>
									<td>${created_event.address}</td>
									<td>${created_event.date}</td>
									<td><a
										href="${contextPath}/event/details.htm?event_id=${created_event.id}&from=account">Details</a></td>
								</tr>
							</c:forEach>
						</table>
						<a href="${contextPath}/event/new.htm"
							class="btn btn-default btn-lg" role="button">Create a new
							event</a>
					</div>
				</div>
			</div>
			<div class="card">
				<div class="card-header" id="headingThree">
					<h5 class="mb-0">
						<button class="btn btn-link collapsed" data-toggle="collapse"
							data-target="#collapseThree" aria-expanded="false"
							aria-controls="collapseThree">Participating Events</button>
					</h5>
				</div>
				<div id="collapseThree" class="collapse"
					aria-labelledby="headingThree" data-parent="#accordion">
					<div class="card-body">
						<table class="table">
							<tr>
								<th>Title</th>
								<th>Address</th>
								<th>Date</th>
								<th>More Details</th>
							</tr>
							<c:forEach var="participated_event"
								items="${requestScope.user.participatedEvents}">
								<tr>
									<td>${participated_event.title}</td>
									<td>${participated_event.address}</td>
									<td>${participated_event.date}</td>
									<td><a
										href="${contextPath}/event/details.htm?event_id=${participated_event.id}&from=account">Details</a></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>