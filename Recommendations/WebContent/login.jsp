<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.recom.utils.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<%
		boolean cookieFound = new CookieChecker().checkCookie(request);
		System.out.println("#### login \n" + cookieFound);
		if (cookieFound) {
			System.out.println("#### 3 \n");
			request.setAttribute("loggedIn", true);
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		} else {
			//cookie not found so do nothing and let the user log into his account
		}
	%>
	<jsp:include page="navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" role="navigation">
				<c:if test="${InvalidUser}">
					<div class="alert alert-danger" role="alert">Email or
						Password you entered was incorrect. Please try again.</div>
				</c:if>
				<c:if test="${logout}">
					<div class="alert alert-info" role="alert">You were
						successfully logged out.</div>
					<c:remove var="logout" scope="session" />
				</c:if>
				<c:if test="${plsLogin}">
					<div class="alert alert-warning" role="alert">Please login to
						continue.</div>
					<c:remove var="plsLogin" scope="session" />
				</c:if>
				<c:if test="${isRegSuccessful && not empty isRegSuccessful}">
					<div class="alert alert-info" role="alert">
						Registration Successful!
					</div>
				</c:if>
				<h1>Login</h1>
				<hr>
				<form class="form-horizontal" id="form" action="login" method="post">

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
								name="password" placeholder="Enter your password">
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
							<button type="submit" class="btn btn-info">Login</button>
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
		frmvalidator.addValidation("email", "req", "Please enter your email addresss");
		frmvalidator.addValidation("password", "req", "Please enter a password");
		frmvalidator.addValidation("email", "email");
	</script>
	<script src="./assets/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/ie10-viewport-bug-workaround.js"></script>
	<script src="./assets/offcanvas.js" type="text/javascript"></script>
</body>
</html>