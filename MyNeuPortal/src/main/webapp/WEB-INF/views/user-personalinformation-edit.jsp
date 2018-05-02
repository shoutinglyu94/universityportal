<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
#success_message {
	display: none;
}

#contact_information {
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

	<div id="contact_information" class="container">
		<h3>Personal Information</h3>
		<form class="needs-validation" method="Post" action="${contextPath}/user/personalinformation/savecontact.htm" novalidate>
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustom01">First name</label> <input
						type="text" class="form-control" name="first_name"
						id="validationCustom01" placeholder="First name"
						value="${user.firstname}" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustom02">Last name</label> <input
						type="text" class="form-control" name="last_name"
						id="validationCustom02" placeholder="Last name"
						value="${user.lastname}" required>
					<div class="valid-feedback">Looks good!</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustomUsername">Phone</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupPrepend">@</span>
						</div>
						<input type="text" class="form-control"
							id="validationCustomUsername" name="phone" value="${user.phone}"
							aria-describedby="inputGroupPrepend" required>
						<div class="invalid-feedback">Please choose a phone number.</div>
					</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustom03">City</label> <input type="text"
						class="form-control" id="validationCustom03" placeholder="City"
						name="city" value="${user.city}" required>
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustom03">Address</label> <input type="text"
						class="form-control" id="validationCustom03" placeholder="City"
						name="address" value="${user.address}" required>
					<div class="invalid-feedback">Please provide a valid city.</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-4 mb-3">
					<label for="validationCustom04">State</label> <select name="state"
						id="validationCustom04" class="form-control selectpicker" required>
						<option value=" ">Please select your state</option>
						<option>Alabama</option>
						<option>Alaska</option>
						<option>Arizona</option>
						<option>Arkansas</option>
						<option>California</option>
						<option>Colorado</option>
						<option>Connecticut</option>
						<option>Delaware</option>
						<option>District of Columbia</option>
						<option>Florida</option>
						<option>Georgia</option>
						<option>Hawaii</option>
						<option>daho</option>
						<option>Illinois</option>
						<option>Indiana</option>
						<option>Iowa</option>
						<option>Kansas</option>
						<option>Kentucky</option>
						<option>Louisiana</option>
						<option>Maine</option>
						<option>Maryland</option>
						<option>Mass</option>
						<option>Michigan</option>
						<option>Minnesota</option>
						<option>Mississippi</option>
						<option>Missouri</option>
						<option>Montana</option>
						<option>Nebraska</option>
						<option>Nevada</option>
						<option>New Hampshire</option>
						<option>New Jersey</option>
						<option>New Mexico</option>
						<option>New York</option>
						<option>North Carolina</option>
						<option>North Dakota</option>
						<option>Ohio</option>
						<option>Oklahoma</option>
						<option>Oregon</option>
						<option>Pennsylvania</option>
						<option>Rhode Island</option>
						<option>South Carolina</option>
						<option>South Dakota</option>
						<option>Tennessee</option>
						<option>Texas</option>
						<option>Uttah</option>
						<option>Vermont</option>
						<option>Virginia</option>
						<option>Washington</option>
						<option>West Virginia</option>
						<option>Wisconsin</option>
						<option>Wyoming</option>
					</select>
					<div class="invalid-feedback">Please provide a valid state.</div>
				</div>
			</div>

			<button class="btn btn-primary" type="submit">Submit form</button>
		</form>
	</div>
	<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
<!-- 
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script> -->
<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/account.js"></script> 
</body>
</html>