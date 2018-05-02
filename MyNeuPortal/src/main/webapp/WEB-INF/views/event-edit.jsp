<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
#success_message {
	display: none;
}

#main_context {
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


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
<title>Edit Event</title>
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
	<div id="main_context" class="container">
		<form class="well form-horizontal" method="POST" action="edit.htm"
			id="create_event_form">
			<fieldset>
				<!-- Form Name -->
				<legend>Edit Event</legend>
				<div class="form-group">
					<label class="col-md-4 control-label">Title</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-calendar"></i></span> <input
								name="event_title" value="${event.title}" class="form-control"
								type="text">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">Description</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-list-alt"></i></span>
							<textarea name="event_description" class="form-control">${event.description}</textarea>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">Address</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-home"></i></span> <input
								name="event_address" value="${event.address}"
								class="form-control" type="text">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 control-label">Date</label>
					<div class="col-md-4 inputGroupContainer">
						<div class="input-group date" id="datepicker">
							<input type="text" class="form-control" name="event_date"
								value="${event.date}">
							<div class="input-group-addon">
								<span class="glyphicon glyphicon-th"></span>
							</div>
						</div>
					</div>
				</div>
				<input type="hidden" name="event_id" value="${event.id}">
				<!-- Success message -->
				<div class="alert alert-success" role="alert" id="success_message">
					Success <i class="glyphicon glyphicon-thumbs-up"></i> Thank you!
					Your event has been updated!
				</div>

				<!-- Button -->
				<div class="form-group">
					<label class="col-md-4 control-label"></label>
					<div class="col-md-4">
						<button type="submit" id="submit" class="btn btn-warning">
							Save <span class="glyphicon glyphicon-send"></span>
						</button>
					</div>
				</div>
			</fieldset>
		</form>
	</div>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/event.js"></script>
</body>
</html>