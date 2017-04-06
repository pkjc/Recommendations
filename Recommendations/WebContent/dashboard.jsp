<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<%
		String userID = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ((cookie.getName().equals("patID")) || (cookie.getName().equals("docID"))) {
					System.out.println("found cookie \n");
					userID = cookie.getValue();
					break;
				}
			}
		}
		if (userID == null) {
			request.setAttribute("PlsLogin", true);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	%>
	<jsp:include page="navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" role="navigation">
				<h1>
					Hello,
					<c:if test="${not empty patient.fName}">
						<c:out value="${patient.fName}" />
					</c:if>
					<c:if test="${not empty doctor.fName}">
						<c:out value="${doctor.fName}" />
					</c:if>
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