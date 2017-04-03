<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="./assets/bootstrap2.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="./assets/ie-emulation-modes-warning.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
<!-- font Awesome -->
<!-- <link href="fonts/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
 -->
<link href="./assets/offcanvas.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.btn {
	padding: 8px 25px;
}

body {
	padding-top: 0;
}

h1 {
	margin-bottom: 40px;
	line-height: 115%;
}
</style>

<title>Dashboard</title>

</head>
<body>
	<%
		String userID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userID"))
					System.out.println("IN");
					userID = cookie.getValue();
					break;
			}
		}
		System.out.println("userID " + userID);
		if (userID == null)
			response.sendRedirect("login.jsp");
	%>
	<nav class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Project name</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#about">About</a></li>
				<li><a href="#contact">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../navbar/">Default</a></li>
				<li class="active"><a href="./">Static top <span
						class="sr-only">(current)</span></a></li>
				<li><a href="../navbar-fixed-top/">Fixed top</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" role="navigation">
				<h1>
					Hello,
					<c:out value="${patient.fName}" />
				</h1>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./assets/jquery.min.js"></script>
	<script src="./assets/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/ie10-viewport-bug-workaround.js"></script>
	<script src="./assets/offcanvas.js" type="text/javascript"></script>
</body>
</html>