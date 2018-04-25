<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
    margin:0;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 15%;
	background-color: #f1f1f1;
	position: fixed;
	height: 100%;
	overflow: auto;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}

li a {
	display: block;
	padding: 8px 16px;
	text-decoration: none;
	font-family: 'Source Sans Pro', sans-serif;
	font-size: 14px;
	color: #666;
}

li a.active {
	background-color: #4CAF50;
	color: white;
}
li a:hover:not(.active)
{
background-color:#555;
color:white;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<ul>
		<li><a class="active" href="${contextPath}/home.htm">Home</a></li>
		<li><a href="${contextPath}/user/account.htm">Account</a></li>
		<li><a href="${contextPath}/discover.htm">Discover</a></li>
		<li><a href="">A</a></li>
	</ul>
</body>
</html>