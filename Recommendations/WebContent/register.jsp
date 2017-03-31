<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

.form-control {
	
}

h1 {
	margin-bottom: 40px;
	line-height: 115%;
}
</style>
<title>Create an Account</title>

</head>
<body>
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
				<h1>Create an Account</h1>
				
				<form class="form-horizontal" action="register" method="post">
					<div class="form-group">
						<label for="firstName" class="col-md-3 control-label">First
							Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="fName" name="fName"
								placeholder="First Name">
						</div>
					</div>
					<div class="form-group">
						<label for="lastName" class="col-md-3 control-label">Last
							Name</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="lName" name="lName"
								placeholder="Last Name">
						</div>
					</div>
					<div class="form-group">
						<label for="emailAddress" class="col-md-3 control-label">Email</label>
						<div class="col-md-9">
							<input type="email" class="form-control" id="email" name="email"
								placeholder="Email Address...">
						</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-md-3 control-label">Password</label>
						<div class="col-md-9">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Choose a Password">
						</div>
					</div>
					<div class="form-group">
						<label for="isDoctorChkBox" class="col-md-3 control-label">Are you a Doctor?</label>
						<div class="col-md-9">
							<input type="checkbox" value="" class="form-control" id="isDoctor"
								name="isDoctor" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-md-12">
							<button type="submit" class="btn btn-info">Create
								Account</button>
						</div>
					</div>
				</form>
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