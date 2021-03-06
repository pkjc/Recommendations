<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.recom.utils.*" %>
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>

<%
	boolean cookieFound = new CookieChecker().checkCookie(request);
	if (cookieFound) {
		if(request.getSession().getAttribute("patID") != null){
			if(request.getSession().getAttribute("patient") == null){
				System.out.println("pat is : " + request.getSession().getAttribute("patient"));
				response.sendRedirect("login?patID=" + request.getSession().getAttribute("patID"));
			}
		}else if(request.getSession().getAttribute("docID") != null){
			if(request.getSession().getAttribute("doctor") == null){
				response.sendRedirect("login?docID=" + request.getSession().getAttribute("docID"));		
			}
		}
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
				<br>
				<hr/>
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
							
						</tr>
					</tbody>
				</table>
				<form action="takeTest.jsp">
							<input type="submit" value="Take Test"
                         /> 
                </form>
                <form action="dashboard.jsp">
							<input type="submit" value="View Results"
                         /> 
                </form>
                <form action="share.jsp">
							<input type="submit" value="Share Results"
                         /> 
                </form>
                <form action="DoctorSelect.jsp">
							<input type="submit" value="Scheduel Appointment"
                         /> 
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