<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.recom.utils.CookieChecker" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
<%
	boolean cookieFound = new CookieChecker().checkCookie(request);
	System.out.println("#### dash \n" + cookieFound);
	if (cookieFound) {
		//cookie was found so do nothing and let the user see his dashboard
	} else {
		session.setAttribute("plsLogin", true);
		response.sendRedirect("login.jsp");
	}
%>
	<jsp:include page="navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" role="">
				<c:if test="${loggedIn}">
					<div class="alert alert-info alert-dismissable" role="alert">
						You're already logged in.
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					</div>
				</c:if>
				<h1>
					Hello,
					<c:if test="${not empty patient.fName}">
						<c:out value="${patient.fName}" />
					</c:if>
					<c:if test="${not empty doctor.fName}">
						<c:out value="${doctor.fName}" />
					</c:if>
				</h1>
				<hr>
				<h4>Recent Tests</h4>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Date</th>
							<th>Results</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="doc" items="${docList}">
						<tr>
							<th scope="row">${doc.ID}</th>
							<td>${doc.fName}</td>
							<td>${doc.lName}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				
				<h4>Upcoming Appointments</h4>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Doctor</th>
							<th>Appointment Date</th>
							<th>Booked On</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Mark</td>
							<td>Mark</td>
							<td>Mark</td>
						</tr>
					</tbody>
				</table>
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