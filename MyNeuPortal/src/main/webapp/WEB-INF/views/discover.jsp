<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Discover</title>
<style>
#discover_event {
	height: 100%;
	margin: auto;
	width: 60%;
	padding: 1px 16px;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}

div.card {
	width: 18rem;
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
			<li class="nav-item active"><a class="nav-link" href="${contextPath}/home.htm">Home
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="${contextPath}/discover.htm?page=1">DISCOVER</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> ACCOUNT </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${contextPath}/user/account.htm">PROFILE</a> <a
						class="dropdown-item" href="${contextPath}/logout.htm">LOGOUT</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Something else here</a>
				</div></li>
			<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0"  method="GET" action="${contextPath}/event/search.htm">
			<input class="form-control mr-sm-2" type="text" name="keyword"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
	</nav>
	<div id="discover_event" class="container">
		<h2>.card-deck</h2>
		<div class="card-deck">
			<div class="card">
				<!-- set a width on the image otherwise it will expand to full width       -->
				<img class="card-img-top img-fluid"
					src="https://dummyimage.com/400x200/563d7c/ffffff&text=.card-img-topfff&text=.card-img-top"
					alt="Card image cap" width="400">
				<div class="card-body">
					<h4 class="card-title">${eventList[0].title}</h4>
					<p class="card-text">
						Date:${eventList[0].date}<br />Address:${eventList[0].address}
					</p>
				</div>
				<div class="card-body">
					<a
						href="${contextPath}/event/details.htm?event_id=${eventList[0].id}&from=discover"
						class="card-link">Details</a>
				</div>
			</div>
			<div class="card">
				<!-- set a width on the image otherwise it will expand to full width       -->
				<img class="card-img-top img-fluid"
					src="https://dummyimage.com/400x200/563d7c/ffffff&text=.card-img-topfff&text=.card-img-top"
					alt="Card image cap" width="400">
				<div class="card-body">
					<h4 class="card-title">${eventList[1].title}</h4>
					<p class="card-text">
						Date:${eventList[1].date}<br />Address:${eventList[1].address}
					</p>
				</div>
				<div class="card-body">
					<a
						href="${contextPath}/event/details.htm?event_id=${eventList[1].id}&from=discover"
						class="card-link">Details</a>
				</div>
			</div>
			<div class="card">
				<!-- set a width on the image otherwise it will expand to full width       -->
				<img class="card-img-top img-fluid"
					src="https://dummyimage.com/400x200/563d7c/ffffff&text=.card-img-topfff&text=.card-img-top"
					alt="Card image cap" width="400">
				<div class="card-body">
					<h4 class="card-title">${eventList[2].title}</h4>
					<p class="card-text">
						Date:${eventList[2].date}<br />Address:${eventList[2].address}
					</p>
				</div>
				<div class="card-body">
					<a
						href="${contextPath}/event/details.htm?event_id=${eventList[2].id}&from=discover"
						class="card-link">Details</a>
				</div>
			</div>
		</div>
		<br /> <br />
		<div class="card-deck">
			<div class="card">
				<!-- set a width on the image otherwise it will expand to full width       -->
				<img class="card-img-top img-fluid"
					src="https://dummyimage.com/400x200/563d7c/ffffff&text=.card-img-topfff&text=.card-img-top"
					alt="Card image cap" width="400">
				<div class="card-body">
					<h4 class="card-title">${eventList[3].title}</h4>
					<p class="card-text">
						Date:${eventList[3].date}<br />Address:${eventList[3].address}
					</p>
				</div>
				<div class="card-body">
					<a
						href="${contextPath}/event/details.htm?event_id=${eventList[3].id}&from=discover"
						class="card-link">Details</a>
				</div>
			</div>
			<div class="card">
				<!-- set a width on the image otherwise it will expand to full width       -->
				<img class="card-img-top img-fluid"
					src="https://dummyimage.com/400x200/563d7c/ffffff&text=.card-img-topfff&text=.card-img-top"
					alt="Card image cap" width="400">
				<div class="card-body">
					<h4 class="card-title">${eventList[4].title}</h4>
					<p class="card-text">
						Date:${eventList[4].date}<br />Address:${eventList[4].address}
					</p>
				</div>
				<div class="card-body">
					<a
						href="${contextPath}/event/details.htm?event_id=${eventList[4].id}&from=discover"
						class="card-link">Details</a>
				</div>
			</div>
			<div class="card">
				<!-- set a width on the image otherwise it will expand to full width       -->
				<img class="card-img-top img-fluid"
					src="https://dummyimage.com/400x200/563d7c/ffffff&text=.card-img-topfff&text=.card-img-top"
					alt="Card image cap" width="400">
				<div class="card-body">
					<h4 class="card-title">${eventList[5].title}</h4>
					<p class="card-text">
						Date:${eventList[5].date}<br />Address:${eventList[5].address}
					</p>
				</div>
				<div class="card-body">
					<a
						href="${contextPath}/event/details.htm?event_id=${eventList[5].id}&from=discover"
						class="card-link">Details</a>
				</div>
			</div>
		</div>

		<ul class="pagination justify-content-end">
			<c:if test="${page>1}">
				<li class="page-item"><a class="page-link"
					href="${contextPath}/discover.htm?page=${page-1}">Previous</a></li>
			</c:if>
			<li class="page-item"><a class="page-link"
				href="${contextPath}/discover.htm?page=${page}">${page}</a></li>
			<li class="page-item"><a class="page-link"
				href="${contextPath}/discover.htm?page=${page+1}">${page+1}</a></li>
			<li class="page-item"><a class="page-link"
				href="${contextPath}/discover.htm?page=${page+2}">${page+2}</a></li>
			<li class="page-item"><a class="page-link"
				href="${contextPath}/discover.htm?page=${page+1}">Next</a></li>
		</ul>

	</div>
</body>
</html>