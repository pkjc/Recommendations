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
		if(request.getSession().getAttribute("patID") != null){
			if(request.getAttribute("patient") == null){
				response.sendRedirect("login?patID=" + request.getSession().getAttribute("patID"));
			}
		}else if(request.getSession().getAttribute("docID") != null){
			if(request.getAttribute("doctor") == null){
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
				<c:if test="${loggedIn}">
					<div class="alert alert-info alert-dismissable" role="alert">
						You're already logged in.
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					</div>
				</c:if>
				<h1>
					Start Test
				</h1>
				<hr>
				
				
				
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