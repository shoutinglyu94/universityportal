<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Account</title>
<style type="text/css">
#main_context {
	height: 100%;
	margin-left: 15%;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<section id="main_context"> 
	<h2>Account Information</h2>
	<p>
		<strong>Note:</strong> The <strong>data-parent</strong> attribute
		makes sure that all collapsible elements under the specified parent
		will be closed when one of the collapsible item is shown.
	</p>
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapse1">Account Profile</a>
				</h4>
			</div>
			<div id="collapse1" class="panel-collapse collapse in">
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>First Name:</th>
							<td>${sessionScope.user.firstname}</td>
						</tr>
						<tr>
							<th>Last Name:</th>
							<td>${sessionScope.user.lastname}</td>
						</tr>
						<tr>
							<th>Email:</th>
							<td>${sessionScope.user.useremail}</td>
						</tr>
						<tr>
							<th>Address:</th>
							<td>${sessionScope.user.address}</td>
						</tr>
						<tr>
							<th>City:</th>
							<td>${sessionScope.user.city}</td>
						</tr>
						<tr>
							<th>State:</th>
							<td>${sessionScope.user.state}</td>
						</tr>
						<tr>
							<th>Phone:</th>
							<td>${sessionScope.user.phone}</td>
						</tr>
					</table>
					<br />
					<c:set var="contextPath" value="${pageContext.request.contextPath}" />
					<a href="${contextPath}/user/personalinformation/edit.htm"
						class="btn btn-default btn-lg" role="button">Edit</a>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapse2">Created Event</a>
				</h4>
			</div>
			<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>Title</th>
							<th>Address</th>
							<th>Date</th>
							<th>More Details</th>
						</tr>
						<c:forEach var="event" items="${sessionScope.user.createdEvents}">
							<tr>
								<td>${event.title}</td>
								<td>${event.address}</td>
								<td>${event.date}</td>
								<td><a
									href="${contextPath}/event/details.htm?event_id=${event.id}">Details</a></td>
							</tr>
						</c:forEach>
					</table>
					<a href="${contextPath}/event/new.htm"
						class="btn btn-default btn-lg" role="button">Cteate a new event</a>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapse3">Collapsible Group 3</a>
				</h4>
			</div>
			<div id="collapse3" class="panel-collapse collapse">
				<div class="panel-body">Lorem ipsum dolor sit amet,
					consectetur adipisicing elit, sed do eiusmod tempor incididunt ut
					labore et dolore magna aliqua. Ut enim ad minim veniam, quis
					nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
					consequat.</div>
			</div>
		</div>
	</div>

	</section>
	


</body>
</html>