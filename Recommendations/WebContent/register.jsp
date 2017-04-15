<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<%
		/* boolean cookieFound = new CookieChecker().checkCookie(request);
		if (cookieFound) {
			request.setAttribute("loggedIn", true);
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		} else {
			//cookie not found so do nothing and let the user register for a new account
		} */
	%>
	<jsp:include page="navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" role="navigation">
				<c:if test="${not isRegSuccessful && not empty isRegSuccessful}">
					<div class="alert alert-warning" role="alert">
						Email address already exists!
						<c:out value="${isRegSuccessful}"></c:out>
					</div>
				</c:if>
				<h1>Create an Account</h1>
				<hr>
				<form class="form-horizontal" id="form" action=register
					method="post">
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
						<label for="isDoctorChkBox" class="col-md-3 control-label">Are
							you a Doctor?</label>
						<div class="col-md-9">
							<input type="checkbox" class="form-control" id="isDoctor"
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
	<script type="text/javascript">
		var frmvalidator = new Validator("form");
		frmvalidator.addValidation("fName", "req", "Please enter your First Name");
		frmvalidator.addValidation("lName", "req", "Please enter your Last Name");
		frmvalidator.addValidation("email", "req", "Please enter your email addresss");
		frmvalidator.addValidation("password", "req", "Please choose a password");
		frmvalidator.addValidation("fName", "maxlen=20", "Max length for First Name is 20");
		frmvalidator.addValidation("lName", "maxlen=20", "Max length for Last Name is 20");
		frmvalidator.addValidation("email", "maxlen=50", "Max length for Last Name is 50");
		frmvalidator.addValidation("email", "email");
	</script>
	<script src="./assets/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/ie10-viewport-bug-workaround.js"></script>
	<script src="./assets/offcanvas.js" type="text/javascript"></script>
</body>
</html>