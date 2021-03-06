<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<a class="navbar-brand" href="/Recommendations">Project 337</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<c:if test="${loggedIn}">
					<li><a href="dashboard.jsp">Dashboard</a></li>
					<c:if test="${not empty patient.fName}">
						<li><a href="take-test">Start Test</a></li>
						<li><a href="tests">All Tests</a></li>
						<li><a href="appointments">All Appointments</a></li>
					</c:if>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:if test="${empty patient.fName && empty doctor.fName}">
					<li><a href="register">Register</a></li>
				</c:if>
				<c:if test="${empty patient.fName && empty doctor.fName}">
					<li class=""><a href="login">Login</a></li>
				</c:if>
				<c:if test="${not empty patient.fName || not empty doctor.fName}">
					<li><a href="logout">Logout</a></li>
				</c:if>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>